class ImagesController < ApplicationController
  def create
    @group=Group.find(params[:group_id])
    File.open(Rails.root.join('public/uploads', @group.name, uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    params[:image][:url]='/uploads/'+@group.name+'/'+uploaded_io.original_filename
    # @group=Group.find(params[:group_id])
    @image=@group.images.create(url_params)
    # @image.save
    redirect_to group_image_path(@group,@image)
  end
  def show
    @group=Group.find(params[:group_id])
    @image=@group.images.find(params[:id])
  end
  private
    def url_params
      params.require(:image).permit(:url)
    end
end
