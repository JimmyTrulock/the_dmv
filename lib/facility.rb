class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')    
      if vehicle.antique? == true
        @collected_fees =+ 25
        @registered_vehicles << vehicle
      elsif vehicle.engine == :ev
        @collected_fees =+ 200
        @registered_vehicles << vehicle
      else
        @collected_fees =+ 100
        @registered_vehicles << vehicle
      end
    else
      "This facility does not register vehicles."
    end
  end
end

