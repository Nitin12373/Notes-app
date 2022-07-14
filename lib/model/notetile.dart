import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notesmanager.dart';
import '../screens/displaycontent/displaynotes.dart';

class NoteTile extends StatefulWidget {
  const NoteTile({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
    required this.index,
  }) : super(key: key);

  final String title;
  final String description;
  final String date;
  final Map color;
  final int index;

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  bool isFavorite = false;

  IconData favIcon = Icons.favorite;
  IconData notFavIcon = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    Color noteTileBackgroundColor = Color.fromARGB(
        int.parse(widget.color['a'].toString()),
        int.parse(widget.color['r'].toString()),
        int.parse(widget.color['g'].toString()),
        int.parse(widget.color['b'].toString()));
    Color textColor = Colors.black;

    if (noteTileBackgroundColor.red +
            noteTileBackgroundColor.green +
            noteTileBackgroundColor.blue <=
        170) {
      textColor = Colors.white;
    }

    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(14),
      ),
      onTap: () {
        Provider.of<NotesManager>(context, listen: false)
            .keepIndex(widget.index);
        Navigator.pushNamed(context, DisplayNotesContent.routeName);
      },
      splashColor: const Color.fromARGB(30, 0, 0, 0),
      child: Ink(
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: noteTileBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Provider.of<NotesManager>(context, listen: false)
                      .removeAtIndex(widget.index),
                  child: Icon(
                    Icons.delete,
                    size: 20,
                    color: noteTileBackgroundColor.red <= 200
                        ? const Color.fromARGB(255, 255, 20, 3)
                        : Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () => setState(() => isFavorite = !isFavorite),
                    child: isFavorite
                        ? Icon(
                            favIcon,
                            color: textColor,
                          )
                        : Icon(
                            notFavIcon,
                            color: textColor,
                          )),
                Text(
                  widget.date,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
