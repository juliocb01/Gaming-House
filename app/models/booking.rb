class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bootcamp

  def total_price

    days = (end_date - start_date).to_i
    bootcamp.price * days

  end

end
