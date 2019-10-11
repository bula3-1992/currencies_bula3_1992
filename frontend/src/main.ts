import {enableProdMode} from '@angular/core';
import {platformBrowserDynamic} from '@angular/platform-browser-dynamic';
import {environment} from './environments/environment';
import * as jQuery from "jquery";
import {AppModule} from "./app/app-module";

(window as any).global = window;

require('./app/init-vendors');
require('./app/init-globals');

if (environment.production) {
  enableProdMode();
}

platformBrowserDynamic()
  .bootstrapModule(AppModule)
  .then(platformRef => {
    jQuery('body').addClass('__ng2-bootstrap-has-run');
  })
  .catch(err => console.error(err));
