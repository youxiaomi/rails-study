class GroupsController < ApplicationController
  def new
    @group=Group.new
  end
  def index
    @group=Group.all
  end
  def show
    @group=Group.find(params[:id])
  end
  def create
    @group=Group.new(group_params)
    group_dir = Rails.root.join('public/uploads', @group.name)
    unless  Dir.exist?(group_dir)
      Dir.mkdir(group_dir)
    end
    if @group.save
      redirect_to @group
    else
      render 'new'
    end

  end


  private
    def group_params
      params.require(:group).permit(:name)
    end
end
