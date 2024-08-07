import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// メニューを開くトグル機能を追加
document.addEventListener('DOMContentLoaded', () => {
  const toggler = document.querySelector('.navbar-toggler');
  if (toggler) {
    toggler.addEventListener('click', () => {
      const menu = document.querySelector('.dropdown-menu');
      if (menu) {
        menu.classList.toggle('show');
      }
    });
  }
});
