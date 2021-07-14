class FriendRequestsController < ApplicationController
    def create
        request = current_user.sent_friend_requests.build(requestee_id: params[user_id])

        if request.save
            flash.notice = "Successfully sent friend request!"
        else
            flash.notice = "Error sending request.  Please try again."
        end

        redirect_to user_path(params[:user_id])
    end

    def destroy
        friend_request = FriendRequest.find_by(id: params[:id])
        friend_request.decline
        redirect_to request.referrer
    end
end
