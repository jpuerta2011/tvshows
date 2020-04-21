import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import {environment} from '../../environments/environment';


@Injectable()
export class AuthenticationService {


    constructor(private _httpClient: HttpClient){ }

    login(username: string, password: string): any {

        return this._httpClient.post<any>(`${environment.apiBaseUrl}account/login`,
        { username, password})
        .pipe(
            map(( user => {
                if (user.success) {
                    localStorage.setItem('user', JSON.stringify(user.data));
                }

                return user;
            }))
        );
    }

    
}
