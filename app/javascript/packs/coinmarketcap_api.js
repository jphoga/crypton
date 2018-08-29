import "currency.js";

fetch('https://api.coinmarketcap.com/v2/global/')
.then(function(response){
  return response.json();
})
.then(function(data){
  const marketCap         = document.getElementById("marketcap");
  const marketCapValue    = data.data.quotes.USD.total_market_cap;
  marketCap.innerText     = "$" + Number(marketCapValue.toFixed(0)).toLocaleString('en');

  // const lastUpdated       = document.getElementById("last-updated");
  // const lastUpdatedValue  = data.data.last_updated;
  // lastUpdated.innerText   = lastUpdatedValue;

  const btcDominance      = document.getElementById("bitcoin-dominance");
  const btcDominanceValue = data.data.bitcoin_percentage_of_market_cap;
  btcDominance.innerText  = btcDominanceValue + "%";

  const cryptoCount       = document.getElementById("cryptocurrency-number");
  const cryptoCountValue  = data.data.active_cryptocurrencies;
  cryptoCount.innerText   = Number(cryptoCountValue).toLocaleString('en');

  const dailyVolume       = document.getElementById("daily-volume");
  const dailyVolumeValue  = data.data.quotes.USD.total_volume_24h;
  dailyVolume.innerText   = "$" + Number(dailyVolumeValue.toFixed(0)).toLocaleString('en');
});

fetch('https://api.coinmarketcap.com/v2/ticker/1/')
.then(function(response){
  return response.json();
})
.then(function(data){
  const bitcoin           = document.getElementById("bitcoin-price");
  const bitcoinValue      = data.data.quotes.USD.price
  bitcoin.innerText       = "$" + Number(bitcoinValue.toFixed(0)).toLocaleString('en');

});


// Number(10000).toLocaleString('en');  // "10,000"
