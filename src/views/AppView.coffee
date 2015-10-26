class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="nextRound-button">Play Again</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .nextRound-button': -> @render()
    'click .stand-button': -> 
      @model.get('dealerHand').models[0].attributes.revealed = true;
      @stand()
      @render()
    
  initialize: ->
    @render()

  stand: ->
    
    while @model.get('dealerHand').scores()[0] < 17 or @model.get('dealerHand').scores()[0] < 17
      @model.get('dealerHand').hit()
    playerScore = @model.get('playerHand').scores()[1] < 21 ? @model.get('playerHand').scores()[1] or @model.get('playerHand').scores()[0]
    dealerScore = @model.get('dealerHand').scores()[1] < 21 ? @model.get('dealerHand').scores()[1] or @model.get('dealerHand').scores()[0]
    if playerScore > dealerScore  and playerScore <= 21
      alert 'Player Wins'
    if dealerScore > playerScore and dealerScore <= 21
      alert 'Dealer Wins'
    if playerScore > 21
      alert 'Player Busted, House Wins'
    if dealerScore > 21 
      alert 'Dealer Busted, Player Wins'
    
    @render();

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

