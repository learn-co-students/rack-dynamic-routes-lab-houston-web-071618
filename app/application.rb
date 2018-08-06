require 'pry'
class Application

  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      searched_item = req.path.split("/items/").last

      item = @@items.find{|item| item.name == searched_item}
      item ? resp.write(item.price) : resp.write("Item not found") && resp.status = 400
      
    else
      resp.write("Route not found") && resp.status = 404
    end
    binding.pry

    resp.finish
  end
end