ActionTypes = require('../constants/ActionTypes.coffee')
Dispatcher = require('../dispatcher/Dispatcher.coffee')

BoardActions =

  setValue: ({x, y, value}) ->
    Dispatcher.handleViewAction
      type: ActionTypes.CHANGE_VALUE
      x: x
      y: y
      value: value

module.exports = BoardActions
