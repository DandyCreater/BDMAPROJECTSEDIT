import 'dart:convert';

import 'package:bdma/common/helper.dart';
import 'package:bdma/scene/dashboard.dart';
import 'package:bdma/scene/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final storage = new FlutterSecureStorage();
  final ImagePicker _picker = ImagePicker();

  String fullname = "";
  String username = "";
  String email = "";
  String no_hp = "";
  String password = "";
  String depart = "";
  TextEditingController emails = new TextEditingController();
  TextEditingController noHps = new TextEditingController();
  TextEditingController passwords = new TextEditingController();
  TextEditingController fullnames = new TextEditingController();

  @override
  void initState() {
    data();
    emails.value = TextEditingValue(text: email);
    noHps.value = TextEditingValue(text: no_hp);
    passwords.value = TextEditingValue(text: password);
    fullnames.value = TextEditingValue(text: fullname);
    super.initState();
  }

  Future<String> data() async {
    fullname = await storage.read(key: "fullname");
    email = await storage.read(key: "email");
    no_hp = await storage.read(key: "no_hp");
    username = await storage.read(key: "username");
    password = await storage.read(key: "password");
    depart = await storage.read(key: "dept");
    Map<String, String> allValues = await storage.readAll();

    emails = await TextEditingController(text: email);
    noHps = await TextEditingController(text: no_hp);
    passwords = await TextEditingController(text: password);
    fullnames = await TextEditingController(text: fullname);
    // depts = await ;
    setState(() {});
  }

  dept selecteddept;
  List<dept> depts = [
    dept("FAT"),
    dept("PLAN"),
    dept("SM"),
    dept("PROD"),
    dept("ENG"),
    dept("HCGS"),
  ];

  List<DropdownMenuItem> generateItems(List<dept> depts) {
    List<DropdownMenuItem> items = [];
    for (var item in depts) {
      items.add(DropdownMenuItem(
        child: Text(item.dep),
        value: item,
      ));
    }
    return items;
  }

  Future update() async {
    var url = "http://192.168.0.107/BDMA/update.php";
    var response = await http.post(Uri.parse(url), body: {
      "username": username,
      "fullname": fullnames.text,
      "no_hp": noHps.text,
      "email": emails.text,
      "dept": selecteddept.dep,
      "password": passwords.text,
    });

    var data = json.decode(json.encode(response.body));
    print(data);
    // if (data[data.indexOf('message')] != "Success") {
    if (data == "Error") {
      Fluttertoast.showToast(
          msg: "Error!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Data Berhasil di ubah " + fullname[0],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      // var storage = FlutterSecureStorage();
      // storage.write(key: "username", value: data[0]['username']);
      // storage.write(key: "email", value: data[0]['email']);
      // storage.write(key: "fullname", value: data[0]['fullname']);
      // storage.write(key: "no_hp", value: data[0]['no_hp']);
      // storage.write(key: "dept", value: data[0]['dept']);
      // storage.write(key: "password", value: data[0]['password']);
      // storage.write(key: "dept", value: data[0]['dept']);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  Widget emailTextFromField() => TextFormField(
        controller: emails,
        autofocus: true,
        maxLines: 1,
        maxLength: 100,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counter: Offstage(),
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.orange),
          isCollapsed: true,
          isDense: true,
          filled: true,
          hintText: email,
          focusColor: Colors.yellow.withOpacity(0.2),
          fillColor: Colors.white.withOpacity(0.2),
          contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
          // hintText: 'Username',
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
  Widget fullnameTextFormField() => TextFormField(
        controller: fullnames,
        autofocus: true,
        maxLines: 1,
        maxLength: 12,
        textCapitalization: TextCapitalization.characters,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counter: Offstage(),
          labelText: "Fullname",
          labelStyle: TextStyle(color: Colors.orange),
          isCollapsed: true,
          isDense: true,
          filled: true,
          focusColor: Colors.yellow.withOpacity(0.2),
          fillColor: Colors.white.withOpacity(0.2),
          contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
          hintText: fullname,
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

  Widget noHpTextFormField() => TextFormField(
        autofocus: true,
        controller: noHps,
        maxLines: 1,
        maxLength: 12,
        textCapitalization: TextCapitalization.characters,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counter: Offstage(),
          labelText: 'No. HP',
          labelStyle: TextStyle(color: Colors.orange),
          isCollapsed: true,
          isDense: true,
          filled: true,
          focusColor: Colors.yellow.withOpacity(0.2),
          fillColor: Colors.white.withOpacity(0.2),
          contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
          hintText: no_hp,
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

  Widget deptTextFormField() => DropdownButtonFormField(
        decoration: InputDecoration(
          isDense: true,
          focusColor: Colors.yellow.withOpacity(0.2),
          fillColor: Colors.white.withOpacity(0.2),
          filled: true,
          labelText: 'Dept',
          labelStyle: TextStyle(color: Colors.orange),
          contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
        value: selecteddept,
        hint: Text(depart),
        items: generateItems(depts),
        onChanged: (item) {
          setState(() {
            selecteddept = item;
          });
        },
      );

  Widget passwordTextFormField() => TextFormField(
        autofocus: true,
        obscureText: true,
        controller: passwords,
        maxLines: 1,
        maxLength: 10,
        textCapitalization: TextCapitalization.characters,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counter: Offstage(),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.orange),
          isCollapsed: true,
          isDense: true,
          filled: true,
          focusColor: Colors.yellow.withOpacity(0.2),
          fillColor: Colors.white.withOpacity(0.2),
          contentPadding: EdgeInsets.fromLTRB(13, 13, 0, 13),
          hintText: password,
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

  Widget changeButton() => SizedBox(
        height: 50,
        width: 150,
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xFFF0730F))),
          child: Text(
            "Change",
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'Raleway'),
          ),
          onPressed: () {
            update();
          },
        ),
      );

  _imgFromCamera() async {
    XFile image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.ScreenHeight,
        width: SizeConfig.ScreenWidth,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/img/Marco2019.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(100),
                  // color: Colors.amber,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            fullnameTextFormField(),
            SizedBox(
              height: 20,
            ),
            emailTextFromField(),
            SizedBox(
              height: 20,
            ),
            noHpTextFormField(),
            SizedBox(
              height: 20,
            ),
            deptTextFormField(),
            SizedBox(
              height: 20,
            ),
            passwordTextFormField(),
            SizedBox(
              height: 20,
            ),
            changeButton(),
          ],
        ),
      ),
    );
  }
}

class dept {
  String dep;

  dept(this.dep);
}
