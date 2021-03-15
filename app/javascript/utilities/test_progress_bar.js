document.addEventListener("turbolinks:load", function () {
  const progress_bar = document.getElementById("progress-bar-id");

  if (progress_bar) {
    setProgressBar(progress_bar);
  }
});

function setProgressBar(progress_bar) {
  const currentQuestionNumber = progress_bar.dataset.currentQuestionNumber;
  const totalQuestionNumber = progress_bar.dataset.totalTestQuestions;

  progress_bar.value = currentQuestionNumber - 1;
  progress_bar.max = totalQuestionNumber;
}
