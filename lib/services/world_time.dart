import 'package:http/http.dart'as http;
import 'package:intl/intl.dart';

import 'dart:convert';


class WorldTime{
  String ?time;
  String location;
  String url;
  String flag;
  bool ?is_daytime;

  WorldTime({required this.flag, required this.location, required this.url});

  Future<void> getTime() async{
   var endPoint = "http://worldtimeapi.org/api/timezone/$url";
    try{

    var response = await http.get(Uri.parse(endPoint));
    Map data = jsonDecode(response.body);
    // geting properties from data 
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // converting to datetime 

    DateTime dateTime = DateTime.parse(datetime);
    DateTime now =dateTime.add(Duration(hours: int.parse(offset)));

    // formating date time to am pm 
    var format = DateFormat.jm();


    is_daytime= (6<=now.hour && now.hour <= 18)?true:false;

    var dateString = format.format(now);
    time=dateString;

    } 
    catch(e){
      time = "couldn't get time ";
    }


  }





  
  
}