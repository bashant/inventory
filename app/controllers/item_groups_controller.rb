class ItemGroupsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "ItemGroups", :item_groups_path
  def new
    add_breadcrumb "New", :new_item_group_path
    @item_groups = ItemGroup.new
  end

  def create
    @item_groups = ItemGroup.new(item_groups_param)
    if @item_groups.save
      @log = Log.create(description: "Added new itemgroup"+" "+@item_groups.name, user: current_user)
      redirect_to @item_groups
    else
      render 'new'
    end
  end

  def show
    @item_groups = ItemGroup.find(params[:id])
  end

  def index
    @item_groups = ItemGroup.all
  end


  def edit
    @item_groups = ItemGroup.find(params[:id])
    @log = Log.create(description: "Edited new itemgroup"+" "+@item_groups.name, user: current_user)
  end

  def update
    @item_groups = ItemGroup.find(params[:id])
    @item_groups.update(item_groups_param)
    redirect_to @item_groups
  end

  def destroy
    @item_groups = ItemGroup.destroy(params[:id])
    @log = Log.create(description: "Deleted new itemgroup"+" "+@item_groups.name, user: current_user)
    redirect_to @item_groups
  end
  def manage_item_groups
    @title="manage item_groups"
    @item_groups = ItemGroup.all
    add_breadcrumb "manage item_groups", :item_groups_path
  end

  private
  def item_groups_param
    params.require(:item_group).permit(:name, :parent, :description)
  end

end

