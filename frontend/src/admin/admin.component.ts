import {Component, Injector, OnInit} from "@angular/core";
import {formatDate} from "@angular/common";
import {HttpService} from "../services/http-service";
import * as moment from 'moment';

export const adminSelector = 'admin-component';

@Component({
  selector: adminSelector,
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.sass']
})
export class AdminComponent implements OnInit{
  public appBasePath:string;
  public notice:string = "";
  public date:string;
  public time:string;
  public currency:string;
  public history:any;

  constructor(readonly http:HttpService){
    this.date = formatDate(new Date(), 'dd.MM.yyyy', 'en');
    this.appBasePath = window.appBasePath ? window.appBasePath : '';
  }
  public ngOnInit() {
    this.refreshhistory();
  }

  public refreshhistory(){
    this.http.getData(this.appBasePath + '/v1/usd/history')
      .subscribe((data:any) => {this.history = data});
  }

  public validateAndSubmit() {
    let tryDateTime = moment(
      this.date.substr(6,4) + '-' +
        this.date.substr(3,2) + '-' +
        this.date.substr(0,2) + 'T' +
        this.time + ':00'
    );
    if(tryDateTime.isValid()) {
      if(this.currency && this.currency !== ''){
        this.notice = "";
        this.submit();
      } else {
        this.notice = "Введите какое-нибудь значение"
      }
    } else {
      this.notice = "Вы ввели неправильную дату и время"
    }
  }

  public submit() {
    this.http.postData(this.appBasePath + '/v1/usd',
      {date: this.date, time: this.time, currency: this.currency, forced: true }
    ).subscribe(
      res => {
        this.refreshhistory();
      },
      err => {
        console.log("Error occured");
      }
    );
  }
}
