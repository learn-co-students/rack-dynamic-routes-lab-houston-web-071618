class Application

@@items = [Item.new("Pears", 0.99), Item.new("Apples", 0.79)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # @@items.each do | item |
    #   resp.write "#{song.name}"
    # end

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find do | item |
            item.name == item_name
          end
          resp.write item.price
       else
         resp.write "Item not found"
         resp.status = 400
      end

    # if req.path =="/name"
    #   resp.write "#{price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
