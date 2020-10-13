import 'package:flutter/material.dart';
import '../../constants.dart';

class DashBoardCard extends StatelessWidget {
  final String title;
  final String description;

  DashBoardCard({Key key, @required this.title,@required this.description}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getMedia(context).width * 0.92,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Card(
          elevation: 18.0,
          color: Color(0xFF900c3f),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("${title}",style: textStyle1.copyWith(fontSize: 20.0,color: Colors.blue[200]),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Text("${description}",style: textStyle1.copyWith(fontSize: 17.0,color: Colors.amber),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
