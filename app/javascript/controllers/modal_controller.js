import { Controller } from "@hotwired/stimulus"
import {enter, leave, toggle} from "el-transition"

export default class extends Controller {
    static targets = ['closeButton'];

    connect() {
        console.log("Hello, Stimulus!", this.element)
        document.getElementById('authentication-modal').addEventListener('click', this.closeModal);
        this.closeButtonTarget.addEventListener('click', () => {
            leave(document.getElementById('authentication-modal'));
            leave(document.getElementById('modal-panel'));
        });
    }

    closeModal(event) {
        const modalPanelClicked = document.getElementById('modal-panel').contains(event.target);

        if(!modalPanelClicked && event.target.id !== 'modal-trigger') {
            leave(document.getElementById('authentication-modal'));
            leave(document.getElementById('modal-panel'));
        }
    }
    showModal() {
        enter(document.getElementById('authentication-modal'));
        enter(document.getElementById('modal-panel'));
    }
}
