import 'dart:io';
import 'package:flutter/foundation.dart';

class DiaryEntry {
  final String id;
  final String title;
  final String description;
  final File image;
  DiaryEntry({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
  });
}
