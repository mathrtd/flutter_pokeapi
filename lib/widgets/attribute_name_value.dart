import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttributeNameValue extends StatelessWidget {
  final String name, value;

  AttributeNameValue(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              height: 1,
              fontSize: 12,
              color: Colors.grey[400],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
