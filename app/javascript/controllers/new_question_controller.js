import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal" ]


  showForm(event) {
    this.modalTarget.classList.remove('hide-modal');
  }

  closeModal(event) {
    this.modalTarget.classList.add('hide-modal');
  }
}
