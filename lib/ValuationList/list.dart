import 'package:flutter/material.dart';
import 'package:imovaluer/ValuationList/candidate.dart';

class ValutationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Ink(
              //color: Colors.cyanAccent,
              child: ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('P-4 Jain Garden'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ValutaionInfo(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Ink(
             // color: Colors.cyanAccent,
              child : ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('blablabla'),
              ),
            ),
            SizedBox(height: 5),
            Ink(
              //color: Colors.cyanAccent,
              child : ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('blablabla'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

