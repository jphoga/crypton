import "currency.js";

// const fetchMarketCap = () => {
fetch('https://api.coinmarketcap.com/v2/global/')
.then(function(response){
  return response.json();
})
.then(function(data){
  const marketCap          = document.getElementById("marketcap");
  const marketCapValue     = data.data.quotes.USD.total_market_cap;
  if (marketCap) {
    marketCap.innerText    = "$" + Number(marketCapValue.toFixed(0)).toLocaleString('en');
  }

  // const lastUpdated       = document.getElementById("last-updated");
  // const lastUpdatedValue  = data.data.last_updated;
  // lastUpdated.innerText   = lastUpdatedValue;

  const btcDominance       = document.getElementById("bitcoin-dominance");
  const btcDominanceValue  = data.data.bitcoin_percentage_of_market_cap;
  if (btcDominance) {
    btcDominance.innerText = btcDominanceValue + "%";
  }

  const cryptoCount       = document.getElementById("cryptocurrency-number");
  const cryptoCountValue  = data.data.active_cryptocurrencies;
  if (cryptoCount) {
    cryptoCount.innerText = Number(cryptoCountValue).toLocaleString('en');
  }

  const dailyVolume       = document.getElementById("daily-volume");
  const dailyVolumeValue  = data.data.quotes.USD.total_volume_24h;
  dailyVolume.innerText   = "$" + Number(dailyVolumeValue.toFixed(2)).toLocaleString('en');
});
// }

let currentValue = 0;

const fetchBitcoin = () => {
  fetch('https://api.coinmarketcap.com/v2/ticker/1/')
  .then(function(response){
    return response.json();
  })
  .then(function(data){
    var bitcoin           = document.getElementById("bitcoin-price");
    const bitcoinValue      = Number(data.data.quotes.USD.price.toFixed(2)).toLocaleString('en');
    const bitcoinUnformat   = parseFloat(bitcoinValue.replace(/,/g, ""), 10)
    const bitcoinPrevValue  = parseFloat(bitcoin.innerText.substr(1).replace(/,/g, ""), 10);

    console.log("old value");
    console.log(bitcoinPrevValue);
    console.log("new value");
    console.log(bitcoinUnformat);

    if(bitcoinUnformat > bitcoinPrevValue){
      bitcoin.innerText  = "$" + bitcoinValue
      bitcoin.classList.add('highlight-green');
    }else if(bitcoinUnformat < bitcoinPrevValue){
      bitcoin.innerText  = "$" + bitcoinValue;
      bitcoin.classList.add('highlight-red')
    }else{
      bitcoin.classList.remove('highlight-green');
      bitcoin.classList.remove('highlight-red')
      bitcoin.innerText  = "$" + bitcoinValue;
  }

    const btcChange         = document.getElementById("bitcoin-change");
    const btcChangeValue    = data.data.quotes.USD.percent_change_24h
    if(btcChange){
      btcChange.innerText   = btcChangeValue + "%";
    }
  });
}

fetchBitcoin();
setInterval(fetchBitcoin, 10000);
// setInterval(fetchMarketCap, 1000);

// Number(10000).toLocaleString('en');  // "10,000"
