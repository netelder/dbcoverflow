var Vote = {
  init: function() {
    Vote.onLoad();
    $(document).on('ajax:success', '.up', this.upVote);
    $(document).on('ajax:success', '.down', this.downVote);
  },

  onLoad: function() {
    $('.vote-buttons').each(function() {
      var value = $(this).data('vote-value');
      var $upButton = $(this).find('.up');
      var $downButton = $(this).find('.down');
      switch(value) {
        case 1:
          Vote.modifyVotes($upButton, $downButton);
          break;
        case -1:
          Vote.modifyVotes($downButton, $upButton);
          break;
      }
    });
  },

  upVote: function(e, data) {
    var $upButton = $(this);
    var $downButton = $(this).next();
    var that = this;
    Vote.updateScore(e, data, that, data.vote_id);
    Vote.modifyVotes($upButton, $downButton, data.vote_id);
  },

  downVote: function(e, data, that) {
    var $downButton = $(this);
    var $upButton = $(this).prev();
    var $that = $(this);
    Vote.updateScore(e, data, $that, data.vote_id);
    Vote.modifyVotes($downButton, $upButton, data.vote_id);
  },

  updateScore: function(e, data, that, vote_id) {
    console.log(data);
    score_span = $(that).parent().find('.score');
    $(score_span).html(data.updated_score);
  },

  modifyVotes: function(live_button, disabled_button, vote_id) {
    live_button.parent().attr('data-vote-id', vote_id);
    Vote.modifyLiveVote(live_button);
    Vote.modifyDisabledVote(disabled_button);
  },

  modifyLiveVote: function(live_button) {
    live_button.css('opacity', '0.5');
    live_button.attr('data-method', 'put');
    live_button.prop('disabled', true);
    live_button.on("click", function(e) {
      e.preventDefault();
    });
  },

  modifyDisabledVote: function(disabled_button) {
    var voteID = disabled_button.parent().data('vote-id');
    var newLink = disabled_button.attr('href').replace(/votes\?/, 'votes/' + voteID + '?');
    disabled_button.attr('href', newLink);
    disabled_button.prop('disabled', false);
    disabled_button.attr('data-method', 'put');
    disabled_button.css('opacity', '1');
  }
};

$(document).ready(function() {
  Vote.init();
});
