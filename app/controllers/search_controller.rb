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
      #年と性格と予算と場所
      uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=#{area}&budget=#{budget}&#{style}&genre=#{genre}")
      xml = Net::HTTP.get(uri)
      doc = Nokogiri::XML(xml)
      name1 = doc.css("shop").first.css("> name").first.content
      name2 = doc.css("shop")[1].css("name").first.content
      name3 = doc.css("shop")[2].css("name").first.content
      logo1 = doc.css("shop").first.css("> logo_image").first.content
      logo2 = doc.css("shop")[1].css("> logo_image").first.content
      logo3 = doc.css("shop")[2].css("> logo_image").first.content
      
      if params[:number] == "1"
        number = "G010"#各国料理
      elsif params[:number] == "2"
        number = "G002"#ダイニングバー・バル
      elsif params[:number] == "3"
        number = "G003"#創作料理
      elsif params[:number] == "4"
        number = "G004"#和食
      elsif params[:number] == "5"
        number = "G009"#アジア・エスニック料理
      elsif params[:number] == "6"
        number = "G006"#イタリアン・フレンチ
      elsif params[:number] == "7"
        number = "G007"#中華
      elsif params[:number] == "8"
        number = "G008"#焼肉・ホルモン
      elsif params[:number] == "9"
        number = "G013"#ラーメン
      end

      #数字と予算と場所
      uri2 = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=#{area}&budget=#{budget}&genre=#{number}")
      xml2 = Net::HTTP.get(uri2)
      doc2 = Nokogiri::XML(xml2)
      name1_2 = doc2.css("shop")[0].css("> name").first.content
      name2_2 = doc2.css("shop")[1].css("name").first.content
      name3_2 = doc2.css("shop")[2].css("name").first.content
      logo1_2 = doc2.css("shop")[0].css("> logo_image").first.content
      logo2_2 = doc2.css("shop")[1].css("> logo_image").first.content
      logo3_2 = doc2.css("shop")[2].css("> logo_image").first.content

      name = [name1,name2,name3,name1_2,name2_2,name3_2]
      logo = [logo1,logo2,logo3,logo1_2,logo2_2,logo3_2]
      rundam_number = []
      3.times do |i|
        rundam_number.push(rand(0..name.size-1))
        #ランダムに選んだ数がかぶってしまう
      end
      @name1 = name[rundam_number[0]]
      @name2 = name[rundam_number[1]]
      @name3 = name[rundam_number[2]]
      @logo1 = logo[rundam_number[0]]
      @logo2 = logo[rundam_number[1]]
      @logo3 = logo[rundam_number[2]]
      # @name1,@name2,@name3 = name.sample(3)



      

      
  end

end
