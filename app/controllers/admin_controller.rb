class AdminController < ApplicationController
  add_breadcrumb "Home", :root_path
  before_action :authenticate_user!
    before_action :set_admin,only: [:show, :edit, :update, :destroy]
    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new(admin_param)
      if @admin.save
        redirect_to @admin_index_path
      else
        render 'new'
      end
    end

    def show
      @admin = Admin.find(params[:id])
    end

    def index
      @users = User.all
      @admin = User.new
    end

    def edit
      @admin = Admin.find(params[:id])
    end

    def update
      @admin = Admin.find(params[:id])
      @admin.update(admin_param)
      redirect_to @admin_index_path
    end

    def destroy
      @admin = Admin.destroy(params[:id])
      redirect_to @admin_index_path
    end
  end

