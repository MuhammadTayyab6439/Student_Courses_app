class StudentsController < ApplicationController
    before_action :require_user, only:[:edit,:update]
    before_action :require_same_user, only:[:edit,:update]
    def show 
        @student=Student.find(params[:id])
    end
    def index
        @students=Student.all
    end
    def new 
        @student=Student.new
    end

    def edit 
        @student=Student.find(params[:id])
    end
    def create 
        @student=Student.new(params.require(:student).permit(:name, :email, :password, :confirm_password))
        if @student.save
            flash[:notice]="Student created successfully"
            redirect_to students_path
        else
            render 'new'
        end
    end
    def update 
        @student=Student.find(params[:id])
       if @student.update(params.require(:student).permit(:name, :email, :password, :password_confirmation))
            flash[:notice]="Successfully updated"
            redirect_to @student
        else
            render 'edit'
        end
    end

    private
    def require_same_user
        @student=Student.find(params[:id])
        if current_user.id !=@student.id
            flash[:notice]="you are not allowed for this action"
            redirect_to root_path
        end
    end
end