class ApplicationController < Sinatra::Base
  set :default_content_type, :json
  get "/bakeries" do
    Bakery.all.to_json
  end
  
  get "/bakeries/:bakery_id" do
    Bakery.find(params["bakery_id"]).to_json(include: :baked_goods)
  end

  get "/baked_goods" do
    BakedGood.all.to_json
  end

  get "/baked_goods/by_price" do
    BakedGood.all.order(price: :desc).to_json
  end

  get "/baked_goods/most_expensive" do
    BakedGood.all.order(price: :desc).take.to_json
  end
end
