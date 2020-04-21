import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ErrorToastMessageComponent } from './error-toast-message.component';

describe('ErrorToastMessageComponent', () => {
  let component: ErrorToastMessageComponent;
  let fixture: ComponentFixture<ErrorToastMessageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ErrorToastMessageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ErrorToastMessageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
