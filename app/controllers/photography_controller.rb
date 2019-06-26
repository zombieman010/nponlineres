class PhotographyController < ApplicationController

  def index

    @dropdown = ['None', 'Animals','Astrophotography','Portrait', 'General Session',
                 'Graduation', 'Landscapes', 'Travel', 'Sports', 'Cars']

    filter = params[:filter].to_s

    if ['Animals','Astrophotography','Portrait', 'General Session',
        'Graduation', 'Landscapes', 'Travel', 'Sports', 'Cars' ].include? filter
      filter = filter
    else
      filter = nil
    end

    if filter == nil || filter == "None"
      @photos = Photo.where("category != 'Engagement'").where("category != 'Wedding'").paginate(page: params[:page], per_page: 4).
          order('id DESC')
    else
      @photos = Photo.where("category != 'Engagement'").where("category != 'Wedding'").where("category = '#{filter}'")
                    .paginate(page: params[:page], per_page: 4).order('id DESC')
    end
  end

  def wedding
    @photos = Photo.where("category = 'Wedding'").paginate(page: params[:page], per_page: 50).order('id DESC')
  end

  def engagement

  end

  def new
    if logged_in? && admin?
      @photo = Photo.new
    else
      redirect_to root_path
      flash[:danger] = "More permissions required."
    end
  end

  def create
    if logged_in? && admin?
      @photo = Photo.new(photo_params)
      if @photo.save
        redirect_to photography_add_photo_path
        flash[:success] = "Photo added!"
      end
    end
  end

  def edit
    if logged_in? && admin?
      @photo = Photo.find(params[:id])
    else
      redirect_to root_path
      flash[:danger] = "More permissions required."
    end
  end

  def update
    if logged_in? && admin?
      @photo = Photo.find(params[:id])
      @photo.update(photo_params)
      redirect_to photography_path
      flash[:success] = "Photo updated!"
    else
      redirect_to root_path
      flash[:danger] = "More permissions required."
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    if logged_in? && admin?
      @photo = Photo.find(params[:id])
      @photo.destroy
      redirect_to photography_path
      flash[:success] = "Photo deleted."
    end
  end

  private

  def admin?
    current_user.admin == true
  end

  def photo_params
    params.require(:photo).permit(:name, :link, :category, :description, :filter)
  end

end
