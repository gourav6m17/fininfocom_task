import 'dart:developer';

import 'package:fininfocom_task/models/dog_image_model.dart';
import 'package:fininfocom_task/network/services.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../../widgets/mybutton.dart';

class RandomImage extends StatefulWidget {
  static String routeName = "/randomimage";

  const RandomImage({super.key});

  @override
  State<RandomImage> createState() => _RandomImageState();
}

class _RandomImageState extends State<RandomImage> {
  late Future<DogImageModel> dogimage;
  @override
  void initState() {
    dogimage = Services.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
          child: FutureBuilder<DogImageModel>(
              future: dogimage,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.status == 'success') {
                  log(snapshot.data!.message);
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 30, top: 100),
                        child: Image(
                            image: NetworkImage(snapshot.data!.message),
                            fit: BoxFit.fill,
                            height: 260.0,
                            width: 200.0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyButton(
                        iconData: Icons.airplane_ticket_rounded,
                        buttonText: 'Random Dog Image',
                        onTap: () async {
                          // Services().fetchData();
                          setState(() {
                            dogimage = Services.fetchData();
                            log("setState ${snapshot.data!.message}");
                            // dogimage = DogImage(message: snapshot.data!.message, status: snapshot.data!.status);
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                  // return Text(snapshot.data!.status);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}
