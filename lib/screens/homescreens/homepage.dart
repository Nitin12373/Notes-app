import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/datamodel.dart';
import '../../providers/notesmanager.dart';
import '../inputbox.dart';
import 'homescreenbody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    NotesManager data = Provider.of<NotesManager>(context);
    List<DataModel> displayNotes = data.notes;
    return Scaffold(
      appBar: displayNotes.isEmpty
          ? AppBar(
              title: const Text('Manage Notes like a pro'),
            )
          : null,
      body: displayNotes.isEmpty
          ? const Center(
              child: Text("No Notes"),
            )
          : HomeScreenBody(
              displayNotes: displayNotes,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            builder: (context) => const InputModel(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
