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
      extendBodyBehindAppBar: true,
      backgroundColor: scaffoldColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: Clipper(),
                child: Container(
            height: 200,
            width: 200,
            color: Colors.pink,
          ),
              )),
          Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: Clipper(),
                child: Container(
                height: 100,
                width: 100,
                color: Colors.indigo,
          ),
              )),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "Erp",
                  style: GoogleFonts.amarante()
                      .copyWith(fontSize: 50, color: Colors.brown[900]),
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
                                          fontSize: 28.0, color: Colors.blue)),
                                  TextSpan(
                                      text: "${"."} ",
                                      style: textStyle1.copyWith(
                                          fontSize: 40.0,
                                          color: Colors.yellow)),
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
                        title: "Notice board",
                        description: "No notices",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Fees payment",
                        description: "Paid for this semester",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Class Recordings",
                        description: "View previous class recordings",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DashBoardCard(
                        title: "Examinations",
                        description:
                            "Check examination schedule, timetable and  past questions",
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

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var anchor = Offset(0, size.height);
    var end = Offset(0, 0);
    var path = Path()
    ..lineTo(size.width, 0)
    ..lineTo(size.width, size.height)
    ..quadraticBezierTo(anchor.dx, anchor.dy, end.dx, end.dy);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
