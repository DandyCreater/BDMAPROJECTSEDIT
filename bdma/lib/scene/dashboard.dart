import 'package:bdma/common/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final storage = new FlutterSecureStorage();
  String username = "";
  String fullname = "";

  @override
  void initState() {
    data();
    super.initState();
  }

  Future<String> data() async {
    username = await storage.read(key: "username");
    fullname = await storage.read(key: "fullname");
    Map<String, String> allValues = await storage.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: SizeConfig.ScreenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFF0730F),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/img/Marco2019.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100),
                          // color: Colors.amber,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 160,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                fullname,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 62),
                              child: Text(
                                username,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[100]),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: SizeConfig.ScreenWidth,
                  child: FlatButton(
                    onPressed: () {},
                    child: Image.asset("assets/img/bisids.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  width: SizeConfig.ScreenWidth,
                  child: FlatButton(
                    onPressed: () {},
                    child: Image.asset("assets/img/bisraden.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  width: SizeConfig.ScreenWidth,
                  child: FlatButton(
                    onPressed: () {},
                    child: Image.asset("assets/img/bisloreh.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  width: SizeConfig.ScreenWidth,
                  child: FlatButton(
                    onPressed: () {},
                    child: Image.asset("assets/img/CPR.png"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  width: SizeConfig.ScreenWidth,
                  child: FlatButton(
                    onPressed: () {},
                    child: Image.asset("assets/img/DTRACK.png"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
