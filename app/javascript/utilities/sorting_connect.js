document.addEventListener("turbolinks:load", function () {
  const control = document.querySelector(".sort-by-title");

  if (control) new SortingTable(control);
});
