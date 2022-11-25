// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class NoteModel {
  int? id;
  int? surahID;
  String? catagory;
  int? verseID;
  String? noteText;
  NoteModel({
    this.id,
    this.surahID,
    this.catagory,
    this.verseID,
    this.noteText,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'surahID': surahID,
      'catagory': catagory,
      'verseID': verseID,
      'noteText': noteText,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] != null ? map['id'] as int : null,
      surahID: map['surahID'] != null ? map['surahID'] as int : null,
      catagory: map['catagory'] != null ? map['catagory'] as String : null,
      verseID: map['verseID'] != null ? map['verseID'] as int : null,
      noteText: map['noteText'] != null ? map['noteText'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
