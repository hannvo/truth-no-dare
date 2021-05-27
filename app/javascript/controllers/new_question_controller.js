import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "errors" ]


  showForm(event) {
    this.modalTarget.classList.remove('hide-modal');
  }

  closeModal(event) {
    this.modalTarget.classList.add('hide-modal');
    this.errorsTarget.innerHTML = "";
  }
}
