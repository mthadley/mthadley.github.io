document.addEventListener('DOMContentLoaded', function() {
  var node = document.createElement('img');

  node.addEventListener('load', function() {
    document.body.classList.remove('animate');
  });

  node.src = '/assets/bg.jpg';
});
