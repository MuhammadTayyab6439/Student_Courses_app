class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||=Student.find(session[:student_id] ) if session[:student_id]
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:notice]="You need to login first before doing this action"
        end
    end
end
