import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itax_test/element/engine.dart';
import 'package:itax_test/element/style.dart';
import 'package:itax_test/widget/login.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var chkExpan = false;
  Icon iconExpan =
      Icon(Icons.keyboard_arrow_down, size: 24, color: Style().fontsColor);

  List dataTodo = [];
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtDetailJob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Scaffold(
      backgroundColor: Style().bgIndex,
      appBar: PreferredSize(
          child: Container(
              padding:
                  EdgeInsets.only(left: 24, right: 16, top: 44, bottom: 24),
              height: 112,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "To-do list",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Style().btnMain,
                        ),
                        height: 40,
                        width: 60,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      onTap: () {
                        txtDate.text = "";
                        txtDetailJob.text = "";
                        bottomTodo(context);
                      },
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(112)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Divider(
            height: 1,
            thickness: 1,
          ),
          Theme(
            data: theme,
            child: ExpansionTile(
              onExpansionChanged: (value) {
                //print(value);
                if (value == true) {
                  setState(() {
                    chkExpan = true;
                    iconExpan = Icon(Icons.keyboard_arrow_up,
                        color: Style().fontsColor);
                  });
                } else {
                  setState(() {
                    chkExpan = false;
                    iconExpan = Icon(
                      Icons.keyboard_arrow_down,
                      color: Style().fontsColor,
                    );
                  });
                }
              },
              title: Text(
                'All',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Style().fontsColor),
              ),
              trailing: iconExpan,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataTodo.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      //print(dataTodo[index]['chk']);

                      return listTodo(index, dataTodo.length);
                    }),
              ],
              tilePadding: EdgeInsets.only(left: 24, right: 16),
            ),
          ),
          Divider(
            height: 0,
            color: Style().borderAppBar,
            thickness: 1,
          )
        ],
      )),
      bottomNavigationBar: Container(
        height: 49,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 34),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Text(
            "Log out",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Style().fontsColor),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
    );
  }

  Widget listTodo(index, count) {
    //print(dataTodo[index]['chk']);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            left: 24,
          ),
          height: 56,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: dataTodo[index]["chk"] == true
                              ? Colors.green
                              : Style().borderAppBar),
                    ),
                    height: 24,
                    width: 24,
                    child: CircleAvatar(
                      backgroundColor: dataTodo[index]["chk"] == true
                          ? Colors.green
                          : Colors.white,
                      child: dataTodo[index]["chk"] == true
                          ? Icon(
                              Icons.check,
                              size: 16,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
                  onTap: () {
                    print(index);
                    if (dataTodo[index]["chk"] == true) {
                      setState(() {
                        dataTodo[index]["chk"] = false;
                      });
                    } else {
                      setState(() {
                        dataTodo[index]["chk"] = true;
                      });
                    }
                  },
                )),
                WidgetSpan(
                    child: Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Text(
                    dataTodo[index]["detail"],
                    style: dataTodo[index]["chk"] == true
                        ? TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough)
                        : TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ))
              ])),
            ],
          ),
        ),
        index < count - 1
            ? Container(
                margin: EdgeInsets.only(left: 24),
                child: Divider(
                  height: 0,
                  thickness: 1,
                  color: Style().borderAppBar,
                ),
              )
            : Container(child: null),
      ],
    );
  }

  void bottomTodo(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            //curve: Curves.decelerate,
            child: new Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              height: 232,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        InkWell(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          onTap: () {
                            Map dataMap = new Map<String, dynamic>();
                            if (txtDetailJob.text == "" || txtDate.text == "") {
                              Component().showMessageEror(
                                  context, "กรุณากรอกข้อมูลให้ครบถ้วน");
                            } else {
                              dataMap['chk'] = false;
                              dataMap['detail'] = txtDetailJob.text;
                              dataMap['date'] = txtDate.text;
                              dataTodo.insert(0, dataMap);

                              Navigator.pop(context);
                              Component().showMessage(
                                  context, dataMap['detail'], dataMap['date']);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    //height: 176,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16,
                          ),
                          alignment: Alignment.center,
                          height: 24,
                          child: Center(
                            child: TextField(
                              autofocus: true,
                              controller: txtDetailJob,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 0, 10, 10),
                                //filled: true,
                                border: InputBorder.none,
                                hintText: "Task name...",
                                hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Style().fontsInitialColor,
                                    fontWeight: FontWeight.w400),
                                fillColor: Colors.white,

                                //fillColor: Colors.green
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 24,
                          margin: EdgeInsets.only(top: 24),
                          child: Text(
                            "Due Date *",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, bottom: 32),
                          height: 48,
                          child: TextField(
                            //autofocus: true,
                            controller: txtDate,
                            //obscureText: true,
                            style: TextStyle(fontSize: 16.0),
                            decoration: InputDecoration(
                              // contentPadding:
                              //     EdgeInsets.fromLTRB(10, 10, 10, 10),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                    color: Style().borderTextfield, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                    color: Style().borderTextfield, width: 1.0),
                              ),
                              suffixIcon: InkWell(
                                child: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.green,
                                ),
                                onTap: () {
                                  datePicker(context);
                                },
                              ),

                              hintText: "วัน / เดือน / ปี พ.ศ.",
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Style().fontsInitialColor,
                                  fontWeight: FontWeight.w400),
                              fillColor: Colors.white,

                              //fillColor: Colors.green
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void datePicker(context) async {
    var selectedDate;
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2999),
    );

    if (picked != null && picked != DateTime.now())
      setState(() {
        selectedDate = picked;
        txtDate.text = changeTothai(selectedDate.toString());
      });
  }

  String changeTothai(date) {
    DateTime dateChange = DateTime.parse(date);

    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(dateChange);
    var arrDate = formatted.split('/');

    if (int.parse(arrDate[2]) < 2500) {
      var thaiYear = (int.parse(arrDate[2]) + 543).toString();
      var fullTime = arrDate[0] + "/" + arrDate[1] + "/" + thaiYear.toString();
      return fullTime;
    } else {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final String formatted =
          formatter.format(dateChange); // something like 2013-04-20

      return formatted;
    }
  }
}
