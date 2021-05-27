import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal" ]


  showForm(event) {
    const modal = event.currentTarget.parentNode.parentNode.querySelector('.modal');
    modal.classList.remove('hide-modal');
  }

  closeModal(event) {
    const modal = event.currentTarget.parentNode.parentNode.querySelector('.modal');
    modal.classList.add('hide-modal');
  }
}
