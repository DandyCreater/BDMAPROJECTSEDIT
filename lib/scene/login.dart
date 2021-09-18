import 'dart:convert';

import 'package:bdma/common/helper.dart';
import 'package:bdma/scene/Appmain.dart';
import 'package:bdma/scene/splashscreen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isEnabled = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController username = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  Future login() async {
    var url = "http://192.168.0.107/bdma/login.php";
    var response = await http.post(Uri.parse(url), body: {
      'username': username.text,
      'password': password.text,
    });
    var data = json.decode((response.body));

    print(data);
    if (data == "Error") {
      Flushbar(
        // message: 'Email tidak terdaftar pada sistem kami',
        messageText: Container(
          alignment: Alignment.center,
          child: Text(
            "Email tidak terdaftar pada sistem kami",
            style: TextStyle(
                fontSize: 15, fontFamily: "Raleway", color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red[600],
        flushbarPosition: FlushbarPosition.TOP,
        duration: Duration(seconds: 3),
      ).show(context);
    } else {
      Fluttertoast.showToast(
          msg: "Selamat datang " + data[0]['fullname'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      var storage = FlutterSecureStorage();

      storage.write(key: "username", value: data[0]['username']);
      storage.write(key: "email", value: data[0]['email']);
      storage.write(key: "fullname", value: data[0]['fullname']);
      storage.write(key: "no_hp", value: data[0]['no_hp']);
      storage.write(key: "depart", value: data[0]['dept']);
      storage.write(key: "password", value: data[0]['password']);
      storage.write(key: "dept", value: data[0]['dept']);
      // storage.write(key: "image", value: data[0]['image']);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppMain()));
    }
  }

  // @override
  // void initState() {
  //   username.text = '';
  //   password.text = '';
  //  username.addListener(() {
  //     setState(() {});
  //   });
  //   password.addListener(() {
  //     setState(() {});
  //   });
  //   // TODO: implement initState
  //   super.initState();
  // }

  // void dispose() {
  //   username.dispose();
  //   super.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget usernameTextFormField() => TextFormField(
          autofocus: true,
          controller: username,
          maxLines: 1,
          maxLength: 10,
          textCapitalization: TextCapitalization.characters,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            counter: Offstage(),
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.orange),
            isCollapsed: true,
            isDense: true,
            filled: true,
            focusColor: Colors.yellow.withOpacity(0.2),
            fillColor: Colors.white.withOpacity(0.2),
            contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
            hintText: 'Username',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Raleway", fontSize: 14),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color(0xFFF0730F), width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 1)),
          ),
          // validator: (value) {
          //   if (value.isEmpty) {
          //     Fluttertoast.showToast(
          //         msg: "Password Salah",
          //         toastLength: Toast.LENGTH_LONG,
          //         gravity: ToastGravity.TOP,
          //         timeInSecForIosWeb: 1,
          //         backgroundColor: Colors.red,
          //         textColor: Colors.white,
          //         fontSize: 16.0);
          //   }
          //   return null;
          // },
        );

    Widget passwordTextFormField() => TextFormField(
          controller: password,
          maxLines: 1,
          maxLength: 10,
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: InputDecoration(
            counter: Offstage(),
            labelText: 'Password',
            alignLabelWithHint: true,
            labelStyle: TextStyle(color: Colors.orange),
            isCollapsed: true,
            isDense: true,
            filled: true,
            focusColor: Colors.yellow.withOpacity(0.2),
            fillColor: Colors.white.withOpacity(0.2),
            contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
            hintText: 'Password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Raleway", fontSize: 14),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color(0xFFF0730F), width: 1)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.red, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.grey, width: 1)),
          ),
        );

    Widget nextButton() => Container(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            child: Icon(Icons.arrow_forward),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                login();
              }
              isEnabled = false;
            },
            backgroundColor: (username.text.isEmpty) || (password.text.isEmpty)
                ? Colors.grey
                : Color(0xFFF0730F),
            // backgroundColor: Color(0xFFF0730F),
          ),
        );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          height: SizeConfig.ScreenHeight,
          width: SizeConfig.ScreenWidth,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/img/logo.png"),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back,",
                  style: TextStyle(
                      fontFamily: "Raleway", fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "BDMA Apps",
                  style: TextStyle(
                      fontFamily: "Raleway", fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              usernameTextFormField(),
              SizedBox(
                height: 30,
              ),
              passwordTextFormField(),
              SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Forgot Password?",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Raleway",
                          fontSize: 16),
                    ),
                    TextSpan(
                        text: " Get Now",
                        style: TextStyle(
                            color: Colors.purple[800],
                            fontFamily: "Raleway",
                            fontSize: 16))
                  ]),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
