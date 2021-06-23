class SearchController < ApplicationController
  def index

  end

  def search
    @search = Search.new(search_params)
      area = search_params[:place]

      budget = search_params[:budget]

      if search_params[:style] == "0"
        style = URI.encode_www_form({night_view:1})
      else
        style = URI.encode_www_form({private_room:1})
      end

      if search_params[:age] == "10" 
        if search_params[:personality] == "1"
          genre = "G007"#中華
        elsif search_params[:personality] == "2"
          genre = "G003"#創作料理
        elsif search_params[:personality] == "3"
          genre = "G009"#アジア・エスニック料理
        elsif search_params[:personality] == "4"
          genre = "G004"#和食
        end
      elsif search_params[:age] == "30"
        if search_params[:personality] == "1"
          genre = "G005"#洋食
        elsif search_params[:personality] == "2"
          genre = "G013"#お好み焼き・もんじゃ
        elsif search_params[:personality] == "3"
          genre = "G006"#イタリアン・フレンチ
        elsif search_params[:personality] == "4"
          genre = "G002"#ダイニングバー・バル
        end
      elsif search_params[:age] == "50"
        if search_params[:personality] == "1"
          genre = "G017"#韓国料理
        elsif search_params[:personality] == "2"
          genre = "G006"#洋食
        elsif search_params[:personality] == "3"
          genre = "G009"#アジア・エスニック料理
        elsif search_params[:personality] == "4"
          genre = "G001"#居酒屋
        end
      end
        #年と性格と予算と場所
        uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=#{area}&budget=#{budget}&#{style}&genre=#{genre}")
        xml = Net::HTTP.get(uri)
        doc = Nokogiri::XML(xml)
        name1 = doc.css("shop").first.css("> name").first.content
        name2 = doc.css("shop")[1].css("> name").first.content
        name3 = doc.css("shop")[2].css("> name").first.content
        logo1 = doc.css("shop").first.css("> logo_image").first.content
        logo2 = doc.css("shop")[1].css("> logo_image").first.content
        logo3 = doc.css("shop")[2].css("> logo_image").first.content
        url1 = doc.css("shop").first.css("> urls").first.content
        url2 = doc.css("shop")[1].css("> urls").first.content
        url3 = doc.css("shop")[2].css("> urls").first.content
        id1 = doc.css("shop").first.css("> id").first.content
        id2 = doc.css("shop")[1].css("> id").first.content
        id3 = doc.css("shop")[2].css("> id").first.content
        
        if search_params[:number] == "1"
          number = "G010"#各国料理
        elsif search_params[:number] == "2"
          number = "G002"#ダイニングバー・バル
        elsif search_params[:number] == "3"
          number = "G003"#創作料理
        elsif search_params[:number] == "4"
          number = "G004"#和食
        elsif search_params[:number] == "5"
          number = "G009"#アジア・エスニック料理
        elsif search_params[:number] == "6"
          number = "G006"#イタリアン・フレンチ
        elsif search_params[:number] == "7"
          number = "G007"#中華
        elsif search_params[:number] == "8"
          number = "G008"#焼肉・ホルモン
        elsif search_params[:number] == "9"
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
        url1_2 = doc2.css("shop").first.css("> urls").first.content
        url2_2 = doc2.css("shop")[1].css("> urls").first.content
        url3_2 = doc2.css("shop")[2].css("> urls").first.content
        id1_2 = doc2.css("shop").first.css("> id").first.content
        id2_2 = doc2.css("shop")[1].css("> id").first.content
        id3_2 = doc2.css("shop")[2].css("> id").first.content


        #色、睡眠時間、予算、場所
        case search_params[:color] == "0"
        when search_params[:sleep] == "0" 
          genre = "G017"#韓国料理
        when search_params[:sleep] == "1" 
          genre = "G017"#お好み焼き・もんじゃ
        when search_params[:sleep] == "2" 
          genre = "G017"#アジア・エスニック料理
        end
        case search_params[:color] == "1"
        when search_params[:sleep] == "0" 
          genre2 = "G006"#イタリアン・フレンチ
        when search_params[:sleep] == "1" 
          genre2 = "G012"#バー・カクテル
        when search_params[:sleep] == "2" 
          genre2 = "G007"#中華
        end
        case search_params[:color] == "2"
        when search_params[:sleep] == "0" 
          genre2 = "G005"#洋食
        when search_params[:sleep] == "1" 
          genre2 = "G001"#居酒屋
        when search_params[:sleep] == "2" 
          genre2 = "G011"#カラオケ・パーティ
        end
        case search_params[:color] == "3"
        when search_params[:sleep] == "0" 
          genre2 = "G004"#和食
        when search_params[:sleep] == "1" 
          genre2 = "G002"#ダイニングバー・バル
        when search_params[:sleep] == "2" 
          genre2 = "G003"#創作料理
        end

        uri3 = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=#{area}&budget=#{budget}&genre=#{genre2}")
        xml3 = Net::HTTP.get(uri3)
        doc3 = Nokogiri::XML(xml3)
        name1_3 = doc3.css("shop")[0].css("> name").first.content
        name2_3 = doc3.css("shop")[1].css("name").first.content
        name3_3 = doc3.css("shop")[2].css("name").first.content
        logo1_3 = doc3.css("shop")[0].css("> logo_image").first.content
        logo2_3 = doc3.css("shop")[1].css("> logo_image").first.content
        logo3_3 = doc3.css("shop")[2].css("> logo_image").first.content
        url1_3 = doc3.css("shop").first.css("> urls").first.content
        url2_3 = doc3.css("shop")[1].css("> urls").first.content
        url3_3 = doc3.css("shop")[2].css("> urls").first.content
        id1_3 = doc3.css("shop").first.css("> id").first.content
        id2_3 = doc3.css("shop")[1].css("> id").first.content
        id3_3 = doc3.css("shop")[2].css("> id").first.content


        #季節、予算、場所
        if search_params[:season] == "0"
          season = URI.encode_www_form({free_drink:1})
        elsif search_params[:season] == "1"
          season = URI.encode_www_form({tatami:1})
        elsif search_params[:season] == "2"
          season = URI.encode_www_form({free_food:1})
        elsif search_params[:season] == "3"
          season = URI.encode_www_form({horigotatsu:1})
        end
    

        uri4 = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=29952817473475a8&large_area=#{area}&budget=#{budget}&#{season}")
        xml4 = Net::HTTP.get(uri4)
        doc4 = Nokogiri::XML(xml4)
        name1_4 = doc4.css("shop")[0].css("> name").first.content
        name2_4 = doc4.css("shop")[1].css("> name").first.content
        name3_4 = doc4.css("shop")[2].css("> name").first.content
        logo1_4 = doc4.css("shop")[0].css("> logo_image").first.content
        logo2_4 = doc4.css("shop")[1].css("> logo_image").first.content
        logo3_4 = doc4.css("shop")[2].css("> logo_image").first.content
        url1_4 = doc4.css("shop")[0].css("> urls").first.content
        url2_4 = doc4.css("shop")[1].css("> urls").first.content
        url3_4 = doc4.css("shop")[2].css("> urls").first.content
        id1_4 = doc4.css("shop").first.css("> id").first.content
        id2_4 = doc4.css("shop")[1].css("> id").first.content
        id3_4 = doc4.css("shop")[2].css("> id").first.content


        name = [name1,name2,name3,name1_2,name2_2,name3_2,name1_3,name2_3,name3_3,name1_4,name2_4,name3_4].uniq
        selected_name = SelectStore.where(user_id:current_user.id).pluck('name')
        double_name = name & selected_name
        (0..double_name.size).each do |i|
          name.delete(double_name[i])
        end
        logo = [logo1,logo2,logo3,logo1_2,logo2_2,logo3_2,logo1_3,logo2_3,logo3_3,logo1_4,logo2_4,logo3_4].uniq
        selected_logo = SelectStore.where(user_id:current_user.id).pluck('logo')
        double_logo = logo & selected_logo
        (0..double_logo.size).each do |i|
          logo.delete(double_logo[i])
        end
        url = [url1,url2,url3,url1_2,url2_2,url3_2,url1_3,url2_3,url3_3,url1_4,url2_4,url3_4].uniq
        selected_url = SelectStore.where(user_id:current_user.id).pluck('url')
        double_url = url & selected_url
        (0..double_url.size).each do |i|
          url.delete(double_url[i])
        end

        id = [id1,id2,id3,id1_2,id2_2,id3_2,id1_3,id2_3,id3_3,id1_4,id2_4,id3_4].uniq
        selected_id = SelectStore.where(user_id:current_user.id).pluck('id')
        double_id = id & selected_id
        (0..double_id.size).each do |i|
          id.delete(double_id[i])
        end

        rundam_number = (0..name.size).to_a.sample(3)

        @name1 = name[rundam_number[0]]
        @name2 = name[rundam_number[1]]
        @name3 = name[rundam_number[2]]
        @logo1 = logo[rundam_number[0]]
        @logo2 = logo[rundam_number[1]]
        @logo3 = logo[rundam_number[2]]
        @url1 = url[rundam_number[0]]
        @url2 = url[rundam_number[1]]
        @url3 = url[rundam_number[2]]
        @id1 = id[rundam_number[0]]
        @id2 = id[rundam_number[1]]
        @id3 = id[rundam_number[2]]
        
  end

  def select_store
    @select_store = SelectStore.new
    @select_store.user_id = current_user.id
    @select_store.store_id = params[:store_id]
    @select_store.name = params[:name]
    @select_store.logo = params[:logo]
    @select_store.url = params[:url]
    @select_store.save
    redirect_to params[:url]
  end
  
end


private 
def search_params
  params.permit(:place,:budget,:style,:age,:personality,:color,:number,:sleep,:season)
end

