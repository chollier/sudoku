React = require('react')
BigBox = require('./BigBox.cjsx')

class Board extends React.Component

  renderBigBoxes: ->
    for x in [0..2]
      boxes = for y in [0..2]
        <BigBox x={x} y={y} />
      <div>{boxes}<br /></div>

  render: ->
    <div>
      {this.renderBigBoxes()}
    </div>

module.exports = Board
