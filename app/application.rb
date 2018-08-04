# require 'pry'
class Application
  @@items = [Item.new("Bananas",1), Item.new("Apples",2.50)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last #turns /items/Bananas to Bananas
      if item = @@items.find do |item|
        item.name == item_name
        # binding.pry
        end
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
