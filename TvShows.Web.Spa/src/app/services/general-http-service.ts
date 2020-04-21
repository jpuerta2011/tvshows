import {environment} from '../../environments/environment';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class GeneralHttpService { 
    private actionUrl: string;

    constructor(
        private _httpClient: HttpClient,
        
    ){}

    public getAll<T>(uri: string): Observable<T> {
        return this._httpClient.get<T>(`${environment.apiBaseUrl}${uri}`);
    }

    public post<T>(uri: string, data: any): Observable<T> {
        return this._httpClient.post<T>(`${environment.apiBaseUrl}${uri}`, data);
    }

    public get<T>(uri: string, id: number): Observable<T> {
        return this._httpClient.get<T>(`${environment.apiBaseUrl}${uri}/${id}`);
    }

    public put<T>(uri: string, id: number, data: any): Observable<T> {
        return this._httpClient.put<T>(`${environment.apiBaseUrl}${uri}/${id}`, data);
    }

    public delete<T>(uri: string, id: number): Observable<T> {
        return this._httpClient.delete<T>(`${environment.apiBaseUrl}${uri}/${id}`);
    }

}
