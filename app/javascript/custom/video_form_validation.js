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

function previewVideo() {
  const existingVideoElements = videoFieldElement.querySelectorAll("video");
  existingVideoElements.forEach(function (videoElement) {
    videoElement.remove();
  });

  for (let i = 0; i < videoInputElement.files.length; i++) {
    let videoPreviewElement = document.createElement("video");
    videoPreviewElement.controls = true; // Add controls to the video element
    videoPreviewElement.src = URL.createObjectURL(videoInputElement.files[i]);
    videoPreviewElement.style.margin = "10px";
    videoFieldElement.appendChild(videoPreviewElement);
  }
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
      previewVideo();
    }
  }
}

if (videoInputElement) {
  videoInputElement.addEventListener("change", validateVideo);
}
