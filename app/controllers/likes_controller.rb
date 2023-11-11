class LikesController < ApplicationController
    def create
        @like = current_user.likes.build(like_params)
        @lecture = @like.lecture
        @like.save
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @like = Like.find_by(lecture_id: params[:lecture_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
      end
    
      private
        def like_params
          params.permit(:lecture_id)
        end
      # ===追記部分===
    
end
