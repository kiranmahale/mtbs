class UserDashboardController < ApplicationController
  def my_account
    @bookings = current_user.bookings
  end
end
