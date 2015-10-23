class window.Game extends Backbone.model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  playerbust: ->
    console.log @get 'playerHand' 