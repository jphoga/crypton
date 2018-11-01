const showhideNews = (url) => {
    const prices = document.querySelector(".prices-inner-container");
    prices.setAttribute("style", "display: none;");
    const temporaryContainer = document.querySelector("#temporary-container");
    var backButton = `<div class="prices-back-left"> <a data-remote="true" href='/prices'> <span><i class="fas fa-angle-double-left"></i> Dashboard</span></a></div>`
    var news_frame = '<iframe style="border: none; min-width: 880px; min-height: 1500px;" src="' + url + '"></iframe>'
    temporaryContainer.innerHTML = backButton + news_frame;
}

export default showhideNews;

