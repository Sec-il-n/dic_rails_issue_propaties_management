class PropertiesController < ApplicationController
  before_action :set_property, only:[:show, :edit, :update]
  def new
    @property = Property.new
    # @property.stations.build
    # @form = Form::StationCollection.new
    #フォームを指定回数表示させたい場合。
    # 2.times(@property.stations.build)
    2.times.map{@property.stations.build}
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
    # @form = Form::StaionCollection.new(station_collection_params)
    if @property.save
      redirect_to  properties_path, notice: %(物件情報を登録しました。)
    # elsif @form.save
    #   redirect_to  properties_path, notice:  %(最寄り駅を登録しました。)
    else
      flash.now[:danger]=%(登録に失敗しました。)
      render :new
    end
  end
  def update
  end
  def destroy
  end
  private
  def set_property
    @property = Property.find_by(id: params[:id])
  end
  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :note, {stations_attributes:[:line, :station_name, :minute, :property_id]})
  end
end
