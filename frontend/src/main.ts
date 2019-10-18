import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import * as jQuery from "jquery";
import { AppModule } from './app/app.module';
import { environment } from './environments/environment';
import {augmentedDatePicker} from "./global-listeners/augmented-date-picker";

(window as any).global = window;

require('./init-vendors');
require('./init-globals');

if (environment.production) {
  enableProdMode();
}

jQuery(function () {
  platformBrowserDynamic().bootstrapModule(AppModule)
    .then(platformRef => {
      jQuery('body').addClass('__ng2-bootstrap-has-run');
    }).catch(err => console.error(err));
});

(function($:JQueryStatic) {
  $(function() {
    console.log('Initializing');
    $(document)
      .ajaxStop(() => {
        console.log(111);
      })
  });
}(jQuery));
