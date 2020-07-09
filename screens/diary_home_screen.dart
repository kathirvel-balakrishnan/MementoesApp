import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_diary/helpers/db_helper.dart';

import 'package:my_diary/providers/my_diary.dart';
import 'package:my_diary/screens/add_diaryEntry_screen.dart';
import 'package:my_diary/screens/memory_detail_screen.dart';
import 'package:my_diary/widgets/list_item.dart';

import 'package:provider/provider.dart';

class DiaryHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Text('Mementos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddDiaryEntryScreen.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<MyDiary>(context, listen: false).fetchAndSetEntries(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.grey))
            : Consumer<MyDiary>(
                child: Center(
                    child: Text(
                  'Got no memento yet!',
                  style: TextStyle(fontSize: 40),
                )),
                builder: (context, diaryEntries, ch) =>
                    diaryEntries.items.length == 0
                        ? ch
                        : ListView.builder(
                            itemCount: diaryEntries.items.length,
                            itemBuilder: (context, i) {
                              File img = diaryEntries.items[i].image;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      MemoryDetailScreen.routeName,
                                      arguments: diaryEntries.items[i].id);
                                },
                                onLongPress: () {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Delete memento?'),
                                    action: SnackBarAction(
                                        label: 'Yes',
                                        onPressed: () {
                                          DBHelper.delete('user_entries',
                                              diaryEntries.items[i].id);
                                          Provider.of<MyDiary>(context,
                                                  listen: false)
                                              .delete(diaryEntries.items[i].id);
                                        }),
                                  ));
                                },
                                child: Hero(
                                  tag: diaryEntries.items[i].id,
                                  child: ListItem(
                                      diaryEntries.items[i].id,
                                      diaryEntries.items[i].title,
                                      diaryEntries.items[i].description,
                                      img),
                                ),
                              );
                            }),
              ),
      ),
    );
  }
}
