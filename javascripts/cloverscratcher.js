// Generated by CoffeeScript 1.6.1
(function() {
  var Cloverscratcher, root;

  if (typeof $ !== "undefined" && $ !== null) {
    $(document).ready(function() {
      return new Cloverscratcher;
    });
  }

  Cloverscratcher = (function() {

    function Cloverscratcher() {
      var i, symbols, _i,
        _this = this;
      this.ticket = $('div#ticket');
      this.hedgehog = $('div#hedgehog');
      this.calendar = $('#calendar');
      this.yet_noticed = false;
      symbols = ['h', 'h', 'h', 'h'];
      for (i = _i = 0; _i <= 3; i = ++_i) {
        this.ticket.find('#leaf-' + i + ' p').append(symbols[i]);
      }
      this.hedgehog.on('click', function() {
        if (!_this.yet_noticed) {
          return _this.showInfo();
        }
      });
      this.ticket.on('mouseenter', '.cloverleaf p', function() {
        if (!_this.yet_noticed) {
          return _this.showInfo();
        }
      });
      this.ticket.find('.cloverleaf p').click(function(leaf_clicked_ev) {
        return _this.scratch(leaf_clicked_ev.currentTarget);
      });
    }

    Cloverscratcher.prototype.showInfo = function() {
      var toggleInfo,
        _this = this;
      toggleInfo = function() {
        _this.ticket.find('div.cloverleaf p').toggleClass('info');
        _this.hedgehog.toggleClass('info');
        return _this.hedgehog.find('em').fadeToggle();
      };
      toggleInfo();
      setTimeout(toggleInfo, 2600);
      return this.yet_noticed = true;
    };

    Cloverscratcher.prototype.scratch = function(clicked_leaf) {
      this.hedgehog.addClass('onLeaf');
      this.ticket.find(clicked_leaf).addClass('scratched').removeClass('covered');
      this.ticket.find('.cloverleaf p.scratched span').fadeOut(2000);
      if (this.ticket.find('.cloverleaf .covered').length === 0) {
        return this.finish();
      }
    };

    Cloverscratcher.prototype.finish = function() {
      var then_display_cal_and_bg_photo_, then_write_note, wait_then_hideTicket_,
        _this = this;
      wait_then_hideTicket_ = function() {
        return _this.ticket.delay(1800).fadeOut('slow', then_display_cal_and_bg_photo_);
      };
      then_display_cal_and_bg_photo_ = function() {
        $('body').addClass('discovered');
        return _this.calendar.fadeIn(3000, then_write_note);
      };
      then_write_note = function() {
        _this.calendar.find('#note').html("Mariage de<br/> Nelly & Pierre");
        new window.TypingText(document.getElementById('note'));
        return window.TypingText.runAll();
      };
      return wait_then_hideTicket_();
    };

    return Cloverscratcher;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.Cloverscratcher = Cloverscratcher;

}).call(this);
