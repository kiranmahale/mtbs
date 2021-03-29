class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show destroy]

  def initiate_booking
    @screening_detail = ScreeningDetail.find_by(movie_id: params[:id])
    if @screening_detail
      @movie = @screening_detail.movie
      @screen = @screening_detail.screen
      @seat_template = @screen.seat_templates
                              .order(:seat_key)
                              .select(:id, :seat_key, :number, :seat_type, :price)
      @booked_seats = @screening_detail.bookings.pluck(:seat_number).flatten
    else
      flash[:alert] = "sorry, Screening detail are not avialable for selected movie"
      redirect_to root_path
    end
  end

  def process_booking
    params_hash = seat_booking_params.to_h
    booking_record = ActiveRecord::Base.transaction do
      current_user.bookings.create(
        screening_detail_id: params_hash[:screening_details_id],
        booking_amount: params_hash[:ticket_total],
        seat_number: params_hash[:seat]&.keys
      )
    end

    if booking_record.valid?
      redirect_to booking_path(booking_record.id)
    else
      flash[:error] = "Somehow booking is failed. Please try again after some time."
      redirect_to root_path
    end
  end

  def show
    @screening_detail = @booking.screening_detail
    @screen_name = @screening_detail.screen.name
    @time = @screening_detail.time_slot.start_end_time
    @date = @screening_detail.screening_date
    @seat_numbers = @booking.seat_number.join(', ')
    @movie = @screening_detail.movie
  end

  def destroy
    @booking&.destroy
    flash[:notice] = 'Booking cancelled..... You will get cancellation email shortly'
    redirect_to my_account_path
  end

  def seat_booking_params
    params.permit(:screening_details_id, :ticket_total, seat: {})
  end

  def find_booking
    @booking = Booking.find_by(id: params[:id])
  end
end
