import 'package:flutter/material.dart';
import 'package:fluttercrud/datasources/remote_event_datasource.dart';
import 'package:fluttercrud/models/response/another_response_model.dart';

import '../../models/requests/all_request_Event_model.dart';

class EventShowDialogAdd extends StatefulWidget {
  const EventShowDialogAdd({Key? key}) : super(key: key);

  @override
  _EventShowDialogAddState createState() => _EventShowDialogAddState();
}

class _EventShowDialogAddState extends State<EventShowDialogAdd> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _gambarController = TextEditingController();
  final EventRemoteDatasource _datasource = EventRemoteDatasource();

  @override
  void dispose() {
    _namaController.dispose();
    _tanggalController.dispose();
    _lokasiController.dispose();
    _deskripsiController.dispose();
    _gambarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Event'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Event'),
            ),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(labelText: 'Tanggal Event'),
            ),
            TextField(
              controller: _lokasiController,
              decoration: InputDecoration(labelText: 'Lokasi Event'),
            ),
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            TextField(
              controller: _gambarController,
              decoration: InputDecoration(labelText: 'Gambar URL'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Add'),
          onPressed: () async {
            // Collect the data and close the dialog
            final String nama = _namaController.text;
            final String tanggal = _tanggalController.text;
            final String lokasi = _lokasiController.text;
            final String deskripsi = _deskripsiController.text;
            final String gambar = _gambarController.text;

            if (nama.isNotEmpty && tanggal.isNotEmpty && lokasi.isNotEmpty && deskripsi.isNotEmpty && gambar.isNotEmpty) {
              AllRequestEventModel addEventModel = AllRequestEventModel(
                nama_event: nama,
                tanggal_event: tanggal,
                lokasi_event: lokasi,
                deskripsi: deskripsi,
                gambar: gambar,
              );

              try {
                // Perform Add operation
                AnotherResponseModel response = await _datasource.addEvent(addEventModel);
                if (response.status == 200) {
                  print('Add successful: ${response.result}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Add successful: ${response.result}'),
                    ),
                  );
                } else {
                  print('Add failed: ${response.result}');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Add failed: ${response.result}'),
                    ),
                  );
                }
              } catch (e) {
                print('Add error: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add error: $e')),
                );
              }

              // Close the dialog
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('All fields are required')),
              );
            }
          },
        ),
      ],
    );
  }
}
