class ItemsController < ApplicationController
  
  def new
    @item = [];
    
    @keyword = params[:keyword]
    if @keyword.present
      results = RakutenWebService::Ichiba::Item.search({#検索をするための記述？
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })
      
      results.each do |result|
        item = Item.find_or_initilalize_by(read(result))
        @items << item
      end
    end
  end
  
  private
  
  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    image_url = result['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128', '')
    
    return {
      code: code,
      name: name,
      url: url,
      image_url: image_url,
    }
  end
  
  
end
