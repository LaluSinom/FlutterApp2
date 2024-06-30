import 'package:flutter/material.dart';
import 'package:fluttercrud/datasources/remote_event_datasource.dart';
import 'package:fluttercrud/models/response/get_event_response_model.dart';

import '../../models/requests/all_request_Event_model.dart';
import '../widget/event_show_dialog_add.dart';
import '../widget/event_show_dialog_update.dart';
import 'detail_event.dart';

class EventUi extends StatefulWidget {
  const EventUi({Key? key}) : super(key: key);

  @override
  _EventUiState createState() => _EventUiState();
}

class _EventUiState extends State<EventUi> {
  late Future<GetEventResponseModel> _futureEvent;
  final EventRemoteDatasource _datasource = EventRemoteDatasource();

  @override
  void initState() {
    super.initState();
    _futureEvent = _datasource.getEvent();
  }

  void _showUpdateDialog(BuildContext context, Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EventShowDialogUpdate(event: event);
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EventShowDialogAdd();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event List'),
      ),
      body: FutureBuilder<GetEventResponseModel>(
        future: _futureEvent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final response = snapshot.data!;
            return ListView.builder(
              itemCount: response.result.length,
              itemBuilder: (context, index) {
                final event = response.result[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    leading: Image.network(
                      event.gambar,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      event.namaEvent,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      event.lokasiEvent,
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _showUpdateDialog(context, event);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            AllRequestEventModel deleteEventModel =
                                AllRequestEventModel(
                              id: int.parse(event.id),
                              nama_event: event.namaEvent,
                              tanggal_event: event.tanggalEvent,
                              lokasi_event: event.lokasiEvent,
                              deskripsi: event.deskripsi,
                              gambar: event.gambar,
                            );

                            try {
                              final response = await _datasource
                                  .deleteEvent(deleteEventModel);
                              if (response.status == 200) {
                                print('Delete successful: ${response.result}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Delete successful: ${response.result}')),
                                );
                                setState(() {
                                  _futureEvent = _datasource.getEvent();
                                });
                              } else {
                                print('Delete failed: ${response.result}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Delete failed: ${response.result}')),
                                );
                              }
                            } catch (e) {
                              print('Delete error: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Delete error: $e')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailEvent(event: event)));
                    }
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
