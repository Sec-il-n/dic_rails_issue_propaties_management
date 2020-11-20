class PropertiesController < ApplicationController
  def new
    @property = Property.new
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
  private
  def set_property
    # 間違い　@property = Property.new(property_params)
  end
  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :note)
  end
end
