import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable()
export class CanActivateAuthGuard implements CanActivate{
    constructor(private router: Router) {}


    canActivate(): any {

        if (localStorage.getItem('user')) {
            return true;
        }
        
        this.router.navigate(['/auth/login']);
        return false;
    }
    
}
