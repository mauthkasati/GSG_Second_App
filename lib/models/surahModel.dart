// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class SurahModel {
  int? id;
  int? numOfAllPerSurah = 0;

  SurahModel({this.id, this.numOfAllPerSurah});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'numOfAllPerSurah': numOfAllPerSurah,
    };
  }

  factory SurahModel.fromMap(Map<String, dynamic> map) {
    return SurahModel(
      id: map['id'] != null ? map['id'] as int : null,
      numOfAllPerSurah: map['numOfAllPerSurah'] != null
          ? map['numOfAllPerSurah'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SurahModel.fromJson(String source) =>
      SurahModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
