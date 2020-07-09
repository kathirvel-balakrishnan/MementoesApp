import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class DiaryEntryItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final File image;
  DiaryEntryItem(
    this.id,
    this.title,
    this.description,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    Gradient grd = LinearGradient(
      colors: [Colors.orange[200], Colors.purple[900]],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 300,  
            child: Image.file(image),
          ),
          //Text(id),
          GradientCard(
              gradient: Gradients.cosmicFusion,
              shadowColor: Gradients.cosmicFusion.colors.last.withOpacity(0.75),
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ],
              )),

          GradientCard(
            gradient: grd,
            shadowColor: Gradients.byDesign.colors.last.withOpacity(0.75),
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Text(description),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
