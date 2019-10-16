import { Component } from '@angular/core';

declare const VERSION: string;

@Component({
  selector: 'app-root',
  template: `
    <router-outlet></router-outlet>
  `
})
export class AppComponent {
  title = 'frontend';
}
