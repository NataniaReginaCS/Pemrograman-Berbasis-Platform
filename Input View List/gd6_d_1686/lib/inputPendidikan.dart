import 'package:flutter/material.dart';
import 'package:gd6_d_1686/database/sql_helper_pendidikan.dart';
import 'package:gd6_d_1686/entity/pendidikan.dart';
// import 'package:sqflite/database/sql_helper.dart';
// import 'package:sqflite/entity/employee.dart';

class InputPendidikan extends StatefulWidget {
  const InputPendidikan(
      {super.key,
      required this.title,
      required this.id,
      required this.nameSekolah,
      required this.jenjang,
      required this.jurusan});

  final String? title, nameSekolah, jenjang, jurusan;
  final int? id;

  @override
  State<InputPendidikan> createState() => _InputPendidikanState();
}

class _InputPendidikanState extends State<InputPendidikan> {
  TextEditingController controllerNameSekolah = TextEditingController();
  TextEditingController controllerJenjang = TextEditingController();
  TextEditingController controllerJurusan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      controllerNameSekolah.text = widget.nameSekolah!;
      controllerJenjang.text = widget.jenjang!;
      controllerJurusan.text = widget.jurusan!;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("INPUT PENDIDIKAN"),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerNameSekolah,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: controllerJenjang,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Jenjang',
              ),
            ),
            SizedBox(height: 24),
            TextField(
              controller: controllerJurusan,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Jurusan',
              ),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                if (widget.id == null) {
                  await addPendidikan();
                } else {
                  await editPendidikan(widget.id!);
                }
                Navigator.pop(context);
              },
            )
          ],
        ));
  }

  Future<void> addPendidikan() async {
    await SqlHelperPendidikan.addPendidikan(controllerNameSekolah.text,
        controllerJenjang.text, controllerJurusan.text);
  }

  Future<void> editPendidikan(int id) async {
    await SqlHelperPendidikan.editPendidikan(id, controllerNameSekolah.text,
        controllerJenjang.text, controllerJurusan.text);
  }
}
