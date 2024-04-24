let audioInputElement = document.querySelector(".audio-input");
let audioFieldElement = document.querySelector(".audio-field");

function displayAudioMessage(message, color) {
  const smallElement = document.createElement("small");
  smallElement.innerText = message;
  smallElement.style.color = color;
  const existingSmallElement = audioFieldElement.querySelector("small");
  if (existingSmallElement) {
    existingSmallElement.remove();
  }
  audioFieldElement.append(smallElement);
}

function previewAudio() {
  const existingAudioElements = audioFieldElement.querySelectorAll("audio");
  existingAudioElements.forEach(function (audioElement) {
    audioElement.remove();
  });

  for (let i = 0; i < audioInputElement.files.length; i++) {
    let audioPreviewElement = document.createElement("audio");
    audioPreviewElement.controls = true; // Add controls to the audio element
    audioPreviewElement.src = URL.createObjectURL(audioInputElement.files[i]);
    audioPreviewElement.style.margin = "10px";
    audioFieldElement.appendChild(audioPreviewElement);
  }
}

function validateAudio(event) {
  for (let i = 0; i < audioInputElement.files.length; i++) {
    let flag = ["audio/mpeg", "audio/mp3", "audio/wav"].includes(
      audioInputElement.files[i].type
    );
    if (!flag) {
      displayAudioMessage("Invalid audio file", "red");
      break;
    } else {
      const existingSmallElement = audioFieldElement.querySelector("small");
      if (existingSmallElement) {
        existingSmallElement.remove();
      }
      previewAudio();
    }
  }
}

if (audioInputElement) {
  audioInputElement.addEventListener("change", validateAudio);
}