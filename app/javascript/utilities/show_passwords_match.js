class PasswordConfirmation {
	constructor(form) {
		this.form = form
		this.password = form.elements.user_password
		this.password_confirm = form.elements.user_password_confirmation

		this.setup()
	}

	setup() {
		this.form.addEventListener('keyup', event => {
			if (this.password_confirm.value != '') this.checkPasswords()
		})
	}

	resetStyleForInputs() {
		this.password_confirm.classList.remove('input-green')
		this.password_confirm.classList.remove('input-red')
		this.password_confirm.parentElement.classList.remove('success')
		this.password_confirm.parentElement.classList.remove('error')
	}

	checkPasswords() {
		this.resetStyleForInputs()

		if (this.password_confirm.value === this.password.value) {
			this.password_confirm.classList.add('input-green')
			this.password_confirm.parentElement.classList.add('success')
		} else {
			this.password_confirm.classList.add('input-red')
			this.password_confirm.parentElement.classList.add('error')
		}
	}
}

document.addEventListener("turbolinks:load", function() {
	const reg_form = document.getElementById("new_user")
	if (reg_form) new PasswordConfirmation(reg_form)
});
