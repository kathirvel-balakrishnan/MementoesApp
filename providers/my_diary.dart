import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:my_diary/helpers/db_helper.dart';
import 'package:my_diary/models/diary_entry.dart';

class MyDiary with ChangeNotifier {
  List<DiaryEntry> _items = [];

  List<DiaryEntry> get items {
    return [..._items]; //copy of items
  }

  void addEntry(
      String pickedTitle, String pickedDescription, File pickedImage) {
    final newEntry = DiaryEntry(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      description: pickedDescription,
    );
    _items.add(newEntry);
    notifyListeners();
    DBHelper.insert('user_entries', {
      'id': newEntry.id,
      'title': newEntry.title,
      'description': newEntry.description,
      'image': newEntry.image.path,
    });
  }

  Future<void> fetchAndSetEntries() async {
    final dataList = await DBHelper.getData('user_entries');
    _items = dataList
        .map((item) => DiaryEntry(
              id: item['id'],
              title: item['title'],
              description: item['description'],
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }

  DiaryEntry findById(String id) {
    return _items.firstWhere((entry) => entry.id == id);
  }

  Future<void> delete(String id) async {
    _items.removeWhere((item) {
      return id == item.id;
    });
    notifyListeners();
  }
}
