import 'package:bdma/common/helper.dart';
import 'package:bdma/connectivity/connectivity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dtrack extends StatefulWidget {
  const Dtrack({Key key}) : super(key: key);

  @override
  _DtrackState createState() => _DtrackState();
}

class _DtrackState extends State<Dtrack> {
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              width: SizeConfig.ScreenWidth,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFF0730F),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "D'TRACK",
                    style: TextStyle(
                        fontFamily: "Ribeye",
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  pageUI(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
