import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gsc_management/pages/dashboard.dart';
import 'package:gsc_management/widgets/signin_button.dart';
import 'constants.dart';
import 'models/login_model.dart';
import 'widgets/top_header.dart';
import 'widgets/footer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MyHomePage.id,
        routes: {
          MyHomePage.id: (context) => MyHomePage(),
        },
        onGenerateRoute: (settings) {
          if(settings.name == DashBoard.id) {
            return MaterialPageRoute(builder: (context) {
              return DashBoard(loginModel: settings.arguments,);
            },);
          }
          return MaterialPageRoute(builder: (context) {
            return Scaffold();
          },);
        },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static String id = "/";
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  FocusNode focusNode1;
  FocusNode focusNode2;
  TextEditingController _controller1;
  TextEditingController _controller2;
  final _formKey = GlobalKey<FormState>();
  final List<int> classes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  var scaffoldState = GlobalKey<ScaffoldState>();

  int selectedClass = null;


  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> buildAlert(BuildContext context) async{
      Future<bool> data = showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text("Invalid Credentials",
                style: GoogleFonts.aBeeZee(),),
              content: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text("Data you entered is incorrect, check your entries and try again",
                  style: GoogleFonts.aBeeZee(),
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text("Ok",style: GoogleFonts.aBeeZee(),))
              ],
            );
          });
      return data;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          focusNode1.unfocus();
          focusNode2.unfocus();
        });
      },
      child: Scaffold(
        key: scaffoldState,
        resizeToAvoidBottomPadding: false,
        backgroundColor: scaffoldColor,
        body: Stack(
          children: [
            Column(
              children: [
                TopHeader(),
                Footer(
                  focusNode1: focusNode1,
                  focusNode2: focusNode2,
                  formKey: _formKey,
                  controller1: _controller1,
                  controller2: _controller2,
                  classes: classes,
                  setData: (c) => setState(() => selectedClass = c),
                ),
              ],
            ),
            Positioned(
                bottom: 16.0,
                right: 16.0,
                child: SignInButton(
                  validate: () async {
                    DocumentSnapshot doc;
                    if(_controller2.text.isNotEmpty) {
                      doc = await fb.collection("/users").doc('${_controller1.text}').get();
                      if (doc.exists) {
                        var data = doc.data();
                        String name = data["firstname"];
                        if(name.toLowerCase() == "${_controller2.text.toLowerCase()}" && data["class"] == selectedClass) {
                          Navigator.of(context).popAndPushNamed(DashBoard.id,arguments: LoginModel(
                            firstname: _controller2.text,
                            studentId: _controller1.text
                          ));
                        } else {
                          buildAlert(context);
                        }
                      } else {
                        buildAlert(context);
                      }
                    } else {
                      _formKey.currentState.validate();
                    }
                  },
                )),
          ],
        ),
      ),
    );


  }
}

class TopHeaderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var controlpoint1 = Offset(size.height, size.height);
    var endpoint = Offset(size.height, 0);

    Path path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          controlpoint1.dx, controlpoint1.dy, endpoint.dx, endpoint.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
