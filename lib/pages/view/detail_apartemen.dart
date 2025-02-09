// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttercrud/models/response/get_apartemen_response_model.dart';

class DetailApartemen extends StatefulWidget {
  const DetailApartemen({super.key, required this.apartemen});

  final Result apartemen;

  @override
  State<DetailApartemen> createState() => _DetailApartemenState();
}

class _DetailApartemenState extends State<DetailApartemen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.blueGrey,
              size: 24.0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        height: 90.0,
        child: ElevatedButton.icon(
          icon: const Icon(Icons.shopping_cart),
          label: const Text("Add to cart"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // <-- Radius
            ),
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                         widget.apartemen.gambar
                          ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0.0,
                          bottom: 0.0,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.download,
                                  color: Colors.blueGrey,
                                  size: 24.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.blueGrey,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.6,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                   Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.apartemen.namaApartemen,
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      Text(
                        "(4.8)",
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.apartemen.alamat,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "100 USD",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "70 USD",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Card(
                        color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "Save 30%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Description",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Size",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      List items = [
                        {
                          "label": "XS",
                          "value": "XS",
                        },
                        {
                          "label": "S",
                          "value": "S",
                        },
                        {
                          "label": "M",
                          "value": "M",
                        },
                        {
                          "label": "L",
                          "value": "L",
                        },
                        {
                          "label": "XL",
                          "value": "XL",
                        },
                        {
                          "label": "XXL",
                          "value": "XXL",
                        },
                        {
                          "label": "XXXL",
                          "value": "XXXL",
                        }
                      ];

                      return SizedBox(
                        height: 60.0,
                        child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Map item = items[index];

                            return Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Colors.blueGrey.withOpacity(0.4),
                                child: Text(
                                  item["label"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Color",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      List items = [
                        {
                          "color": Colors.white,
                          "text_color": Colors.black,
                          "label": "White",
                          "value": "White",
                        },
                        {
                          "color": Colors.black,
                          "text_color": Colors.white,
                          "label": "Black",
                          "value": "Black",
                        },
                        {
                          "color": Colors.brown,
                          "text_color": Colors.white,
                          "label": "Brown",
                          "value": "Brown",
                        },
                        {
                          "color": Colors.green,
                          "text_color": Colors.white,
                          "label": "Green",
                          "value": "Green",
                        },
                        {
                          "color": Colors.blue,
                          "text_color": Colors.white,
                          "label": "Blue",
                          "value": "Blue",
                        },
                      ];

                      return SizedBox(
                        height: 40.0,
                        child: ListView.builder(
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Map item = items[index];

                            return Container(
                              width: 100.0,
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                color: item["color"],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    16.0,
                                  ),
                                ),
                                border: Border.all(
                                  width: 0.4,
                                  color: Colors.blueGrey[300]!,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  item["label"],
                                  style: TextStyle(
                                    color: item["text_color"],
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
