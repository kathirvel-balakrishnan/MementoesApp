import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_diary/providers/my_diary.dart';
import 'package:my_diary/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddDiaryEntryScreen extends StatefulWidget {
  static const routeName = '/add-entry';

  @override
  _AddDiaryEntryScreenState createState() => _AddDiaryEntryScreenState();
}

class _AddDiaryEntryScreenState extends State<AddDiaryEntryScreen> {
  final _titleController = TextEditingController();
  final _descriptionControler = TextEditingController();
  File _pickedImage;

  //292
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) return;
    Provider.of<MyDiary>(context, listen: false).addEntry(
      _titleController.text,
      _descriptionControler.text,
      _pickedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    controller: _titleController,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageInput(_selectImage),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    controller: _descriptionControler,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ]),
            ),
          )),
          RaisedButton.icon(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.add),
            onPressed: _savePlace,
            elevation: 0.0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Add Memento',style: TextStyle(fontSize: 26),),
            ),
          )
        ],
      ),
    );
  }
}
