# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# url1 = "https://botw-compendium.herokuapp.com/api/v2/category/equipment"
# url2 = "https://botw-compendium.herokuapp.com/api/v2/category/monsters"
# url3 = 


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


# entries = GetRequester.new(@url)
# entries_body = entries.get_response_body
# entries_body.each do |entry| 
#     EntryItem.create(name: entry["name"], category: entry["category"], image_url: entry["image"]) : nil 
# end