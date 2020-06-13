import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'Pin.dart';

class Phone extends StatefulWidget {
  static const String id = "Phone";
  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> with SingleTickerProviderStateMixin {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String phoneno;

  AnimationController aniController;
  String aText = 'idle';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    aniController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    aniController.forward();

    aniController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    aniController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              FlareActor(
                'Animation/login.flr',
                animation: aText,
                fit: BoxFit.cover,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      //to be used later maxLength: ,
                      //keyboardType: TextInputType.number,
                      onChanged: (value) {
                        phoneno = value;
                      },
                      style: TextStyle(
                        height: 1.5, //height of the cursor
                      ),
                      decoration: InputDecoration(
                        hintText: "Enter Your Phone No",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 10),
//                    child: TextField(
//                      style: TextStyle(
//                        height: 1.5, //height of the cursor
//                      ),
//                      keyboardType: TextInputType.number,
//                      obscureText: true,
//                      onChanged: (value) {},
//                      decoration: InputDecoration(
//                        hintText: "Enter Your Pin",
//                        hintStyle: TextStyle(
//                          fontSize: 20,
//                          color: Colors.white,
//                          fontStyle: FontStyle.italic,
//                        ),
//                        contentPadding: EdgeInsets.symmetric(
//                          vertical: 10,
//                          horizontal: 20,
//                        ),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide:
//                              BorderSide(color: Colors.blueAccent, width: 1.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide:
//                              BorderSide(color: Colors.blueAccent, width: 2.0),
//                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                        ),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20,
//                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Material(
                        elevation: 5,
                        color: Color(0xFF311b92),
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Pin(
                                          phoneno: phoneno.trim(),
                                        )));
//                            setState(() {
//                              aText = "success";
//                            });
                          },
                          minWidth: 250.0,
                          height: 42.0,
                          child: Text(
                            "Enter",
                            style: TextStyle(
                                fontFamily: 'Rounded',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
