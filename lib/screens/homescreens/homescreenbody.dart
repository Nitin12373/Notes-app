import 'package:flutter/material.dart';

import '../../model/datamodel.dart';
import '../../model/notetile.dart';

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key? key, required this.displayNotes}) : super(key: key);

  List<DataModel> displayNotes;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          title: Text("Manage Notes like a pro"),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(15.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1),
            delegate: SliverChildBuilderDelegate(
                (context, i) => NoteTile(
                      title: widget.displayNotes[i].title.toString(),
                      description:
                          widget.displayNotes[i].description.toString(),
                      date: widget.displayNotes[i].date.toString(),
                      color: widget.displayNotes[i].color as Map,
                      index: i,
                    ),
                childCount: widget.displayNotes.length),
          ),
        ),
      ],
    );
  }
}
