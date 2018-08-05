require 'pry'
class Application
  @@items = []

  def call(env)
    # binding.pry
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    returned = nil
    if req.path.match(/items/)
      @@items.each_with_index do |item, idx|
        if req.path == "/items/#{item.name}"
          returned = "price is: #{item.price}"
        else
          if returned.nil?
            returned = "Item not found"
            resp.status = 400
          else
            returned
          end
        end
      end
    else
      returned = "Route not found"
      resp.status = 404
    end

    resp.write returned.to_s
    resp.finish
  end

end
