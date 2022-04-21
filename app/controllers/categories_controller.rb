class Category < ApplicationRecord
  belongs_to :user
  has_many :expenditures
  validates :name, presence: true
  def total_funds
    expenditures.sum(:amount)
  end
end