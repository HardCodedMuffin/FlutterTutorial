import 'package:flutter/material.dart';
import 'GridPhotoViewer.dart';
import 'Photo.dart';

class GridListDemo extends StatefulWidget {
  const GridListDemo({Key? key}) : super(key: key);

  static const String routeName = '/material/grid-list';

  @override
  GridListDemoState createState() => GridListDemoState();
}

class GridListDemoState extends State<GridListDemo> {
  GridDemoTileStyle _tileStyle = GridDemoTileStyle.twoLine;

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'images/india_chennai_flower_market.png',
      title: 'Chennai',
      caption: 'Flower Market',
    ),
    Photo(
      assetName: 'images/india_tanjore_bronze_works.png',
      title: 'Tanjore',
      caption: 'Bronze Works',
    ),
    Photo(
      assetName: 'images/india_tanjore_market_merchant.png',
      title: 'Tanjore',
      caption: 'Market',
    ),
    Photo(
      assetName: 'images/india_tanjore_thanjavur_temple.png',
      title: 'Tanjore',
      caption: 'Thanjavur Temple',
    ),
    Photo(
      assetName: 'images/india_tanjore_thanjavur_temple_carvings.png',
      title: 'Tanjore',
      caption: 'Thanjavur Temple',
    ),
    Photo(
      assetName: 'images/india_pondicherry_salt_farm.png',
      title: 'Pondicherry',
      caption: 'Salt Farm',
    ),
    Photo(
      assetName: 'images/india_chennai_highway.png',
      title: 'Chennai',
      caption: 'Scooters',
    ),
    Photo(
      assetName: 'images/india_chettinad_silk_maker.png',
      title: 'Chettinad',
      caption: 'Silk Maker',
    ),
    Photo(
      assetName: 'images/india_chettinad_produce.png',
      title: 'Chettinad',
      caption: 'Lunch Prep',
    ),
    Photo(
      assetName: 'images/india_tanjore_market_technology.png',
      title: 'Tanjore',
      caption: 'Market',
    ),
    Photo(
      assetName: 'images/india_pondicherry_beach.png',
      title: 'Pondicherry',
      caption: 'Beach',
    ),
    Photo(
      assetName: 'images/india_pondicherry_fisherman.png',
      title: 'Pondicherry',
      caption: 'Fisherman',
    ),
  ];

  void changeTileStyle(GridDemoTileStyle value) {
    setState(() {
      _tileStyle = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid list'),
        actions: <Widget>[
          PopupMenuButton<GridDemoTileStyle>(
            onSelected: changeTileStyle,
            itemBuilder: (BuildContext context) =>
                <PopupMenuItem<GridDemoTileStyle>>[
              const PopupMenuItem<GridDemoTileStyle>(
                value: GridDemoTileStyle.imageOnly,
                child: Text('Image only'),
              ),
              const PopupMenuItem<GridDemoTileStyle>(
                value: GridDemoTileStyle.oneLine,
                child: Text('One line'),
              ),
              const PopupMenuItem<GridDemoTileStyle>(
                value: GridDemoTileStyle.twoLine,
                child: Text('Two line'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SafeArea(
              top: false,
              bottom: false,
              child: GridView.count(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: const EdgeInsets.all(4.0),
                childAspectRatio:
                    (orientation == Orientation.portrait) ? 1.0 : 1.3,
                children: photos.map<Widget>((Photo photo) {
                  return GridDemoPhotoItem(
                    photo: photo,
                    tileStyle: _tileStyle,
                    onBannerTap: (Photo photo) {
                      setState(() {
                        photo.isFavorite = !photo.isFavorite;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
