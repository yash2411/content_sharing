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

function validateAudio(event) {
  for (let i = 0; i < audioInputElement.files.length; i++) {
    let flag = ["audio/mpeg", "audio/mp3"].includes(
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
    }
  }
}

if (audioInputElement) {
  audioInputElement.addEventListener("change", validateAudio);
}
