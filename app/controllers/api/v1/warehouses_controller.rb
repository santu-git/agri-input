class Api::V1::WarehousesController < Api::V1::BaseController
  def index
    @appointments = @current_user.designations.last.appointments.warehouses
  end
end
  