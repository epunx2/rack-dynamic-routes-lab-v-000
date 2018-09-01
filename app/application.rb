class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      matchItem = @@items.detect { |a|
        a.name == item
      }
      price = matchItem.price
      if matchItem
        resp.write "#{price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 400
    end

    resp.finish
  end
end
