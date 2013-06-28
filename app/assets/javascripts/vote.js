var Vote = {
  init: function() {

    $('.up').on('ajax:success', this.upVote);
    $('.down').on('ajax:success', this.downVote);
  },
  upVote: function() {
    var $upButton = $(this);
    var $downButton = $(this).next();
    var voteID = $(this).parent().data('vote-id');
    console.log($downButton);
    $upButton.css('opacity', '0.5');
    $upButton.prop('disabled',true);
    $upButton.on("click",function(e){
      e.preventDefault();
    });
    newLink = $downButton.attr('href').replace(/votes\?/,'votes/' + voteID + '?');
    $downButton.attr('href',newLink);
    $downButton.attr('data-method','put');
    $downButton.css('opacity', '1');
    $downButton.prop('disabled', false);
  },
  downVote: function() {

    var $downButton = $(this);
    var $upButton = $(this).prev();
    var voteID = $(this).parent().data('vote-id');
    $downButton.css('opacity', '0.5');
    $downButton.prop('disabled',true);
    $downButton.on("click",function(e){
      e.preventDefault();
    });
    newLink = $upButton.attr('href').replace(/votes\?/,'votes/' + voteID + '?');
    $upButton.attr('href',newLink);
    $upButton.attr('data-method','put');
    $upButton.css('opacity', '1');
    $upButton.prop('disabled', false);
  }
}

var currentVotes = {
  init: function(){
    $('.vote-buttons').each(function(){
      var value = $(this).data('vote-value');
      var $upButton = $(this).find('.up');
      var $downButton = $(this).find('.down');
      var voteID = $(this).data('vote-id');
      var newLink;
      if(value === 1){
        $upButton.css('opacity', '0.5');
        $upButton.prop('disabled',true);
        $upButton.on("click",function(e){
          e.preventDefault();
        });
        newLink = $downButton.attr('href').replace(/votes\?/,'votes/' + voteID + '?');
        $downButton.attr('href',newLink);
        $downButton.attr('data-method','put');
      }
      else if(value === -1){
        $downButton.css('opacity', '0.5');
        $downButton.prop('disabled',true);
        $downButton.on("click",function(e){
          e.preventDefault();
        });
        newLink = $upButton.attr('href').replace(/votes\?/,'votes/' + voteID + '?');
        $upButton.attr('href',newLink);
        $upButton.attr('data-method','put');
      }
    });
  }
};

$(document).ready(function() {
  currentVotes.init();
  Vote.init();
});
