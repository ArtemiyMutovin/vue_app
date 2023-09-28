<template>
  <form id="userForm" onsubmit="submitForm(event)">
    <h3>Создание клиента</h3>
    <div>
      <label for="fullname">Full Name:</label>
      <input type="text" id="fullname" name="fullname" required minlength="5">
      <div id="fullnameError" class="error"></div>
    </div>
    <div>
      <label for="phone">Phone:</label>
      <input type="tel" id="phone" name="phone" required pattern="[0-9]+">
      <div id="phoneError" class="error"></div>
    </div>
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
      <div id="emailError" class="error"></div>
    </div>
    <button type="submit">Submit</button>
  </form>
</template>

<script>
function submitForm(event) {
  event.preventDefault();
  const fullname = document.getElementById('fullname').value;
  const phone = document.getElementById('phone').value;
  const email = document.getElementById('email').value;

  const fullnameError = document.getElementById('fullnameError');
  fullnameError.textContent = '';

  const phoneError = document.getElementById('phoneError');
  phoneError.textContent = '';

  const emailError = document.getElementById('emailError');
  emailError.textContent = '';

  if (fullname.length < 5) {
    fullnameError.textContent = 'Full name should have at least 5 characters';
  }

  if (!phone.match(/^\d+$/)) {
    phoneError.textContent = 'Phone should only contain digits';
  }

  if (!email.match(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/)) {
    emailError.textContent = 'Invalid email format';
  }

  if (!fullnameError.textContent && !phoneError.textContent && !emailError.textContent) {
    console.log('Form submitted successfully');
  }
}
</script>

<style>
</style>

