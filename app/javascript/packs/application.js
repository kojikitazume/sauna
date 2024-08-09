import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import { Loader } from "@googlemaps/js-api-loader";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener('DOMContentLoaded', () => {
  const togglers = document.querySelectorAll('.navbar-toggler');
  togglers.forEach(toggler => {
    toggler.addEventListener('click', () => {
      const menu = toggler.nextElementSibling;
      menu.classList.toggle('show');
    });
  });
});


const loader = new Loader({
  apiKey: process.env.GOOGLE_MAPS_API_KEY, 
  version: "weekly",
});

loader.load().then(() => {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 35.6895, lng: 139.6917 }, // 初期位置: 東京
    zoom: 10,
  });

  // デバッグ用: gon の内容をコンソールに表示
  console.log('gon:', window.gon);
  console.log('gon.saunas:', window.gon.saunas);

  const saunas = window.gon.saunas || []; // デフォルト値を設定
  saunas.forEach((sauna) => {
    if (sauna.latitude && sauna.longitude) {
      new google.maps.Marker({
        position: { lat: sauna.latitude, lng: sauna.longitude },
        map: map,
        title: sauna.name,
      });
    }
  });
}).catch(error => {
  console.error('Google Maps API の読み込みエラー:', error);
});
