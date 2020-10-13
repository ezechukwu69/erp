import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc_management/models/login_model.dart';
import 'package:gsc_management/widgets/dasboard/cards.dart';
import '../constants.dart';

class DashBoard extends StatefulWidget {
  static String id = "/dashboard";
  final LoginModel loginModel;
  DashBoard({Key key, this.loginModel}) : super(key: key);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: scaffoldColor,
                title: Text(
                  "Erp",
                  style: GoogleFonts.amarante()
                      .copyWith(fontSize: 40, color: Colors.lightGreen[900]),
                ),
                elevation: 0,
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 20.0),
                        child: SizedBox(
                          height: 40,
                          child: RichText(
                            text: TextSpan(
                                text: "Hello ",
                                style: textStyle1.copyWith(
                                    fontSize: 30.0, color: Colors.deepPurple),
                                children: [
                                  TextSpan(
                                      text: "${widget.loginModel.firstname}",
                                      style: textStyle1.copyWith(
                                          fontSize: 28.0,
                                          color: Colors.deepOrangeAccent)),
                                  TextSpan(
                                      text: "${"."} ",
                                      style: textStyle1.copyWith(
                                          fontSize: 40.0, color: Colors.red[900])),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Attendance",
                        description: "take attendance",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Title 1",
                        description: "Test 1",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Title 2",
                        description: "Test 2",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Title 3",
                        description: "Test 3",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
