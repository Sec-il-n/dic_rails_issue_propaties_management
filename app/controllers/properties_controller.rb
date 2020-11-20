class PropertiesController < ApplicationController
  before_action :set_property, only:[:show, :edit, :update]
  def new
    @property = Property.new
    @property.stations.build
    #フォームを指定回数表示させたい場合。
    # 2.times(@property.stations.build)
  end
  def show

  end
  def index
    @properties = Property.all
  end
  def edit
  end
  def create
    @property = Property.new(property_params)
    unless @property.save then
      render :new
    else
      redirect_to  properties_path, notice: '物件情報を登録しました。'
    end
  end
  def update
  end
  def destroy
  end
  private
  def set_property
    @property = Property.find_by(params[:id])
  end
  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :note, stations_attributes:[:line, :station_name, :minute, :property_id])
    # params.require(:property).permit(:name, :price, :address, :age, :note)
  end
end
