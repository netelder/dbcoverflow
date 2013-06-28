var Vote = {
  init: function() {
    Vote.onLoad();
    $('.up').on('ajax:success', this.upVote);
    $('.down').on('ajax:success', this.downVote);
  },

  onLoad: function() {
    $('.vote-buttons').each(function() {
      var value = $(this).data('vote-value');
      var $upButton = $(this).find('.up');
      var $downButton = $(this).find('.down');
      switch(value) {
        case 1:
          Vote.modifyVotes($downButton, $upButton);
        case -1:
          Vote.modifyVotes($upButton, $downButton);
      }
    });
  },

  upVote: function() {
    var $upButton = $(this);
    var $downButton = $(this).next();
    Vote.modifyVotes($upButton, $downButton);
  },

  downVote: function() {
    var $downButton = $(this);
    var $upButton = $(this).prev();
    Vote.modifyVotes($downButton, $upButton);
  },

  modifyVotes: function(live_button, disabled_button) {
    Vote.modifyLiveVote(live_button);
    Vote.modifyDisabledVote(disabled_button);
  },

  modifyLiveVote: function(live_button) {
    live_button.css('opacity', '0.5');
    live_button.prop('disabled',true);
    live_button.on("click", function(e) {
      e.preventDefault();
    });
  },

  modifyDisabledVote: function(disabled_button) {
    var voteID = disabled_button.parent().data('vote-id');
    var newLink = disabled_button.attr('href').replace(/votes\?/, 'votes/' + voteID + '?');
    disabled_button.attr('href', newLink);
    disabled_button.attr('data-method', 'put');
    disabled_button.css('opacity', '1');
    disabled_button.prop('disabled', false);
  }
};

$(document).ready(function() {
  Vote.init();
});
