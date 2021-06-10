class SearchController < ApplicationController
  def index
    
  end
  def search
    area = params[:place]

    budget = params[:budget]
    if params[:style] == "0"
      style = URI.encode_www_form({night_view:1})
    else
      style = URI.encode_www_form({private_room:1})
    end

    if params[:age] == "10" 
      if params[:personality] == "1"
          genre = "G007"#中華
      elsif params[:personality] == "2"
        genre = "G003"#創作料理
      elsif params[:personality] == "3"
        genre = "G009"#アジア・エスニック料理
      elsif params[:personality] == "4"
        genre = "G004"#和食
      end
    elsif params[:age] == "30"
      if params[:personality] == "1"
        genre = "G005"#洋食
      elsif params[:personality] == "2"
        genre = "G013"#お好み焼き・もんじゃ
      elsif params[:personality] == "3"
        genre = "G006"#イタリアン・フレンチ
      elsif params[:personality] == "4"
        genre = "G002"#ダイニングバー・バル
      end
    elsif params[:age] == "50"
      if params[:personality] == "1"
        genre = "G017"#韓国料理
      elsif params[:personality] == "2"
        genre = "G006"#洋食
      elsif params[:personality] == "3"
        genre = "G009"#アジア・エスニック料理
      elsif params[:personality] == "4"
        genre = "G001"#居酒屋
      end
    end

      uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=#{area}&budget=#{budget}&#{style}&genre=#{genre}")
      xml = Net::HTTP.get(uri)
      doc = Nokogiri::XML(xml)
      @name1 = doc.css("shop")[0].css("> name").first.content
      @name2 = doc.css("shop")[1].css("name").first.content
      @name3 = doc.css("shop")[2].css("name").first.content
      @logo1 = doc.css("shop")[0].css("> logo_image").first.content
      @logo2 = doc.css("shop")[1].css("> logo_image").first.content
      @logo3 = doc.css("shop")[2].css("> logo_image").first.content
  end

end
