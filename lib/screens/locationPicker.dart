/*import 'package:flutter/material.dart';
import 'package:google_map_location_picker/generated/l10n.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocationResult _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const[

        S.delegate,

      ],
      home: Scaffold(
        appBar: AppBar(
          title: Text('hi'),

        ),
        body: Builder(
          builder: (context){
            return Center(
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: ()async{
                      LocationResult result = await showLocationPicker(
                          context,"AIzaSyCk2h9mrTtGLS4NGebaNbNuM83_4Rj9nIw",
                          initialCenter: LatLng(31.197,29.95),
                          myLocationButtonEnabled: true,
                          layersButtonEnabled: true,
                          desiredAccuracy: LocationAccuracy.best
                      );
                      print(result.toString());
                      setState(()=>_pickedLocation = result);
                    },
                    child: Text('Pick location'),
                  ),
                  Text(_pickedLocation.toString())
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
*/