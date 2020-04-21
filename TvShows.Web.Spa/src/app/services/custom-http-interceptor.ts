import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable()
export class CustomHttpInterceptor implements HttpInterceptor{

    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>>{

        const currentUser: any = JSON.parse(localStorage.getItem('user'));

        if (currentUser && currentUser.Token) {
            request = request.clone({
                setHeaders: {
                    Authorization :  `Bearer ${currentUser.Token}`
                }
            }); 
        }

        if (!request.headers.has('Content-Type')) {
            request = request.clone({
                headers: request.headers.set('Content-Type', 'application/json')
            });
        }

        return next.handle(request);
    }
}

