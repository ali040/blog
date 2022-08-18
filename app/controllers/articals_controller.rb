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
      redirect_to articals_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def show
    @artical = Artical.find(params[:id])
  end
  def edit
    @artical = Artical.find(params[:id])
  end
  def update
    @aritical = Artical.find(params[:id])
    if @aritical.update(artical_prams)
      flash[:success] = "Object was successfully updated"
      redirect_to artical_path(@aritical)
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end
  def destroy
    @aritical = Artical.find(params[:id])
    if @aritical.destroy
      flash[:success] = "Object was successfully deleted."
      redirect_to articals_path
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
