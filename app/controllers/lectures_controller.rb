class LecturesController < ApplicationController
    before_action :authenticate_user!, except: [:index,:home,:show]
    def index
        if params[:search]
          @lectures = Lecture.where('title LIKE ?', "%#{params[:search]}%")
        else
          @lectures = Lecture.all
        end
      end

    def home
    end

    def show
        @lecture = Lecture.find(params[:id])
        @review = Review.new
        @user = @lecture.user_id
    end

    def new
        @lecture = Lecture.new
    end
    
    def create
        @lecture = current_user.lectures.create(lecture_params)
        if @lecture.save
            flash[:notice] = "授業が登録されました"
          redirect_to @lecture
        else
          flash[:notice] = "授業の登録に失敗しました"+ @lecture.errors.full_messages.join(", ")
          render 'new'
        end
    end

    def edit
        @lecture = Lecture.find(params[:id])
    end

    def update
        @lecture = Lecture.find(params[:id])
        if @lecture.update(lecture_params)
          flash[:notice] = "授業の更新に成功しました"
          edited = true

          redirect_to @lecture
        else
          flash[:notice] = "授業の更新に失敗しました"
          render 'edit'
        end
    end

    def destroy
        @lecture = current_user.lectures.find(params[:id])
        @lecture.reviews.destroy_all
        @lecture.likes.destroy_all
        if @lecture.destroy
            flash[:notice] = '授業が削除されました'
            redirect_to lectures_path
        else
            flash[:notice] = '授業の削除に失敗しました'
            redirect_to lectures_path
        end
    end
    
    private
    def lecture_params
        params.require(:lecture).permit(:semester, :day, :time, :course, :title, :teacher, :edited, :classroom, :faculty, :user_id, :year)
    end
    
end
