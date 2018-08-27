fetch('https://api.coinmarketcap.com/v2/global/')
.then(function(response){
  return response.json();
})
.then(function(data){
  const marketCap         = document.getElementById("marketcap");
  const marketCapValue    = data.data.quotes.USD.total_market_cap;
  marketCap.innerText     = "$" + marketCapValue;

  // const lastUpdated       = document.getElementById("last-updated");
  // const lastUpdatedValue  = data.data.last_updated;
  // lastUpdated.innerText   = lastUpdatedValue;

  const btcDominance      = document.getElementById("bitcoin-dominance");
  const btcDominanceValue = data.data.bitcoin_percentage_of_market_cap;
  btcDominance.innerText  = btcDominanceValue + "%";

  const cryptoCount       = document.getElementById("cryptocurrency-number");
  const cryptoCountValue  = data.data.active_cryptocurrencies;
  cryptoCount.innerText   = cryptoCountValue;

  const dailyVolume       = document.getElementById("daily-volume");
  const dailyVolumeValue  = data.data.quotes.USD.total_volume_24h;
  dailyVolume.innerText   = "$" + dailyVolumeValue;
});

fetch('https://api.coinmarketcap.com/v2/ticker/1/')
.then(function(response){
  return response.json();
})
.then(function(data){
  const bitcoin           = document.getElementById("bitcoin-price");
  const bitcoinValue      = data.data.quotes.USD.percent_change_24h
  bitcoin.innerText       = bitcoinValue + "%";
});
