import 'package:bdma/common/helper.dart';
import 'package:bdma/scene/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final storage = new FlutterSecureStorage();
  String fullname = "";
  String email = "";

  @override
  void initState() {
    data();
    super.initState();
  }

  Future<String> data() async {
    fullname = await storage.read(key: "fullname");
    email = await storage.read(key: "email");
    Map<String, String> allValues = await storage.readAll();
    setState(() {});
  }

  Widget fotoArea() => Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/Marco2019.png"),
            ),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(100)),
      );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(child: fotoArea()),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              fullname,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              email,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: 'Raleway'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CategoryButton(
            imgsrc: "assets/icon/account.png",
            title: "Edit Profile",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          CategoryButton(
            imgsrc: "assets/icon/thumbup.png",
            title: "Help Centre",
            press: () {},
          ),
          CategoryButton(
            imgsrc: "assets/icon/verified.png",
            title: "Rate Apps",
            press: () {},
          ),
          CategoryButton(
            imgsrc: "assets/icon/logout.png",
            title: "Sign Out",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final Function press;
  final String imgsrc;

  const CategoryButton({
    this.imgsrc,
    this.press,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: FlatButton(
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(imgsrc),
            ),
            Container(
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
