class application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items = []

    if req.path.match(/items/)
      item = req.path.split("/songs/").last
      matchItem = @@item.detect { |a|
        a.name == item
      end
      if matchItem
        resp.write "#{matchItem.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
    else
      resp.write "Route not found"
      resp.status = 400
    end
  end
end
