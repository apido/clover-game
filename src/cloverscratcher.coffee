if $?
  $( document ).ready () ->
    new Cloverscratcher
class Cloverscratcher
  constructor: ->
    ## JQuery instances
    @ticket = $('div#ticket')
    @hedgehog = $('div#hedgehog')
    @calendar = $('#calendar')
    @yet_noticed = no
    ## drawSymbols
    #symbols = []
    #font_case = ['h','s','y','h']
    #for i in [0..3]
    #  symbols[i] = font_case[Math.floor(Math.random() * 4)]
    symbols = ['h','h','h','h']
    @ticket.find('#leaf-'+i+' p').append(symbols[i]) for i in [0..3]
    ## addListeners
    @hedgehog.on 'click', ()=>@showInfo() unless @yet_noticed
    @ticket.on 'mouseenter', '.cloverleaf p',()=> @showInfo() unless @yet_noticed
    @ticket.find('.cloverleaf p').click (leaf_clicked_ev) => @scratch(leaf_clicked_ev.currentTarget)
  showInfo: ->
    toggleInfo = =>
      @ticket.find('div.cloverleaf p').toggleClass 'info'
      @hedgehog.toggleClass 'info'
      @hedgehog.find('em').fadeToggle()
    toggleInfo()
    setTimeout(toggleInfo,2600,)
    @yet_noticed = yes
  scratch:(clicked_leaf) ->
    # translate hedgehog to this leaf
    @hedgehog.addClass 'onLeaf'
    @ticket.find(clicked_leaf).addClass('scratched').removeClass('covered')
    @ticket.find('.cloverleaf p.scratched span').fadeOut(2000)
    @finish() if @ticket.find('.cloverleaf .covered').length is 0
  finish: ->
    wait_then_hideTicket_= =>
      @ticket.delay(1800).fadeOut 'slow', then_display_cal_and_bg_photo_
    then_display_cal_and_bg_photo_=  =>
      $('body').addClass('discovered')
      @calendar.fadeIn 3000, then_write_note
    then_write_note = =>
      @calendar.find('#note').html "Mariage de<br/> Nelly & Pierre"
      new window.TypingText(document.getElementById('note'))
      window.TypingText.runAll()
    wait_then_hideTicket_()

root = exports ? window
root.Cloverscratcher = Cloverscratcher
