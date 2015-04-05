React = require('react')
Box = require('./Box.cjsx')

class BigBox extends React.Component

  render: ->
    <div style={this.style()}>
      <Box /><Box /><Box /><br />
      <Box /><Box /><Box /><br />
      <Box /><Box /><Box />
    </div>

  style: ->
    display: 'inline-block'
    border: '1px solid black'

module.exports = BigBox
