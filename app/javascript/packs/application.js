import "bootstrap";
import "currency.js";
import '../components/select2';
import showhideNews from "./news_toggle";
import setButtonToError from "./news_error";

  document.querySelectorAll(".show-news").forEach((button) => {
    button.addEventListener("click", (event) => {
      showhideNews(event.currentTarget.dataset.url);
      setButtonToError(event.currentTarget);
    })
  });


