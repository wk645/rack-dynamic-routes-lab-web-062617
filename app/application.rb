class Application

	def call(env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)


		if req.path.match(/items/)
			item_path = req.path.split("/items/").last
				item_found = Item.items.find {|item| item.name == item_path}
				if item_found
					resp.write item_found.price
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
