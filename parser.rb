class Parser
  attr_reader :routes_with_ip, :response

  def initialize(routes_with_ip)
    @routes_with_ip = routes_with_ip
    @response = {}
  end

  def parse
    routes_with_ip.each { |value| parse_route_with_ip(value) }
    response
  end

private

  def parse_route_with_ip(value)
    ip, route = value.split(" - ")
    if response.key?(route)
      response[route] << ip
    else
      response[route] = [ip]
    end
  end
end
