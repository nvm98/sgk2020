import { Component, OnInit } from '@angular/core';
import 'devextreme/data/odata/store';
import { User } from 'src/app/model/user';

@Component({
  templateUrl: 'display-data.component.html'
})
/// class mockup datagrid
export class DisplayDataComponent implements OnInit{
  dataSource: any;
  priority: any[];
  popupVisible: boolean = false;
  user: any;
  formMode = 1;
  popupDeleteVisible: boolean = false;


  constructor() {
    
  }

  ngOnInit(){
    this.dataSource = [
      {
        UserName: "maiq7212",
        FullName: "Phạm Quỳnh Mai",
        Email: "maiq721@gmail.com",
        Mobile: "0663461479",
        RoleName: "Admin",
        Status: 1,
        Action: ""
      }
    ]
  }

  showPpopupAdd(){
    this.user = new User();
    this.formMode = 1;
    this.popupVisible = true;
  }

  showPopupEdit(e){
    this.user = e;
    this.formMode = 2;
    this.popupVisible = true;
  }

  showPopupDelete(e){
    this.user = e;
    this.popupDeleteVisible = true;
  }

  saveData(){
    this.popupVisible = false;
  }

  deleteData(){
    this.popupDeleteVisible = false;
  }
}
