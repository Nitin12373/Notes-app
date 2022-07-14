import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../model/datamodel.dart';
import '../providers/notesmanager.dart';

class InputModel extends StatefulWidget {
  const InputModel({Key? key}) : super(key: key);

  @override
  State<InputModel> createState() => _InputModelState();
}

class _InputModelState extends State<InputModel> {
  Color myColor = const Color.fromARGB(255, 16, 134, 231);
  Color changeButtonTextColor = Colors.white;

  TextEditingController tf1 = TextEditingController();
  TextEditingController tf2 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tf1.addListener(() {});
    tf2.addListener(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tf1.dispose();
    tf2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NotesManager setProvider =
        Provider.of<NotesManager>(context, listen: false);

    if (myColor.red + myColor.green + myColor.blue >= 500) {
      changeButtonTextColor = Colors.black;
    } else {
      changeButtonTextColor = Colors.white;
    }

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.87,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints dimens) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialogForColorPicker(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(myColor),
                ),
                child: Text("Change Color",
                    style: TextStyle(color: changeButtonTextColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: dimens.maxWidth * 0.6,
                  height: dimens.maxHeight * 0.2,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      label: Text("Enter Title"),
                    ),
                    controller: tf1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: dimens.maxWidth * 0.6,
                  height: dimens.maxHeight * 0.2,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18),
                        ),
                      ),
                      label: Text("Enter Description"),
                    ),
                    controller: tf2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: ElevatedButton(
                  onPressed: () {
                    setProvider.setNotes(DataModel(
                        title: tf1.text,
                        description: tf2.text,
                        date: DateTime.now().toString().substring(0, 10),
                        color: <String, String>{
                          'a': myColor.alpha.toString(),
                          'r': myColor.red.toString(),
                          'g': myColor.green.toString(),
                          'b': myColor.blue.toString(),
                        }));
                    Navigator.pop(context);
                  },
                  child: const Text("Done"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showDialogForColorPicker(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: myColor,
            onColorChanged: (newColor) => setState(
              () => setState(() => myColor = newColor),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }
}
