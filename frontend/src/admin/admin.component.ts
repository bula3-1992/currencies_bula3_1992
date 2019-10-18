import {Component, OnInit} from "@angular/core";
import * as jQuery from "jquery";

export const adminSelector = 'admin-component';

@Component({
  selector: adminSelector,
  template: `
    <br>
    <p style="color: red;">{{notice}}</p>
  `
})
export class AdminComponent implements OnInit{
  public notice:string = "Hello";
  public $ex1:JQuery;

  constructor(){
    this.$ex1 = jQuery("#ex1");
    this.$ex1.on("change", () => {
      alert( "Handler for .change() called." );
    });
  }
  public ngOnInit() {

  }
}
