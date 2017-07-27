jQuery ->  
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))  
  order.setupForm()  

order =  
  setupForm: ->  
    $('#new_order').submit (ev) ->
      ev.preventDefault()
      $('input[type=submit]').attr('disabled', true)  
      order.processCard() 

  processCard: ->  
    card =  
      number: $('#card_number').val()  
      cvc: $('#card_code').val()  
      expMonth: $('#card_month').val()  
      expYear: $('#card_year').val()  
    Stripe.createToken(card, order.handleStripeResponse)  

  handleStripeResponse: (status, response) ->  
    if status == 200
      $('#new_order').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      $('#new_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message).show()
      $('input[type=submit]').attr('disabled', false)
