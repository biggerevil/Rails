document.addEventListener("turbolinks:load", function () {
  const timerDiv = document.getElementById("timer");

  if (timerDiv) {
    manageTimer(timerDiv);
  }
});

function manageTimer(timerDiv) {
  let remainingTimeInSeconds = parseInt(timerDiv.dataset.remainingTime);

  setInterval(() => {
    let minutes = Math.floor(remainingTimeInSeconds / 60);
    let seconds = remainingTimeInSeconds % 60;

    if (minutes < 10) {
      minutes = '0' + minutes
    }

    if (seconds < 10) {
      seconds = '0' + seconds
    }

    timerDiv.innerHTML = minutes + ":" + seconds;

    remainingTimeInSeconds -= 1

    if (remainingTimeInSeconds < 0) {
      const form = document.getElementById('form-test-passage');
      form.submit()
    }
  }, 1000)
}