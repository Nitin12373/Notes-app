import 'package:flutter/material.dart';
import 'package:managenotes/model/datamodel.dart';
import 'package:managenotes/providers/notesmanager.dart';
import 'package:provider/provider.dart';

class DisplayNotesContent extends StatelessWidget {
  const DisplayNotesContent({Key? key}) : super(key: key);

  static const String routeName = '/displayNotes';

  @override
  Widget build(BuildContext context) {
    NotesManager provider = Provider.of<NotesManager>(context, listen: false);
    DataModel displayNote = provider.notes[provider.getIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Notes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              displayNote.title.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              displayNote.description.toString(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
