GuestReviewsController < ApplicationController
 
def create
  # step1: check if the reservation exist (room_id, host_id, host_id)

  # step2: check if the current host already reviewed the guest in this reservation

  @reservation = Reservation.where(
                    id: guest_review_params[:reservation_id],
                    room_id: guest_review_params[:room_id]
                    )

  if !@reservation.nil? && @reservation.room.user.id == guest_review_params[:host_id].to_i
    @has_reviewed = GuestReview.where(
                      reservation_id: @reservation.id,
                      host_id: guest_review_params[:host_id]
                      ).first

    if @has_reviewed.nil?
        #allow to review
        @guest_review = current_user.guest_reviews.create(guest_review_params)
        flash[:success] = "レビューを作成しました"
    else
      # already reviewed
        flash[:success] = "すでにレビューがありました"
    end
  else
    flash[:alert] = "予約情報が見つかりません"
  end

  redirect_back(fallback_location: request.referer)
end

def destroy
  @guest_review = Review.find(params[:id])
  @guest_review.destroy

  redirect_back(fallback_location: request.referer, notice: "Removed")
end


private

    def guest_review_params
      params.require(:guest_review).permit(:comment, :star, :room_id, :reservation_id, :host_id)
    end
end
