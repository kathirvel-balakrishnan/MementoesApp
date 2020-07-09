import 'package:flutter/material.dart';

import 'package:my_diary/providers/my_diary.dart';
import 'package:my_diary/screens/add_diaryEntry_screen.dart';
import 'package:my_diary/screens/diary_home_screen.dart';
import 'package:my_diary/screens/memory_detail_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return ChangeNotifierProvider.value(
      value: MyDiary(),
      child: MaterialApp(
        routes: {
          AddDiaryEntryScreen.routeName: (context) => AddDiaryEntryScreen(),
          MemoryDetailScreen.routeName:(context)=>MemoryDetailScreen(),
        },
        title: '',
        theme: ThemeData(fontFamily: 'Lobster',
          primarySwatch: Colors.purple,
          accentColor: Colors.orangeAccent,
        ),
        home: DiaryHomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
