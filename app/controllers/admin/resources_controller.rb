class Admin::ResourcesController < ApplicationController
  layout 'admin'

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(params[:resource])
    redirect_to root_path, notice: 'Resource created'
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update_attributes(params[:resource])
    redirect_to root_path, notice: 'Resource updated'
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to root_path, notice: 'Resource deleted'
  end
end
