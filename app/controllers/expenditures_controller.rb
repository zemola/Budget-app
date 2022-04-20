class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[show edit update destroy]

  # GET /expenditures or /expenditures.json
  def index
    @category = Category.find(params[:category_id])
    @expenditures = @category.expenditures.order(created_at: :desc)
    @total_amount = @expenditures.sum(:amount)
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show; end

  # GET /expenditures/new
  def new
    @user = current_user
    @category = Category.find(params[:category_id])
    @expenditure = Expenditure.new
  end
end
