import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatefulWidget {
  final FocusNode focusNode1;
  final FocusNode focusNode2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final formKey;
  final List<int> classes;
  final Function setData;

  Footer(
      {Key key,
        this.classes,
        this.setData,
        this.focusNode1,
        this.focusNode2,
        this.formKey,
        this.controller1,
        this.controller2})
      : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {

  int selectedClass = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Form(
            key: widget.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                buildTextField(
                    error: "Please enter your Student id",
                    label: "Student id",
                    f: widget.focusNode1,
                    c: widget.controller1),
                SizedBox(
                  height: 20.0,
                ),
                buildTextField(
                    error: "Please enter your firstname",
                    label: "Firstname",
                    f: widget.focusNode2,
                    c: widget.controller2),
                SizedBox(
                  height: 20.0,
                ),
                buildDropdownField()
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: ClipPath(
                clipper: CClipper(),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blueAccent])),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildTextField(
      {String error, String label, FocusNode f, TextEditingController c}) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadiusDirectional.circular(20.0)),
          child: Stack(
            children: [
              Center(
                child: TextFormField(
                  controller: c,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: f,
                  validator: (v) {
                    if (v.isEmpty && v.characters.length < 1) {
                      return error;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: GoogleFonts.aBeeZee()
                        .copyWith(fontWeight: FontWeight.bold),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField({String error, String label, FocusNode f}) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadiusDirectional.circular(20.0)),
          child: Stack(
            children: [
              Center(
                child: DropdownButtonFormField(
                  dropdownColor: Colors.grey[100],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (e) {
                    if (e == null) {
                      return "Class cannot be empty";
                    }
                    return null;
                  },
                  hint: Text(
                    "Choose your class",
                    style: GoogleFonts.aBeeZee().copyWith(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  value: selectedClass,
                  items: widget.classes.map((e) {
                    return DropdownMenuItem(
                      child: Text(
                        "Class $e",
                        style: GoogleFonts.aBeeZee().copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                      value: e,
                    );
                  }).toList(),
                  onChanged: widget.setData,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.aBeeZee()
                        .copyWith(fontWeight: FontWeight.bold),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var h = Offset(0, 0);
    var e = Offset(size.width, 0);
    var path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(h.dx, h.dy, e.dx, e.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
