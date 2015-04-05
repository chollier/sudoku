React = require('react')
BoardStore = require('../stores/BoardStore.coffee')
BoardActions = require('../actions/BoardActions.coffee')

class Box extends React.Component

  constructor: (props) ->
    super props
    @state = value: ""

  @propTypes =
    x: React.PropTypes.number.isRequired
    y: React.PropTypes.number.isRequired

  componentDidMount: ->
    BoardStore.addChangeListener(this.getStateFromStores)

  componentWillUnmount: ->
    BoardStore.removeChangeListener(this.getStateFromStores)

  getStateFromStores: =>
    @setState value: BoardStore.getValue(@props.x, @props.y)

  onChange: (event) =>
    event.preventDefault()
    BoardActions.setValue
      x: @props.x
      y: @props.y
      value: event.target.value

  render: ->
    <input
      type="text"
      style={this.style()}
      value={this.state.value}
      onChange={this.onChange}
    />

  style: ->
    width: 10

module.exports = Box
