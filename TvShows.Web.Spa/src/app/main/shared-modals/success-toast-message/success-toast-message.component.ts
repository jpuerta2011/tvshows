import { Component, OnInit, Inject } from '@angular/core';
import { MatSnackBarVerticalPosition, MatSnackBarHorizontalPosition, MatSnackBarRef, MAT_SNACK_BAR_DATA } from '@angular/material';

@Component({
  selector: 'app-success-toast-message',
  templateUrl: './success-toast-message.component.html',
  styleUrls: ['./success-toast-message.component.scss']
})
export class SuccessToastMessageComponent implements OnInit {
  
  static verticalPosition: MatSnackBarVerticalPosition = 'bottom';
  static horizontalPosition: MatSnackBarHorizontalPosition = 'end'; 
  static successModalDefaultDuration = 3000;

  constructor(
    public snackBar: MatSnackBarRef<SuccessToastMessageComponent>,
    @Inject(MAT_SNACK_BAR_DATA) public data: any
  ) { }

  ngOnInit(): void {
  }

  onClose(): void {
    this.snackBar.dismiss();
  }

}
