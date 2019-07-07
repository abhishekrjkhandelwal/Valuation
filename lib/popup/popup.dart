import 'package:flutter/material.dart';
import 'dart:async';

enum ConfirmAction { CANCEL, ACCEPT}


    Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
      return showDialog<ConfirmAction>(
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm'),
            content: const Text('Do you want to add additional information?'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Dismss'),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.CANCEL);
                },
              ),
              FlatButton(
                child: const Text('Add'),
                onPressed: () {
                  Navigator.of(context).pop(ConfirmAction.ACCEPT);
                },
              )
            ],
          );
        },
      );
    }
  }


