import 'dart:convert';

class AllRequestEventModel {
    final String nama_event;
    final String tanggal_event;
    final String lokasi_event;
    final String deskripsi;
    final String gambar;
    int? id;

    AllRequestEventModel({
        required this.nama_event,
        required this.tanggal_event,
        required this.lokasi_event,
        required this.deskripsi,
        required this.gambar,
        this.id,
    });

    factory AllRequestEventModel.fromRawJson(String str) => AllRequestEventModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AllRequestEventModel.fromJson(Map<String, dynamic> json) => AllRequestEventModel(
        nama_event: json["nama_event"],
        tanggal_event: json["tanggal_event"],
        lokasi_event: json["lokasi_event"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "nama_event": nama_event,
        "tanggal_event": tanggal_event,
        "lokasi_event": lokasi_event,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "id": id,
    };
}
