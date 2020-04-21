import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { ModalData } from 'app/models/common/modal-data.model';




@Component({
  selector: 'app-yes-no-modal',
  templateUrl: './yes-no-modal.component.html',
  styleUrls: ['./yes-no-modal.component.scss']
})
export class YesNoModalComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<YesNoModalComponent>,
    @Inject(MAT_DIALOG_DATA) public modalData: ModalData) {}

  ngOnInit(): void {
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
