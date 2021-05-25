class SearchController < ApplicationController
  def search
    restaurant_name = params[:restaurant_name]
    params = URI.encode_www_form({zipfile: restaurant_name})
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=Z011")
    xml = Net::HTTP.get(uri)
    doc = Nokogiri::XML(xml)

    doc.find('/results/shop/name').each do |i|
    puts i[@name]
    end
  end
end
