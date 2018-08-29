import "bootstrap";
import "currency.js";
import '../components/select2';
import showhideNews from "./news_toggle";

document.querySelectorAll(".show-news").forEach((button) => {
  console.log("start JS");
  button.addEventListener("click", (event) => {
    console.log(event.currentTarget.dataset.url);
    showhideNews(event.currentTarget.dataset.url);
    if (event.currentTarget.innerHTML === "Hide news") {
      event.currentTarget.innerHTML = "Expand news";
    } else {
      event.currentTarget.innerHTML = "Hide news";
    };
  })
})

var button = document.getElementById("back_to_dashboard");
button.addEventListener("click", (event) => {
  console.log(event);
  var postsContainer = document.querySelector('.post-partial-container');
  var prices = document.querySelector(".prices-container");
  postsContainer.style.display = "none"
  prices.style.display = "block";
  back.style.visibility = "hidden";

})



