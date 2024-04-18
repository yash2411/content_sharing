import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="profile"
export default class extends Controller {
  connect() {}
  displayFormMessage(message, color, element) {
    const existingSmallElement = element.querySelector("small");
    if (existingSmallElement) {
      existingSmallElement.remove();
    }
    const smallElement = document.createElement("small");
    smallElement.innerText = message;
    smallElement.style.color = color;
    element.prepend(smallElement);
  }

  validateForm() {
    let fullNameElement = document.querySelector(".full-name-field");
    let fullName = document.querySelector(".full-name");
    let bioElement = document.querySelector(".bio-field");
    let bio = document.querySelector(".bio");
    let dobElement = document.querySelector(".dob-field");
    let dobEle = document.querySelector(".dob");
    if (!fullNameElement.value) {
      this.displayFormMessage("Full name must be present", "red", fullName);
    } else {
      const existingSmallElement = fullName.querySelector("small");
      if (existingSmallElement) {
        existingSmallElement.remove();
      }
    }

    if (bioElement.value.length < 20) {
      this.displayFormMessage("Description must be 20 character", "red", bio);
    } else {
      const existingSmallElement = bio.querySelector("small");
      if (existingSmallElement) {
        existingSmallElement.remove();
      }
    }
    let currentDate = new Date();
    let dob = new Date(dobElement.value);
    let sixteenYearsBefore = new Date(
      currentDate.getFullYear() - 16,
      currentDate.getMonth(),
      currentDate.getDate()
    );

    if (!dob || dob > sixteenYearsBefore) {
      this.displayFormMessage("You must be 16 years old", "red", dobEle);
    } else {
      const existingSmallElement = dobEle.querySelector("small");
      if (existingSmallElement) {
        existingSmallElement.remove();
      }
    }
  }
}
