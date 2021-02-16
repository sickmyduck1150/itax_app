import 'package:flutter/material.dart';

class Component{
   void showMessage(context,detailTodo, date,) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("แจ้งเตือน"),
              content: Text(
                  "เพิ่มรายการ\nรายการ : $detailTodo\nวันที่ : $date\nสำเร็จ"),
              actions: [
                FlatButton(
                  child: Text('ตกลง'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

  void showMessageEror(context,content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("แจ้งเตือน"),
              content: Text(content),
              actions: [
                FlatButton(
                  child: Text('ตกลง'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}