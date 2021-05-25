# require 'open-uri'
# require 'net/http'
require 'json' 
require 'rest-client'

class EntryItemsController < ApplicationController
    @base_url = "https://botw-compendium.herokuapp.com/api/v2/"
    
    

    def index
        entry_items_unedited = fetch()
        entry_items = entry_items_unedited.map do |entry|
            reformat_entry = {category: entry["category"], image_url: entry["image"], name: entry["name"]}
        end
        puts entry_items
        render json: entry_items
    end

    def show
        
    end

    def create
        entry_item = EntryItem.new(entry_item_params)
        if entry_item.valid?
            entry_item.save
        else
            entry_item = EntryItem.find_by(name: entry_item_params["name"])
        end
        render json: entry_item
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
        params.require(:entry_item).permit(:category, :image_url, :name)
    end

    def fetch
        response = RestClient.get "https://botw-compendium.herokuapp.com/api/v2/category/equipment"
        json = JSON.parse(response)
        return json["data"]
        # json["data"].each do |entry|
        #     if (EntryItem.find_by(name: entry["name"]) === false)
        #         EntryItem.create(name: entry["name"], category: entry["category"], image_url: entry["image"])
        #     end
        # end
    end
end
