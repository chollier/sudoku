React = require('react')
Box = require('./Box.cjsx')

class BigBox extends React.Component

  @propTypes =
    x: React.PropTypes.number.isRequired
    y: React.PropTypes.number.isRequired

  renderBoxes: ->
    for x in [0..2]
      boxes = for y in [0..2]
        <Box x={this.props.x*3+x} y={this.props.y*3+y} />
      <div>{boxes}<br /></div>

  render: ->
    <div style={this.style()}>
      {this.renderBoxes()}
    </div>

  style: ->
    display: 'inline-block'
    border: '1px solid black'

module.exports = BigBox
