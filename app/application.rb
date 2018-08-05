class Application
  @@items = [Item.new("Milk", 2.50),Item.new("Shampoo", 4.00)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      found = @@items.find{|s| s.name == item}
      if found == nil
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write found.price
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
