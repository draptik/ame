 class UsersController < ApplicationController

   before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
   before_filter :correct_user, :only => [:edit, :update]
   before_filter :admin_user,   :only => :destroy

   def index
     @users = User.paginate(:page => params[:page])
     @title = "All users"
   end

   def show
     @user = User.find(params[:id])
     @title = @user.name
     @accounts = @user.accounts.paginate(:page => params[:page])
   end

   def new
     @user = User.new
     @title = "Sign up"
   end

   def create
     @user = User.new(params[:user])
     if @user.save
       sign_in @user 
       redirect_to @user, :flash => { :success => "Welcome to AME!" }
     else
       @title = "Sign up"
       render :new
     end
   end

   def edit
     @title = "Edit user"
   end

   def update
     if @user.update_attributes(params[:user])
       redirect_to @user, :flash => { :success => "Profile updated" }
     else
       @title = "Edit user"
       render :edit
     end
   end

   def destroy
     User.find(params[:id]).destroy
     redirect_to users_path, :flash => { :success => "User destroyed." }
   end

   private

   # Prevent user A from editing settings of user B
   def correct_user
     # get requested user from url params...
     @user = User.find(params[:id])
     # ...and compare to current user
     redirect_to root_path unless current_user?(@user)
   end

   # Prevent non-admin users and current_user==admin from calling action 'destroy'
   def admin_user
     user = User.find(params[:id])
     redirect_to root_path if !current_user.admin? || current_user?(user)
   end
 end

