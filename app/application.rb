class Application

	@@items = [Item.new("shoes", 99)]

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)


	if req.path.match("/items/")

		name = req.path.split("/items/").last
		item = @@items.find do |item|
			item.name == name
		end

		if item 
			resp.write item.price
			resp.status = 200
		else
			resp.write "Item not found"
			resp.status = 400
		end
	else
		resp.write "Route not found"
		resp.status = 404
	end

	resp.finish
	end

end