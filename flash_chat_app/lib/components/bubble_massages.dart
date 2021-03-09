import 'package:flutter/material.dart';

class BubbleMassages extends StatelessWidget {
  BubbleMassages({this.sender, this.text, this.itsMe});
  final String sender;
  final String text;
  final bool itsMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            (itsMe) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(
            height: 3,
          ),
          Material(
            borderRadius: (itsMe)
                ? BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
            color: (itsMe) ? Colors.white : Colors.lightBlueAccent,
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20.0,
                    color: (itsMe) ? Colors.grey : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
