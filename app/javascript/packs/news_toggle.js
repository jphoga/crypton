const showhideNews = (url) => {
    console.log("start of news_toggle")
    const prices = document.querySelector(".prices-container");
    const news = document.querySelector(".all-news-container");
    const frameContainer = document.getElementById("news-main-box");
    var postsContainer = document.querySelector('.post-partial-container');


    const news_frame = '<iframe style=" border: none;margin-top: 20px ; min-width: 880px; min-height: 1500px;" src="' + url + '"></iframe>'
    frameContainer.innerHTML = news_frame;

    if (postsContainer.style.display === "block") {
      postsContainer.style.display = "none";
      news.style.display = "block";
    } else if (prices.style.display === "block") {
      prices.style.display = "none";
      news.style.display = "block";
      // buttons.forEach(function(button) {
      //   button.innerHTML = "Expand news";
      // })
      } else {
      prices.style.display = "block";
      news.style.display = "none";
      // console.log("YYYOOOO");
      // news.style.transform = "scale(1)";
      // buttons.innerHTML = "Hide news";
      // buttons.forEach(function(button) {
      //   button.innerHTML = "Hide news";
      // })
  }
}


export default showhideNews;
