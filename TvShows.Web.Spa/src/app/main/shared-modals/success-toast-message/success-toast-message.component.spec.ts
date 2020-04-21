import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SuccessToastMessageComponent } from './success-toast-message.component';

describe('SuccessToastMessageComponent', () => {
  let component: SuccessToastMessageComponent;
  let fixture: ComponentFixture<SuccessToastMessageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SuccessToastMessageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SuccessToastMessageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
