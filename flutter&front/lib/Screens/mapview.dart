import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class mapclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var latLng = new LatLng(51.5, -0.09);
    return new FlutterMap(
      options: new MapOptions(
        center: latLng,
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/avishakaurgho/ckeeo3dgx132t19rkx47ebwbt/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXZpc2hha2F1cmdobyIsImEiOiJja2VlbndsYmkwcjJpMnJtbmVoa2wzdXMwIn0.vtyEBCqNkDnC7tQXeyaIFw",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoiYXZpc2hha2F1cmdobyIsImEiOiJja2VlbzBjOTUwdXJtMnlsdHVqdWV1dTk5In0.KTBn8X2nTeLTuXZEAPtwxQ',
            'id': 'mapbox.mapbox-streets-v8',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) => new Container(
                child: new Image.asset('assets/images/locationicon.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
