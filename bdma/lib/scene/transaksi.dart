import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key key}) : super(key: key);

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Transaksi"),
          )
        ],
      ),
    );
  }
}
