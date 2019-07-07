import 'package:flutter/material.dart';
class ExpansionTileSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Valuation List'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    '23 Queen Street',
    <Entry>[
      Entry(
        'P-4 Jain Colony',
      ),
      Entry(
        'Tenants',
        <Entry>[
          Entry('Name'),
          Entry('Phone Number'),
          Entry('Email Number'),
        ],
      ),
      Entry(
        'Owner',
        <Entry>[
          Entry('Name'),
          Entry('Phone Number'),
          Entry('Email Address'),
        ],
      ),
    ],
  ),
  Entry(
    '24 Raj Street',
    <Entry>[
      Entry(
        'P-5 Jain Colony',
      ),
      Entry(
        'Tenants',
        <Entry>[
          Entry('Name'),
          Entry('Phone Number'),
          Entry('Email Number'),
        ],
      ),
      Entry(
        'Owner',
        <Entry>[
          Entry('Name'),
          Entry('Phone Number'),
          Entry('Email Address'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
