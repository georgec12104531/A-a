class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupBoard();
  }

  bindEvents() {
    $('li').eq(2).click(e => {
      alert('hello');
    });
    this.game.playMove();
  }

  makeMove($square) {}

  setupBoard() {
    this.$el.append('<ul></ul>');
    
    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
      $('.ttt ul').append('<li>').data('pos', [rowIdx, colIdx]);
      }
    }
    
  }
  
}

module.exports = View;
