import "bootstrap";
import "currency.js";
import '../components/select2';
import showhideNews from "./news_toggle";
import '..components/new_comment';


document.querySelectorAll(".show-news").forEach((button) => {
  button.addEventListener("click", (event) => {
    showhideNews(event.currentTarget.innerHTML, event.currentTarget.dataset.url);

  })
})
