class LogsController < ApplicationController
  add_breadcrumb "Home", :root_path
    add_breadcrumb "Logs", :logs_path
    def create
      @logs =Log.new(log_param)
      if@logs.save
        redirect_to @logs
      else
        render 'new'
      end
    end

    def show
      @logs = Log.find(params[:id])
    end

    def index
      @logs =Log.all
    end

    def edit
      @logs = Log.find(params[:id])
      add_breadcrumb "Edit Log"
    end

    def update
      @logs = Log.find(params[:id])
      @logs.update(log_param)
      redirect_to @logs
    end

    def destroy
      @logs = Log.destroy(params[:id])
      redirect_to @logs
    end

    private
    def logs_param
      params.require(:log).permit(:user_id, :description)
    end
  end
