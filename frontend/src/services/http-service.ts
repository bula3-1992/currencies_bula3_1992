import {Injectable, Injector} from '@angular/core';
import {HttpClient, HttpErrorResponse, HttpHeaders} from '@angular/common/http';
import {Observable, throwError} from "rxjs";
import {catchError} from "rxjs/operators";

@Injectable()
export class HttpService{
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type':  'application/json',
    })
  };

  constructor(readonly injector:Injector,
              private http: HttpClient){ }

  public postData(url:string, body: any):Observable<any> {
    return this.http.post(url, body, this.httpOptions)
  }

  public getData(url:string):Observable<any> {
    return this.http.get(url);
  }
}
