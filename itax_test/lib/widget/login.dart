import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itax_test/element/engine.dart';
import 'package:itax_test/element/style.dart';
import 'package:itax_test/widget/index.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController txtLogin = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  Color border = Style().borderTextfield;
  var chkEmail = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Style().bgLogin,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(40, 168, 40, 0),
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Style().fontsColor),
                ),
                SizedBox(
                  height: 48,
                ),
                Container(
                  height: 48,
                  child: TextField(
                      controller: txtLogin,
                      //obscureText: true,
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        suffixText: chkEmail,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: border, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(color: border, width: 1.0),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Style().fontsInitialColor,
                            fontWeight: FontWeight.w400),
                        fillColor: Colors.white,
                        // suffix: Padding(
                        //   padding:
                        //       const EdgeInsetsDirectional.only(start: 12.0),
                        //   child: Icon(Icons
                        //       .ac_unit_outlined), // myIcon is a 48px-wide widget.
                        // )
                        //suffix: Icon(Icons.sanitizer)
                        // Text(
                        //   "data",
                        //   style: TextStyle(color: Colors.red),
                        // )

                        //fillColor: Colors.green
                      ),
                      onChanged: (value) {
                        if (value.length > 0 && !value.contains('@')) {
                          //FocusScope.of(context).requestFocus(focus);
                          setState(() {
                            border = Colors.red;
                            chkEmail = 'กรอก e-mail ให้ถูกต้อง';
                          });
                        } else {
                          setState(() {
                            border = Style().borderTextfield;
                            chkEmail = '';
                          });
                        }
                      },
                      keyboardType: TextInputType.emailAddress),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                    height: 50,
                    child: TextFormField(
                      controller: txtPassword,
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
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
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            color: Style().fontsInitialColor,
                            fontWeight: FontWeight.w400),
                        fillColor: Colors.white,

                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.text,
                    )),
                SizedBox(
                  height: 24,
                ),
                InkWell(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Style().btnMain),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (txtLogin.text == "" || txtPassword.text == "") {
                      Component().showMessageEror(
                          context, "กรุณากรอกข้อมูบให้ครบถ้วน");
                    } else {
                      if (txtLogin.text == "abc@gg.com" &&
                          txtPassword.text == "1234") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Index()));
                      } else {
                        Component().showMessageEror(
                            context, "E-mail และ password ไม่มีอยู่ในระบบ");
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
