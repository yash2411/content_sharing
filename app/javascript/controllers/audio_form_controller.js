import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="audio-form"
export default class extends Controller {
  displayFormMessage(message, color, element) {
    this.removeSmallElement(element);
    const smallElement = document.createElement("small");
    smallElement.innerText = message;
    smallElement.style.color = color;
    element.append(smallElement);
  }

  removeSmallElement(element) {
    const existingSmallElement = element.querySelector("small");
    if (existingSmallElement) {
      existingSmallElement.remove();
    }
  }
  audioFormValidate() {
    let titleInputElement = document.querySelector(".title-input");
    let titleInputField = document.querySelector(".title-field");
    let descInputElement = document.querySelector(".desc-input");
    let descInputField = document.querySelector(".desc-field");
    if (!titleInputElement.value) {
      this.displayFormMessage(
        "Title name must be present",
        "red",
        titleInputField
      );
    } else {
      this.removeSmallElement(titleInputField);
    }
    if (!descInputElement.value) {
      this.displayFormMessage(
        "Description name must be present",
        "red",
        descInputField
      );
    } else {
      this.removeSmallElement(descInputField);
    }
  }
  connect() {}
}
