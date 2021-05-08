import 'dart:core';

import 'package:flutter/cupertino.dart';
// each diary entry have id, date, emoji, and info
class diaryEntry{
  int id;
  String date;
  String emoji;
  String info;

  diaryEntry({this.id, this.date, this.emoji, this.info});

  //used for database
  Map<String, dynamic> toMap() => <String, dynamic>{
      'id': id,
      'date': date,
      'emoji': emoji,
      'info': info
  };

}
