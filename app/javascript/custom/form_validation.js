const emailInputElement = document.querySelector(".email_form");
const passwordInputElement = document.querySelector(".password_check");
const passwordConfirmationInputElement = document.querySelector(
  ".password_conf_check"
);

function isValidEmail(email) {
  // Regular expression for validating email addresses
  const emailRegex =
    /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return emailRegex.test(String(email).toLowerCase());
}

function displayMessage(message, color) {
  const smallElement = document.createElement("small");
  smallElement.innerText = message;
  smallElement.style.color = color;
  const existingSmallElement = emailInputElement.querySelector("small");
  if (existingSmallElement) {
    existingSmallElement.remove();
  }
  emailInputElement.prepend(smallElement);
}

function checkInput(event) {
  const inputValue = event.target.value;
  const isValid = isValidEmail(inputValue);
  if (isValid) {
    const message = "Awesome! Valid email address provided.";
    const color = "green";
    axios
      .get("/users/check_email_uniqueness", { params: { email: inputValue } })
      .then((response) => {
        if (response.data.unique) {
          displayMessage(message, color);
        } else {
          const errorMessage = "Oops! Email already exists.";
          const errorColor = "red";
          displayMessage(errorMessage, errorColor);
        }
      })
      .catch((error) => {
        console.error("Error checking email uniqueness:", error);
      });
  } else {
    const message = "Please enter a valid email address.";
    const color = "red";
    displayMessage(message, color);
  }
}
if (emailInputElement) {
  emailInputElement.addEventListener("input", checkInput);
}

function displayPasswordMessage(message, color, element) {
  console.log("Hello");
  const existingSmallElement = element.querySelector("small");
  if (existingSmallElement) {
    existingSmallElement.remove();
  }
  const smallElement = document.createElement("small");
  smallElement.innerText = message;
  smallElement.style.color = color;
  element.prepend(smallElement);
}

function checkPassword(event) {
  const passwordRegex =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

  if (passwordRegex.test(event.target.value)) {
    displayPasswordMessage(
      "Excellent! Password strength confirmed.",
      "green",
      passwordInputElement
    );
  } else {
    displayPasswordMessage(
      "Oops! Password must contain at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 8 characters long.",
      "red",
      passwordInputElement
    );
  }

  let value = document.querySelector(".password_conf_field").value;
  if (value) {
    if (event.target.value == value) {
      displayPasswordMessage(
        "Great job! Passwords confirmed.",
        "green",
        passwordConfirmationInputElement
      );
    } else {
      displayPasswordMessage(
        "Oops! Passwords don't match.",
        "red",
        passwordConfirmationInputElement
      );
    }
  }
}
if (passwordInputElement) {
  passwordInputElement.addEventListener("input", checkPassword);
}

function checkPasswordConf(event) {
  let value = document.querySelector(".password_field").value;
  if (event.target.value == value) {
    const passwordRegex =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (passwordRegex.test(event.target.value)) {
      displayPasswordMessage(
        "Great job! Passwords confirmed.",
        "green",
        passwordConfirmationInputElement
      );
    } else {
      displayPasswordMessage(
        "Password is not valid.",
        "red",
        passwordConfirmationInputElement
      );
    }
  } else {
    displayPasswordMessage(
      "Oops! Passwords don't match.",
      "red",
      passwordConfirmationInputElement
    );
  }
}
if (passwordConfirmationInputElement) {
  passwordConfirmationInputElement.addEventListener("input", checkPasswordConf);
}

let imageInputElement = document.querySelector(".image-input");
let imageFieldElement = document.querySelector(".image-field");

function displayImageMessage(message, color) {
  const smallElement = document.createElement("small");
  smallElement.innerText = message;
  smallElement.style.color = color;
  const existingSmallElement = imageFieldElement.querySelector("small");
  if (existingSmallElement) {
    existingSmallElement.remove();
  }
  imageFieldElement.append(smallElement);
}

function validateImage(event) {
  for (let i = 0; i < imageInputElement.files.length; i++) {
    let flag = ["image/png", "image/jpeg", "image/jpg"].includes(
      imageInputElement.files[i].type
    );
    console.log(imageInputElement.files[i].type);
    if (!flag) {
      displayImageMessage("Invalid image file", "red");
      break;
    } else {
      const existingSmallElement = imageFieldElement.querySelector("small");
      if (existingSmallElement) {
        existingSmallElement.remove();
      }
    }
  }
}

if (imageInputElement) {
  imageInputElement.addEventListener("change", validateImage);
}
