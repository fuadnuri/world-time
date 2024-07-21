import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  // Icon ?is_daytime =(bool dn)=>dn?Icon(icon:Icons.star):Icon(:Icons.sunny);

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    String img = data['is_daytime'] ? "day.jpg" : "night.jpg";

    Color bg = data["is_daytime"] ? Colors.blue : Colors.indigo;
    // print(data);
    return Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/$img"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 160.0,
                ),
                TextButton.icon(
                  label: const Text("edit location",style: TextStyle(color: Colors.grey),),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/location');
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "${data['location']}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            letterSpacing: 2.0),
                      ),
                      Text(
                        "${data['time']}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
