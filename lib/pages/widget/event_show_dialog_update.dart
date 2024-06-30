// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttercrud/models/response/another_response_model.dart';

import '../../datasources/remote_event_datasource.dart';
import '../../models/requests/all_request_Event_model.dart';
import '../../models/response/get_event_response_model.dart';


class EventShowDialogUpdate extends StatefulWidget {
  final Event event;

  const EventShowDialogUpdate({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  _EventShowDialogUpdateState createState() => _EventShowDialogUpdateState();
}

class _EventShowDialogUpdateState extends State<EventShowDialogUpdate> {
  late TextEditingController _namaController;
  late TextEditingController _tanggalController;
  late TextEditingController _lokasiController;
  late TextEditingController _deskripsiController;
  late TextEditingController _gambarController;

  final EventRemoteDatasource _datasource = EventRemoteDatasource();

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.event.namaEvent);
    _tanggalController = TextEditingController(text: widget.event.tanggalEvent);
    _lokasiController = TextEditingController(text: widget.event.lokasiEvent);
    _deskripsiController = TextEditingController(text: widget.event.deskripsi);
    _gambarController = TextEditingController(text: widget.event.gambar);
  }

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
      title: Text('Update Event'),
      content: Column(
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
            decoration: InputDecoration(labelText: 'Gambar'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Update'),
          onPressed: () async {
            String nama = _namaController.text;
            String tanggal = _tanggalController.text;
            String lokasi = _lokasiController.text;
            String deskripsi = _deskripsiController.text;
            String gambar = _gambarController.text;

            // Create the request model
            AllRequestEventModel updateModel = AllRequestEventModel(
              id: int.parse(widget.event.id),
              nama_event: nama,
              tanggal_event: tanggal,
              lokasi_event: lokasi,
              deskripsi: deskripsi,
              gambar: gambar,
            );

            try {
              // Perform update operation
              AnotherResponseModel response =
                  await _datasource.updateEvent(updateModel);
              if (response.status == 200) {
                print('Update successful: ${response.result}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Update successful: ${response.result}')),
                );
              } else {
                print('Update failed: ${response.result}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Update failed: ${response.result}')),
                );
              }
            } catch (e) {
              print('Update error: $e');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Update error: $e')),
              );
            }

            // Close the dialog
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
