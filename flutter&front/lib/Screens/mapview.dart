import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class mapclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(24.895385, 91.871112),
        zoom: 17.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/avishakaurgho/ckehgt7y93sxu19qspmbeajq6/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXZpc2hha2F1cmdobyIsImEiOiJja2VlbndsYmkwcjJpMnJtbmVoa2wzdXMwIn0.vtyEBCqNkDnC7tQXeyaIFw",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoiYXZpc2hha2F1cmdobyIsImEiOiJja2VlbndsYmkwcjJpMnJtbmVoa2wzdXMwIn0.vtyEBCqNkDnC7tQXeyaIFw',
            'id': 'mapbox://styles/avishakaurgho/ckehgt7y93sxu19qspmbeajq6',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 50.0,
              height: 50.0,
              point: new LatLng(24.895385, 91.871112),
              builder: (ctx) => new Container(
                child: new Image.asset('assets/images/foodlocation.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
