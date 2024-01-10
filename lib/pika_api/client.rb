require "uri"
require "json"
require "net/http"
require "httparty"

module PikaApi
  class Client
    def initialize(api_key)
      @api_key = api_key
    end

    def generate_image_from_template(template_id, modifications, response_format = 'base64')
      endpoint_url = "#{get_base_url()}/templates/#{template_id}/images"

      data = {
        "response_format" => response_format,
        "modifications" => modifications
      }
      
      response = HTTParty.post("#{endpoint_url}", 
    		body: data.to_json,
    		headers: { 
    			'Authorization' => "Bearer #{@api_key}",
    			'Content-Type' => 'application/json'
    		}
    	)

      
      if response.code == 200
        if response_format == "base_64"
          response_body = JSON.parse(response.body)
          return response_body
        else
          return response
        end
      else
        response_body = JSON.parse(response.body)
        raise Error.new(response_body["error"])
      end
    end

    private 

    def get_base_url(version = 'v1')
      base_url = "https://api.pika.style"

      "#{base_url}/#{version}"
    end
  end
end
