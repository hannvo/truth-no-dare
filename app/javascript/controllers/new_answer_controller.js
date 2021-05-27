import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "errors" ]


  showForm(event) {
    this.modalTarget.classList.remove('hide-modal');
    this.errorsTarget.classList.add('active');
  }

  closeModal(event) {
    this.modalTarget.classList.add('hide-modal');
    this.errorsTarget.classList.remove('active');
    this.errorsTarget.innerHTML = "";
  }
}
