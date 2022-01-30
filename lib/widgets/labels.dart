import 'package:chat_private/models/labels_login_reg.dart';
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final LabelLoginReg labels;
  const Labels({Key? key, required this.route, required this.labels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(labels.greyLabel,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          const SizedBox(height: 10),
          GestureDetector(
            child: Text(
              labels.blueLabel,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, route);
            },
          ),
        ],
      ),
    );
  }
}
