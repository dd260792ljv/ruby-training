# frozen_string_literal: true

require 'rest-client'

module ApiWrapper
  def api_create_user(user)
    response = RestClient.post "#{CommonVars::BASE_URL}users.json",
                               {
                                 "user": {
                                   "login": user.user_name,
                                   "firstname": user.first_name,
                                   "lastname": user.last_name,
                                   "mail": user.email,
                                   "password": user.password
                                 }
                               }.to_json,
                               api_headers

    raise 'User was not created via API' unless response.code == 201
  end

  def api_headers
    { content_type: :json, 'x-redmine-api-key': ENV['API_KEY'] }
  end
end
