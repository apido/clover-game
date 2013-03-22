if $?
  $( document ).ready () ->
    new Cloverscratcher
class Cloverscratcher
  constructor: ->
    ## JQuery instances
    @ticket = $('div#ticket')
    @hedgehog = $('div#hedgehog')
    @calendar = $('#calendar')
    @to_notice = yes
    ## drawSymbols
    #symbols = []
    #font_case = ['h','s','y','h']
    #for i in [0..3]
    #  symbols[i] = font_case[Math.floor(Math.random() * 4)]
    symbols = ['h','h','h','h']
    @ticket.find('#leaf-'+i+' p').append(symbols[i]) for i in [0..3]
    ## addListeners
    @hedgehog.on 'click', ()=> @showInfo()
    @ticket.on 'mouseenter', '.cloverleaf p',()=> @showInfo()
    @ticket.find('.cloverleaf p').click (leaf_clicked_ev) => @scratch(leaf_clicked_ev.currentTarget)
  showInfo: ->
    if @to_notice
      @to_notice = no
      toggleInfo = =>
        @ticket.find('div.cloverleaf p').toggleClass 'info'
        @hedgehog.toggleClass 'info'
        @hedgehog.find('.notice').fadeToggle()
      toggleInfo()
      setTimeout(toggleInfo,2600,)
  scratch:(clicked_leaf) ->
    @hedgehog.find('.notice').hide()
    # move #hedgehog element into this leaf
    @ticket.find(clicked_leaf).append @hedgehog.removeClass('onTop').addClass 'onLeaf'
    # scratch #hedgehog
    # move #hedgehog back
    move = (dist) =>
      @hedgehog.find('img').animate
        right: dist
    move(px) for px in [30,-25,25,-30]
    @ticket.find(clicked_leaf).addClass('scratched').removeClass('covered')
    @ticket.find('.cloverleaf p.scratched span').fadeOut(2000)
    @finish() if @ticket.find('.cloverleaf .covered').length is 0
  finish: ->
    wait_then_hideTicket_= =>
      @ticket.delay(2800).fadeOut 'slow', then_display_cal_and_bg_photo_
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
