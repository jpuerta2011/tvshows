import { Component, OnInit, Inject } from '@angular/core';
import { MAT_SNACK_BAR_DATA, MatSnackBarRef, MatSnackBarHorizontalPosition, MatSnackBarVerticalPosition } from '@angular/material';

@Component({
  selector: 'app-error-toast-message',
  templateUrl: './error-toast-message.component.html',
  styleUrls: ['./error-toast-message.component.scss']
})
export class ErrorToastMessageComponent implements OnInit {

  static verticalPosition: MatSnackBarVerticalPosition = 'bottom';
  static horizontalPosition: MatSnackBarHorizontalPosition = 'end'; 
  
  constructor(
    public snackBar: MatSnackBarRef<ErrorToastMessageComponent>,
    @Inject(MAT_SNACK_BAR_DATA) public data: any
  ) { }

  ngOnInit(): void {
    
  }
  

  onClose(): void {
    this.snackBar.dismiss();
  }

}
