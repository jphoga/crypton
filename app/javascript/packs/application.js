import "bootstrap";
import "currency.js";
import '../components/select2';
import showhideNews from "./news_toggle";

document.querySelectorAll(".show-news").forEach((button) => {
  console.log("start JS");
  button.addEventListener("click", (event) => {
    console.log(event.currentTarget.dataset.url);
    showhideNews(event.currentTarget.dataset.url);
  })
})


