import 'dart:convert';

class GetEventResponseModel {
    final int status;
    final List<Event> result;

    GetEventResponseModel({
        required this.status,
        required this.result,
    });

    factory GetEventResponseModel.fromRawJson(String str) => GetEventResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetEventResponseModel.fromJson(Map<String, dynamic> json) => GetEventResponseModel(
        status: json["status"],
        result: List<Event>.from(json["result"].map((x) => Event.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Event {
    final String namaEvent;
    final String tanggalEvent;
    final String lokasiEvent;
    final String deskripsi;
    final String gambar;
    final String id;

    Event({
        required this.namaEvent,
        required this.tanggalEvent,
        required this.lokasiEvent,
        required this.deskripsi,
        required this.gambar,
        required this.id,
    });

    factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        namaEvent: json["nama_event"],
        tanggalEvent: json["tanggal_event"],
        lokasiEvent: json["lokasi_event"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama_event": namaEvent,
        "tanggal_event": tanggalEvent,
        "lokasi_event": lokasiEvent,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "id": id,
    };
}
