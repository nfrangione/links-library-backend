# require 'open-uri'
# require 'net/http'
require 'json' 
require 'rest-client'

class EntryItemsController < ApplicationController
    @base_url = "https://botw-compendium.herokuapp.com/api/v2/"
    
    

    def index
        entry_items_unedited = fetch()
        entry_items = entry_items_unedited.map do |entry|
            reformat_entry = {category: entry["category"], image_url: entry["image"], name: entry["name"], original_id: entry["id"]}
        end
        render json: entry_items
    end

    def create
        entry_item = EntryItem.new(entry_item_params)
        if entry_item.valid?
            entry_item.save
        else
            entry_item = EntryItem.find_by(name: entry_item_params["name"])
        end
        render json: entry_item, include: [:user_notes]
    end

    private
    def entry_item_params
        params.require(:entry_item).permit(:category, :image_url, :name, :original_id)
    end

    def fetch
        response1 = RestClient.get "https://botw-compendium.herokuapp.com/api/v2/category/equipment"
        json1 = JSON.parse(response1)

        response2 = RestClient.get "https://botw-compendium.herokuapp.com/api/v2/category/monsters"
        json2 = JSON.parse(response2)

        response3 = RestClient.get "https://botw-compendium.herokuapp.com/api/v2/category/materials"
        json3 = JSON.parse(response3)

        json4 = json1["data"] + json2["data"] + json3["data"]

        return json4
    end
end
