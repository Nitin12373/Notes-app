import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/notesmanager.dart';
import 'screens/homescreens/homepage.dart';
import 'screens/displaycontent/displaynotes.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => NotesManager(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Notes',
      home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DisplayNotesContent.routeName: (context) => const DisplayNotesContent(),
      },
    );
  }
}
