class HomeController < ApplicationController
  def index
    if current_user
      @redirect_toadmin_index_path
    end
  end
end
