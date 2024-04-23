let videoInputElement = document.querySelector(".video-input");
let videoFieldElement = document.querySelector(".video-field");

function displayVideoMessage(message, color) {
  const smallElement = document.createElement("small");
  smallElement.innerText = message;
  smallElement.style.color = color;
  const existingSmallElement = videoFieldElement.querySelector("small");
  if (existingSmallElement) {
    existingSmallElement.remove();
  }
  videoFieldElement.append(smallElement);
}

function validateVideo(event) {
  for (let i = 0; i < videoInputElement.files.length; i++) {
    let flag = ["video/mp4"].includes(videoInputElement.files[i].type);
    console.log(videoInputElement.files[i].type);
    if (!flag) {
      displayVideoMessage("Invalid video file", "red");
      break;
    } else {
      const existingSmallElement = videoFieldElement.querySelector("small");
      if (existingSmallElement) {
        existingSmallElement.remove();
      }
    }
  }
}

if (videoInputElement) {
  videoInputElement.addEventListener("change", validateVideo);
}
