import {Component, OnInit} from "@angular/core";

export const adminSelector = 'admin-component';

@Component({
  selector: adminSelector,
  template: `
    <p>Hello</p>
  `
})
export class AdminComponent {
}
