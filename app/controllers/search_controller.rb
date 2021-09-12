class SearchController < ApplicationController
  def index

  end

  def search
    search = Search.new(search_params)
    if search.invalid?
      flash.now[:danger] = "すべての項目を入力してください"
      render 'index'
    else
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
        params = URI.encode_www_form({key: "29952817473475a8", keyword: area, budget: budget, genre: genre})
        uri = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?#{params}&#{style}")
        xml = Net::HTTP.get(uri)
        doc = Nokogiri::XML(xml)
        name = []
        logo = []
        url = []
        id = []
        (0..2).each do |i|
          if doc.css("shop")[i].nil?
            name.push("なし")
            logo.push("なし")
            url.push("なし")
            id.push("なし")
          else
            name.push(doc.css("shop")[i].css("> name").first.content)
            logo.push(doc.css("shop")[i].css("> logo_image").first.content)
            url.push(doc.css("shop")[i].css("> urls").first.content)
            id.push(doc.css("shop")[i].css("> id").first.content)
          end
        end

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
        params2 = URI.encode_www_form({key: "29952817473475a8", keyword: area, budget: budget, genre: number})
        uri2 = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?#{params2}")
        xml2 = Net::HTTP.get(uri2)
        doc2 = Nokogiri::XML(xml2)
        (0..2).each do |i|
          if doc2.css("shop")[i].nil?
            name.push("なし")
            logo.push("なし")
            url.push("なし")
            id.push("なし")
          else
            name.push(doc2.css("shop")[i].css("> name").first.content)
            logo.push(doc2.css("shop")[i].css("> logo_image").first.content)
            url.push(doc2.css("shop")[i].css("> urls").first.content)
            id.push(doc2.css("shop")[i].css("> id").first.content)
          end
        end


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

        params3 = URI.encode_www_form({key: "29952817473475a8", keyword: area, budget: budget,night_view: 1, genre: genre2})
        uri3 = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?#{params3}")
        xml3 = Net::HTTP.get(uri3)
        doc3 = Nokogiri::XML(xml3)
        (0..2).each do |i|
          if doc3.css("shop")[i].nil?
            name.push("なし")
            logo.push("なし")
            url.push("なし")
            id.push("なし")
          else
            name.push(doc3.css("shop")[i].css("> name").first.content)
            logo.push(doc3.css("shop")[i].css("> logo_image").first.content)
            url.push(doc3.css("shop")[i].css("> urls").first.content)
            id.push(doc3.css("shop")[i].css("> id").first.content)
          end
        end


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
    
        params4 = URI.encode_www_form({key: "29952817473475a8", keyword: area, budget: budget})
        uri4 = URI.parse("http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?#{params4}&#{season}")
        xml4 = Net::HTTP.get(uri4)
        doc4 = Nokogiri::XML(xml4)
        (0..2).each do |i|
          if doc4.css("shop")[i].nil?
            name.push("なし")
            logo.push("なし")
            url.push("なし")
            id.push("なし")
          else
            name.push(doc4.css("shop")[i].css("> name").first.content)
            logo.push(doc4.css("shop")[i].css("> logo_image").first.content)
            url.push(doc4.css("shop")[i].css("> urls").first.content)
            id.push(doc4.css("shop")[i].css("> id").first.content)
          end
        end

        if current_user
          name.uniq
          selected_name = SelectStore.where(user_id:current_user.id).pluck('name')
          name.delete("なし")
          double_name = name & selected_name
          (0..double_name.size).each do |i|
            name.delete(double_name[i])
          end
          logo.uniq
          logo.delete("なし")
          selected_logo = SelectStore.where(user_id:current_user.id).pluck('logo')
          double_logo = logo & selected_logo
          (0..double_logo.size).each do |i|
            logo.delete(double_logo[i])
          end
          url.uniq
          url.delete("なし")
          selected_url = SelectStore.where(user_id:current_user.id).pluck('url')
          double_url = url & selected_url
          (0..double_url.size).each do |i|
            url.delete(double_url[i])
          end
          id.uniq
          id.delete("なし")
          selected_id = SelectStore.where(user_id:current_user.id).pluck('id')
          double_id = id & selected_id
          (0..double_id.size).each do |i|
            id.delete(double_id[i])
          end
        else
          name.uniq
          name.delete("なし")
          logo.uniq
          logo.delete("なし")
          url.uniq
          url.delete("なし")
          id.uniq
          id.delete("なし")
        end

        #APIの検索結果で一つも当てはまらない場合、
        if name.empty?
          flash.now[:danger] = '検索条件に一致する結果が見つかりませんでした。もう一度入力内容を変えてお試しください。'
          render :index
        end
          
        


        rundam_number = (0..(name.size-1)).to_a.sample(3)
        @hash = []
        rundam_number.each do |i|
          @hash<<
          {
            name: name[i],
            logo: logo[i],
            url: url[i],
            id:  id[i]
          }
        end
    end
  end

  #APIを叩いてとってきた結果
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

  private 
  def search_params
    params.permit(:place,:budget,:style,:age,:personality,:color,:number,:sleep,:season)
  end
  
end


