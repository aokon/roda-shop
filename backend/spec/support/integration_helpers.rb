module IntegrationHelpers
  def json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
