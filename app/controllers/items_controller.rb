class ItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
    @last = Item.order("created_at desc").limit(1)
    @top = Item.group(:dispatch).count
  end

  def create
    item = Item.create(items_params)
    item.price = calculation(item.size, item.width,
                             item.weight, item.length,
                             item.height, item.dispatch,
                             item.destination)
    item.save
    if item.persisted?
      redirect_to items_path
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def calculation(size, width, weight, length, height, dispatch, destination)
    @place = Geocoder::Calculations.distance_between(Geocoder.search(dispatch).first.coordinates,
                                                     Geocoder.search(destination).first.coordinates, units: :km)
    @price = (500 + (@place * (size + weight + width + length + height))).round
  end
  private

  def items_params
    params.permit(:size, :width, :weight, :length, :height, :dispatch, :destination)
  end


end
