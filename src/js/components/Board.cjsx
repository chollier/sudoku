React = require('react')
BigBox = require('./BigBox.cjsx')

class Board extends React.Component

  render: ->
    <div>
      <BigBox /><BigBox /><BigBox /><br />
      <BigBox /><BigBox /><BigBox /><br />
      <BigBox /><BigBox /><BigBox />
    </div>

module.exports = Board
