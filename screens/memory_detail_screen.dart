import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:my_diary/providers/my_diary.dart';
import 'package:provider/provider.dart';
import 'package:quiver/strings.dart';

class MemoryDetailScreen extends StatelessWidget {
  static const routeName = '/memory-detail';

  @override
  Widget build(BuildContext context) {
    final deviceHeight =
        MediaQuery.of(context).size.height + MediaQuery.of(context).padding.top;
    final memoryId = ModalRoute.of(context).settings.arguments as String;
    final loadedMemory =
        Provider.of<MyDiary>(context, listen: false).findById(memoryId);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: deviceHeight,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: loadedMemory.id,
              child: Container(
                child: Image.file(loadedMemory.image, fit: BoxFit.contain),
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 10,
          ),
          GradientCard(
            gradient: Gradients.taitanum,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      loadedMemory.title.substring(0,1).toUpperCase()+loadedMemory.title.substring(1),
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                            DateFormat('MMM d,y')
                                .add_jm()
                                .format(DateTime.parse(loadedMemory.id)),
                            style: TextStyle(color: Colors.white70)))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.orange[100]]),
                  border: Border.symmetric(horizontal: BorderSide(width: 1.0))),
              padding: EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.only(left: 1.0),
              child: Text(
                loadedMemory.description,
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ]))
      ],
    ));
  }
}
