# Roda is a simple Rack-based framework with a flexible architecture based
# on the concept of a routing tree. Bridgetown uses it for its development
# server, but you can also run it in production for fast, dynamic applications.
#
# Learn more at: http://roda.jeremyevans.net

require "bridgetown-routes"
require "cable_ready"

class RodaApp < Bridgetown::Rack::Roda
  plugin :bridgetown_ssr
  plugin :bridgetown_routes

  route do
    # Process routes in server/routes and src/_routes
    Bridgetown::Rack::Routes.start! self
  end

  def cable_car
    response["Content-Type"] = "application/vnd.cable-ready.json"
    CableReady::CableCar.instance
  end
end
