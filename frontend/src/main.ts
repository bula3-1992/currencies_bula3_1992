import { enableProdMode } from '@angular/core';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
declare var $ : any;
//import * as jQuery from "jquery";
import { AppModule } from './app/app.module';
import { environment } from './environments/environment';

(window as any).global = window;

require('./init-vendors');
require('./init-globals');

if (environment.production) {
  enableProdMode();
}

var initAngular = function() {
  platformBrowserDynamic().bootstrapModule(AppModule)
    .then(platformRef => {
      jQuery('body').addClass('__ng2-bootstrap-has-run');
    }).catch(err => console.error(err));
}
jQuery(document).on('turbolinks:load', initAngular);
