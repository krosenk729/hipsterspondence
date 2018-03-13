App = {
  web3Provider: null,
  contracts: {},

  init: function(){
    // lost stickers
    $.getJSON('../stickers.json', function(data){
      var stickerRow = $('#stickerRow');
      var stickerTemplate = $('#stickerTemplate');

      // create fragment and append to html
      for(let sticker of data){
        stickerTemplate.find('.title').text(sticker.name);
        stickerTemplate.find('img').attr(sticker.picture);
        stickerTemplate.find('.specialty').text(sticker.specialty);
        stickerRow.append(stickerTemplate.html());
      }
    });

    return App.initWeb3();
  }

  initWeb3: function(){
    // Is there an injected web3 instance?
    if (typeof web3 !== "undefined") {
      App.web3Provider = web3.currentProvider;
    } else {
      // If no injected web3 instance is detected, fall back to Ganache
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);
    return App.initContract();
  }

  initContract: function(){
    // instantiate artifact file with truffle-contract 
    // set provider of contract
    // use contract to mark procured stickers
    $.getJSON('Procurement.json', function(data){
      var ProcurementArtifact = data;
      App.contracts.Procurement = TruffleContract(ProcurementArtifact);
      App.contracts.Procurement.setProvider(App.web3Provider);
      return App.markProcured();
    });
    return App.bindEvents();
  }

  bindEvents: function(){
    $(document).on('click', '.btn-procure', App.handleProcure);
  }

  markProcured: function(stickees, account){
    var procurementInstance;
    App.contracts.Procurement.deployed()
    .then(function(instance){
      procurementInstance = instance;
      return procurementInstance.getStickees.call();
    })
    .then(function(stickees){
      for(i = 0 ; i < stickees.length; i++){
        // check to see if address is stored for sticker
        // sync UI to reflect where sticker is procured 
        if(stickees[i] !== '0x0000000000000000000000000000000000000000'){
          $('.panel-sticker').eq(i).find('button').text('Sticked Already').attr('disabled', true);
        }
      }
    })
    .catch(function(err){
      console.log('error with marking stickers procured', err.message);
    });
  }

  handleProcure: function(event){
    event.preventDefault();
    var stickerId = parseInt($(event.target).data('id'));
  }


}


$(function(){
  $(window).load(function(){
    App.init();
  });
});