require 'active_support/concern'

module PropertyConcern
  extend ActiveSupport::Concern

  def set_property
    @property = Property.find_by(id: params[:id])
  end
  def property_params
    params.require(:property).permit(:name, :price, :address, :age, :note, {stations_attributes:%i(id, line, station_name, minute, property_id, _destroy)})
  end
end
