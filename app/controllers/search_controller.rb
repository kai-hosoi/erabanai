class SearchController < ApplicationController
  def search
    restaurant_name = params[:restaurant_name]
    params = URI.encode_www_form({zipfile: restaurant_name})
    uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=Z011")
    xml = Net::HTTP.get(uri)
    doc = Nokogiri::XML(xml)
    @name1 = doc.css("shop").first.css("> name").first.content
    @name2 = doc.css("shop")[1].css("name").first.content
    @name3 = doc.css("shop")[2].css("name").first.content
    @logo1 = doc.css("shop").first.css("> logo_image").first.content
    @logo2 = doc.css("shop")[1].css("> logo_image").first.content
    @logo3 = doc.css("shop")[2].css("> logo_image").first.content
  end
end
