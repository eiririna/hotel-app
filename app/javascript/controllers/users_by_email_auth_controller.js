import axios from "axios";
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
    static targets = ['email', 'submit'];

    connect() {
        this.submitTarget.addEventListener('click', (e) => {
            e.preventDefault();
            if (this.emailTarget.value.length === 0) {
                console.log('empty field')
            } else {
                axios.get('/api/users_by_email', {
                    params: {
                        email: this.emailTarget.value
                    },
                    headers: {
                        'ACCEPT': "application/json"
                    }
                }).then((response) => {
                    Turbo.visit('/users/sign_in');
                }).catch((response) => {
                    Turbo.visit('users/sign_up');
                })
            }
        });
    }
}