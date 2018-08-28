const showhideNews = (url) => {
    console.log("start of news_toggle")
    const prices = document.querySelector(".prices-container");
    const news = document.querySelector(".all-news-container");
    const frameContainer = document.getElementById("news-main-box");
    const buttons = document.querySelectorAll("#show-news");


    const news_frame = '<iframe style=" border: none;margin-top: 20px ; min-width: 880px; min-height: 1500px;" src="' + url + '"></iframe>'
    frameContainer.innerHTML = news_frame;

    if (prices.style.display === "none") {
        prices.style.display = "block";
        news.style.display = "none";
        buttons.forEach(function(button) {
          button.innerHTML = "Expand news";
        })
    } else {
        prices.style.display = "none";
        news.style.display = "block";
        buttons.innerHTML = "Hide news";
        buttons.forEach(function(button) {
          button.innerHTML = "Hide news";
        })
    }
}

export default showhideNews;
