class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
    def index
      @lecture = Lecture.find(params[:lecture_id])
      @review = Review.all
    end

    def edit
      @review = current_user.reviews.find_by(id: params[:id])
    end
    
    def update
      @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
          flash[:notice] = "レビューの更新に成功しました"
          redirect_to lecture_reviews_path
        else
          flash[:notice] = "レビューの更新に失敗しました"
          render 'edit'
        end
    end
    
    def new
      @review = Review.new
      @lecture = Lecture.find(params[:lecture_id])
    end

    def create
      @lecture = Lecture.find(params[:lecture_id])
  
      @review = @lecture.reviews.new(review_params)
      @review.user = current_user 
  
      if @review.save
        redirect_to @lecture, notice: 'レビューが作成されました。'
      else
        render 'new'
      end
  end
    def destroy
      @review = current_user.reviews.find_by(id: params[:id])
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
        params.require(:review).permit(:title, :body, :star, :updated_at)
    end

    def set_review
      @review = Review.find(params[:id])
      @lecture = Lecture.find(params[:lecture_id])
    end
end