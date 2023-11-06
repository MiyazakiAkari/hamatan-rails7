class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
      def index
        @lecture = Lecture.find_by(params[:id])
        @review = @lecture.review
      end
  
      def new
          @lecture = Lecture.find_by(params[:id])
          @review = Review.new
      end
  
      def edit
        @lecture = Lecture.find(params[:id])
        @review = current_user.review.find_by(id: params[:id])
      end
      
      def update
        @review = current_user.review.find(params[:id])
          if @review.update(review_params)
            flash[:notice] = "レビューの更新に成功しました"
            redirect_to reviews_path
          else
            flash[:notice] = "レビューの更新に失敗しました"
            render 'edit'
          end
      end
      
  
      def create
          @lecture = Lecture.find_by(params[:id])
      
          @review = @lecture.review.new(review_params)
          @review.user = current_user 
      
          if @review.save
            redirect_to @lecture, notice: 'レビューが作成されました。'
          else
            render 'new'
          end
      end
  
      def destroy
        @review = current_user.review.find_by(params[:id])
        if @review.destroy
            flash[:notice] = 'レビューが削除されました'
            redirect_to lectures_path
        else
            flash[:notice] = 'レビューの削除に失敗しました'
            redirect_to lectures_path
        end
      end
      
      private
      
      def review_params
          params.require(:review).permit(:title, :body, :star,:edited, :updated_at, :lecture_id, :user_id, :updated_at)
      end
  end