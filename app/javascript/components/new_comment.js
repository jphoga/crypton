function triggerComment(button) {
  console.log(button.parentNode.parentNode.parentNode.nextElementSibling)
  button.parentNode.parentNode.parentNode.nextElementSibling.classList.toggle("home_post_comment");
  let form = button.parentNode.parentNode.parentNode.nextElementSibling;
  console.log(22, form);
  form.style.display == "none" ? "block" : "none";
}

function refreshForm(innerHTML) {
  const newCommentForm = document.getElementById('new_comment');
  newCommentForm.innerHTML = innerHTML;
}

export default triggerComment(button);
