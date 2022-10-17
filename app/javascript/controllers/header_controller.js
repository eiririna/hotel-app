import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['openUserMenu', 'userAuthLink'];
  connect() {
    console.log('hi! i am header controller!')
    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener('click', () => {
        document.getElementById('modal-trigger').click();
      });
    });
  }
}
