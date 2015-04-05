React = require('react')
Board = require('./components/Board.cjsx')
require("expose?React!react")

React.render(<Board />, document.getElementById('page'))

