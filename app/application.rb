# class Application
#   @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     # if req.path == "/items/"
#       if req.path.match(/items/)
#         item_lookup = req.path.split("/items/").last
#         resp.write findItem(item_lookup)
#       #elsif req.path.match(/cart/)
#       #elsif req.path.match(/add/)
#       else
#         resp.write "Item not found."
#         resp.status = 404
#       end#if
#     # else
#     #   resp.write "Route not found!"
#     #   resp.status = 404
#     # end#error_ifelse
#     resp.finish
#   end#call
#
#
#   def findItem(item_lookup)
#       if item =@@items.find{|i| i.name == item_lookup}
#         resp.write item.price
#       else
#         resp.status = 400
#         resp.write "Item not found"
#       end#ifelse
#   end#findItem
# end#Application

# had to look at the solution for this one. I have a feeling my code does something similar but the specs wanted something else. I think by making a separate method to test whether the items exist made it lose sight of some variables. Will test again.

class Application

  @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item =@@items.find{|i| i.name == item_name}
        resp.write item.price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status=404
      resp.write "Route not found"
    end
    resp.finish
  end

end
