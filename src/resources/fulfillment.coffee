BaseChild = require './base_child'
Metafields = require './metafield'

class Fulfillment extends BaseChild
	parent: "/orders"
	slug: "fulfillment"
	child: "/fulfillments"
	prefix: "/orders"

	constructor: (site) ->
		@metafields = new Metafields(@prefix, site)
		super(site)

	cancel: (orderId, id, callback) ->
		callback new Error 'missing id' unless id?
		url = @resource.queryString "#{@prefix}/#{parentId}#{@child}/#{id}"
		@resource.post url, @slug, callback

	delete: (orderId, id, callback) ->
		@cancel(orderId, id, callback)

module.exports = Fulfillment
