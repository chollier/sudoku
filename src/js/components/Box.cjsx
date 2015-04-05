React = require('react')

class Box extends React.Component

  @propTypes =
    x: React.PropTypes.number.isRequired
    y: React.PropTypes.number.isRequired

  render: ->
    <input type="text" />

module.exports = Box
