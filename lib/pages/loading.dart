import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";

  void setupWorldTime(BuildContext context) async {
    WorldTime worldTime = WorldTime(
        flag: "Ethiopia.png",
        location: "Addis Ababa",
        url: "Africa/Addis_Ababa");
        await worldTime.getTime();
      time = worldTime.time.toString();
      
      if (!context.mounted)return;
      Navigator.popAndPushNamed(context, '/home',arguments: {
        "location":worldTime.location,
        "flag":worldTime.flag,
        "time":time,
        "is_daytime":worldTime.is_daytime
      });
    
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(color: Colors.blue[400],)),
    );
  }
}
