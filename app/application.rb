class Application
  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path =~ /items/
      item = req.path.split('/items/').last
      i = @@items.find { |x| x.name == item }
      resp.write i ? i.price : 'Item not found'
      resp.status = 400 unless i
    else
      resp.status = 404
      resp.write 'Route not found'
    end

    resp.finish
  end
end
