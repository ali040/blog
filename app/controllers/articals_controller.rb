class ArticalsController < ApplicationController
  def index
    @ariticals = Artical.all
  end
  def new
    @articals = Artical.new
  end
  def create
    @articals = Artical.new(artical_prams)
    if @articals.save
      flash[:success] = "Object successfully created"
      redirect_to articals_path, notice: "Artical successfully created"
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
    @articals = Artical.find(params[:id])
  end
  def edit
    @articals = Artical.find(params[:id])
  end
  def update
    @articals = Artical.find(params[:id])
    if @articals.update(artical_prams)
      flash[:success] = "Object was successfully updated"
      redirect_to artical_path(@articals) ,notice: "Artical was successfully updated"
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end
  def destroy
    @articals = Artical.find(params[:id])
    if @articals.destroy
      flash[:success] = "Object was successfully deleted."
      redirect_to articals_path, notice: "Artical was successfully deleted."
    else
      flash[:error] = "Something went wrong"
      redirect_to articals_path
    end
  end

  private

  def artical_prams
    params.require(:artical).permit(:title, :body)
  end
end
