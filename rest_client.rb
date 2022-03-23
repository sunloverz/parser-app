class RestClient
  BASE_URL = 'https://report-test-app-xom.herokuapp.com/api/v2/security/report'

  def self.post(token, body)
    uri = URI(BASE_URL)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Post.new(uri)
      request['Content-Type'] = 'application/json'
      request['Authorization'] = token
      request.body = body.to_json
      http.request(request)
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
