import 'package:bdma/common/helper.dart';
import 'package:bdma/connectivity/connectivity_provider.dart';
import 'package:bdma/scene/submenu/dtrack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color color = Colors.red;

  final storage = new FlutterSecureStorage();
  String username = "";
  String fullname = "";

  @override
  void initState() {
    data();
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  Future<String> data() async {
    username = await storage.read(key: "username");
    fullname = await storage.read(key: "fullname");
    Map<String, String> allValues = await storage.readAll();
    setState(() {});
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (context, model, child) {
        if (model.isOnline != null) {
          return model.isOnline
              ? Center(
                  child: AnimatedContainer(
                    color: Colors.green,
                    width: 30,
                    height: 30,
                    duration: Duration(milliseconds: 500),
                  ),
                )
              : Center(
                  child: Center(
                    child: AnimatedContainer(
                      width: 30,
                      height: 30,
                      color: Colors.red,
                      duration: Duration(milliseconds: 500),
                    ),
                  ),
                );
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
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
                        pageUI(),
                      ],
                    ),
                  ),
                ],
              ),
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dtrack()));
                    },
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
