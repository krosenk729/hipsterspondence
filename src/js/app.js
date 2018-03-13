App = {
  web3Provider: null,
  contracts: {},

  init: function(){

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

  }

  bindEvents: function(){

  }

  markProcured: function(){

  }

  handleProcure: function(){

  }


}


$(function(){
  $(window).load(function(){
    App.init();
  });
});