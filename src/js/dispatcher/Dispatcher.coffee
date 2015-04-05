FluxDispatcher = require("flux").Dispatcher
assign = require 'object-assign'

Dispatcher = assign new FluxDispatcher(),
  handleViewAction: (action) ->
    console.log(action)
    if !action.type
      throw new Error('Empty action.type: you likely mistyped the action.')

    @dispatch
      source: 'VIEW_ACTION'
      action: action

module.exports = Dispatcher

