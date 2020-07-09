import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final File image;
  ListItem(
    this.id,
    this.title,
    this.description,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    Gradient grd = LinearGradient(
        colors: [Colors.orange[100], Colors.purple[900]],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GradientCard(
        gradient: grd,
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: FileImage(image),
                ),
              ),
              Spacer(),
              Text(title, style: TextStyle(fontSize: 26, color: Colors.white)),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                    DateFormat('MMM d,y').add_jm().format(DateTime.parse(id))),
              ),
            ]),
            Divider(color: Colors.purple[200]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description, style: TextStyle(fontSize: 26)),
            ),
          ],
        ),
      ),
    );
  }
}
