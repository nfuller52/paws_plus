class PhonesController < ApplicationController
  before_action :authenticate_user!

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
  end

  def edit
    @phone = Phone.current_user.find(params[:id])
  end

  def update
    @phone = Phone.current_user.find(params[:id])
  end

  def destroy
  end

  private

  def phone_params

  end
end
