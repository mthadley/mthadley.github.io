function animateBody() {
  document.body.classList.remove('animate');
}

document.addEventListener('DOMContentLoaded', function() {
  var node = document.createElement('img');
  node.addEventListener('load', animateBody);
  node.src = '/assets/bg.jpg';

  document.addEventListener('turbolinks:render', animateBody);
});
