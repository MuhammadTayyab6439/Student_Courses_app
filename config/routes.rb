Rails.application.routes.draw do
  root 'courses#index'
  get 'courses/new', to:'courses#new'
  get 'about', to:'pages#about'
  resources :students 
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'logout', to:'sessions#destroy'
  post 'course_enroll', to:'student_courses#create'
end
