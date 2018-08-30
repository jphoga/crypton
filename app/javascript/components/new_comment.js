function triggerComment(button) {
  console.log(button.parentNode.parentNode.parentNode.nextElementSibling)
  button.parentNode.parentNode.parentNode.nextElementSibling.classList.toggle("home_post_comment");
  let form = button.parentNode.parentNode.parentNode.nextElementSibling;
  console.log(22, form);
  form.style.display == "none" ? "block" : "none";
}

function refreshFormSmall(innerHTML, id) {
  const newCommentForms = document.querySelectorAll('.new_comment_small' + id);
  newCommentForms.forEach((newCommentForm) => {
  newCommentForm.innerHTML = innerHTML;
  });
}

function addComment(reviewHTML) {
  const comments = document.getElementById('comments');
  comments.insertAdjacentHTML('afterbegin', reviewHTML);
}

<% if @comment.errors.any? %>
  refreshForm('<%= j render "comments/form", post: @post, comment: @comment %>');
<% else %>
  addComment('<%= j render "comments/individual", comment: @comment %>');
  refreshForm('<%= j render "comments/form", post: @post, comment: Comment.new %>');
<% end %>


export default triggerComment(button);
