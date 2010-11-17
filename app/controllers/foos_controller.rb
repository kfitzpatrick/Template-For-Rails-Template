class FoosController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @foos = Foo.all
  end
  
  def show
    @foo = Foo.find(params[:id])
  end
  
  def new
    @foo = Foo.new
  end
  
  def create
    @foo = Foo.new(params[:foo])
    if @foo.save
      flash[:notice] = "Successfully created foo."
      redirect_to @foo
    else
      render :action => 'new'
    end
  end
  
  def edit
    @foo = Foo.find(params[:id])
  end
  
  def update
    @foo = Foo.find(params[:id])
    if @foo.update_attributes(params[:foo])
      flash[:notice] = "Successfully updated foo."
      redirect_to @foo
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @foo = Foo.find(params[:id])
    @foo.destroy
    flash[:notice] = "Successfully destroyed foo."
    redirect_to foos_url
  end
end
