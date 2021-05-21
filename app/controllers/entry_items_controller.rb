require 'open-uri'
require 'net/http'
require 'json' 

class EntryItemsController < ApplicationController
    @url = "https://botw-compendium.herokuapp.com/api/v2/category/equipment"
    def index
        url = URI.parse(@url)
        resp = Net::HTTP.get_response(url)
        entry_items_response = JSON.parse(resp.body)
        entry_items = entry_items_response.get_response_body
        render json: entry_items, includes: [:name, :category, :image]
    end

    def show

    end
end

class GetRequester 
    def initialize(url)
        @url = url
    end
    def get_response_body
        
    end
end




