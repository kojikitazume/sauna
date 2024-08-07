import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// メニューを開くトグル機能を追加
document.addEventListener('DOMContentLoaded', () => {
  const togglers = document.querySelectorAll('.navbar-toggler');
  togglers.forEach(toggler => {
    toggler.addEventListener('click', () => {
      const menu = toggler.nextElementSibling;
      menu.classList.toggle('show');
    });
  });
});
