Dispatcher = require('../dispatcher/Dispatcher.coffee')
EventEmitter = require('events').EventEmitter
Immutable = require('immutable')
assign = require('object-assign')
ActionTypes = require('../constants/ActionTypes.coffee')

CHANGE_EVENT = 'change'

_board = Immutable.Map()


BoardStore = assign {}, EventEmitter.prototype,

  getValue: (x, y) ->
    _board.get(x)?.get(y)

  emitChange: ->
    @emit(CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback

  dispatcherIndex: Dispatcher.register (payload) ->
    {action} = payload
    {x, y, value} = action

    switch action.type
      when ActionTypes.CHANGE_VALUE
        _board = _board.setIn([x, y], value)
        console.log _board.toString()
        BoardStore.emitChange()

    true

module.exports = BoardStore



