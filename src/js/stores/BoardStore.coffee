Dispatcher = require('../dispatcher/Dispatcher.coffee')
EventEmitter = require('events').EventEmitter
Immutable = require('immutable')
assign = require('object-assign')
ActionTypes = require('../constants/ActionTypes.coffee')

# That obviously fucks all the performance tuning
sudoku = require('sudoku')

CHANGE_EVENT = 'change'

_board = Immutable.List()
_sudoku = sudoku.makepuzzle()
for i in [0..8]
  _board = _board.set(i, Immutable.List(_sudoku.slice(i*8, i*8+8)))

findBigBox = (x, y) ->
  x: parseInt(x/3)
  y: parseInt(y/3)

BoardStore = assign {}, EventEmitter.prototype,

  getValue: (x, y) ->
    _board.get(x).get(y) || ""

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
        if value == ""
          _board = _board.setIn([x, y], undefined)
          BoardStore.emitChange()
          break

        parsedValue = parseInt(value, 10)

        if 0 < parsedValue && parsedValue <= 9

          # check row
          if _board.get(x).contains(parsedValue)
            console.log("wrong value: #{parsedValue} is already in that row")

          # check column
          if _board.map((a) -> a.get((y))).contains(parsedValue)
            console.log("wrong value: #{parsedValue} is already in that column")

          # check big box
          if _board
              .slice(3*findBigBox(x, y).x, 3*findBigBox(x, y).x+3)
              .map( (a) -> a.slice(3*findBigBox(x, y).y, 3*findBigBox(x, y).y+3) )
              .flatten()
              .contains(parsedValue)
            console.log("wrong value: #{parsedValue} is already in that big box")

          _board = _board.setIn([x, y], parsedValue)

          if _board.every( (a) -> a.toSet().size == 9 )
            console.log "board is full"

          console.log _board.toString()
          BoardStore.emitChange()

    true

module.exports = BoardStore



