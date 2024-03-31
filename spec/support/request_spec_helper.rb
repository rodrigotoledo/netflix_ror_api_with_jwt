# spec/support/request_spec_helper.rb

module RequestSpecHelper
  def json_response
    JSON.parse(response.body)
  end
end
