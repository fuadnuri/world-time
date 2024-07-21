import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: "Africa/Addis_Ababa", location: "Addis Ababa", flag: "ET.png"),
    WorldTime(url: "Europe/London", location: "London", flag: "UK.png"),
    WorldTime(url: "Europe/Berlin", location: "Berlin", flag: "GM.png"),
    WorldTime(url: "Africa/Cairo", location: "Cairo", flag: "EG.png"),
    WorldTime(url: "Africa/Nairobi", location: "Nairobi", flag: "KN.png"),
    WorldTime(url: "America/New_York", location: "New York", flag: "US.png"),
  ];

  @override
  void initState() {
    super.initState();
  }

  // ListView listViewBuilder = ()=>{
  //   ListView a = lis
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("location"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/flags/${locations[index].flag}"),
                  ),
                  title: Text(locations[index].location),
                  onTap: () async {
                    
                    WorldTime instance = locations[index];
                    await instance.getTime();
                    if(!context.mounted)return;
                    Navigator.popAndPushNamed(
                      context,
                      "/home",
                      arguments: {
                        "location": instance.location,
                        "flag": instance.flag,
                        "time": instance.time,
                        "is_daytime": instance.is_daytime
                      },
                    );
                  },
                ),
              ),
            );
          },
          itemCount: locations.length,
        ));
  }
}
