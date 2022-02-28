class SessionsController < ApplicationController

    def new
    end

    def create 

        student=Student.find_by(email: params[:sessions][:email] )
        if student && student.authenticate(params[:sessions][:password])
            session[:student_id]=student.id
            flash[:notice]="successfully logged in"
            redirect_to student
        else
            flash.now[:notice]="something was wrong with your information"
            render 'new'
        end

    end

    def destroy
        session[:student_id]=nil
        flash[:notice]="logged out successfuly"
        redirect_to root_path
    end
end