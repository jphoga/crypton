const showhideNews = (button, url) => {
    console.log("start of news_toggle")
    const prices = document.querySelector(".prices-container");
    const news = document.querySelector(".all-news-container");
    const frameContainer = document.getElementById("news-main-box");
    const buttons = document.querySelectorAll(".show-news")
    var postsContainer = document.querySelector('.post-partial-container');


    const news_frame = '<iframe style=" border: none;margin-top: 20px ; min-width: 880px; min-height: 1500px;" src="' + url + '"></iframe>'
    frameContainer.innerHTML = news_frame;

    if (postsContainer.style.display === "block") {
      postsContainer.style.display = "none";
      news.style.display = "block";
      console.log("inside if");

    } else if (prices.style.display === "block") {
      prices.style.display = "none";
      news.style.display = "block";
      console.log("inside else if");

  } else {
      news.style.display = "none";
      prices.style.display = "block";
      console.log("inside else");
  }
}


export default showhideNews;
