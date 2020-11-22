class PropertiesController < ApplicationController
  before_action :set_property, only:[:show, :edit, :update, :destroy]
  def new
    @property = Property.new
    2.times.map{@property.stations.build}
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to  properties_path, notice: %(物件情報を登録しました。)
    else
      flash.now[:danger]=%(登録に失敗しました。)
      render :new
    end
  end
  def index
    @properties = Property.all
  end
  def show

  end
  def edit
    counts = @property.stations.count
    @property.stations.build
  end
  def update
    if @property.update(property_params)
      redirect_to  properties_path, notice: %(登録情報を更新しました。)
    else
      redirect_to  properties_path, notice: %(登録情報の更新に失敗しました。)
    end
  end
  def destroy
    if @property.destroy && @property.stations.destroy_all
      redirect_to properties_path, notice: %(登録情報を削除しました。)
    else
      redirect_to properties_path, notice: %(登録情報の削除に失敗しました。)
    end
  end
  private
  def set_property
    @property = Property.find_by(id: params[:id])
  end
  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :note, {stations_attributes:[:id, :line, :station_name, :minute, :property_id, :_destroy]})
  end
end
