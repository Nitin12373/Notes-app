import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:managenotes/model/datamodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesManager with ChangeNotifier {
  SharedPreferences? pref;
  List<DataModel> notes = [];

  NotesManager() {
    init();
  }

  init() async {
    pref = await SharedPreferences.getInstance();
    String? data = pref!.getString("notes");
    if (data != null) {
      var usable = jsonDecode(data);
      notes = (usable as List).map((e) {
        var ele = (e as Map);
        return DataModel.fromJson(ele);
      }).toList();
      notifyListeners();
    }
  }

  void setNotes(DataModel newData) async {
    notes.add(newData);
    await pref!
        .setString("notes", jsonEncode(notes.map((e) => e.toJson()).toList()));
    notifyListeners();
  }

  void removeAtIndex(int index) async {
    notes.removeAt(index);
    await pref!
        .setString("notes", jsonEncode(notes.map((e) => e.toJson()).toList()));
    notifyListeners();
  }

  int index = 0;

  void keepIndex(int index) {
    this.index = index;
  }

  get getIndex => index;
}
