import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Refetch extends StatelessWidget {
  final Function callback;

  Refetch(this.callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Ops, algo deu errado'),
          ElevatedButton(
            onPressed: () => callback(),
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }
}
