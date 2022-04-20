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

  def create
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.user_id = current_user.id
    @expenditure.category_id = Category.find_by_id(params[:category_id]).id
    respond_to do |format|
      if @expenditure.save
        format.html do
          redirect_to category_expenditures_path(@expenditure.category_id),
                      notice: 'expenditure was successfully created.'
        end
        format.json { render :show, status: :created, location: @expenditure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end
end
