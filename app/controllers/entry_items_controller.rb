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

    # def create
    #     # entry_item = EntryItem.new(entry_item_params)
    #     new_entry_item = EntryItem.new(entry_item_params)
    #     if (EntryItem.find_by(name: new_entry_item[:name]) === false)
    #         new_entry_item.save
    #     end
    #     entry_item = EntryItem.find_by(name: entry_item_params[:name])
    #     render json: entry_item, except: [:created_at, :updated_at]
    # end

    # private

    # class GetRequester
    #     def initialize(url)
    #         @url = url
    #     end
    #     def get_response_body
    #         url = URI.parse(@url)
    #         resp = Net::HTTP.get_response(url)
    #         JSON.parse(resp.body)
    #     end
    # end
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
        # json["data"].each do |entry|
        #     if (EntryItem.find_by(name: entry["name"]) === false)
        #         EntryItem.create(name: entry["name"], category: entry["category"], image_url: entry["image"])
        #     end
        # end
    end
end
