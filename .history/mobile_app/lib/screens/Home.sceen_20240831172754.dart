import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TextField(
            decoration: InputDecoration(
                hintText: 'Recherche',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const HeroPages(),
            )
          ],
        )
        // const Center(
        //   child: Text('Home Screen', style: TextStyle(color: Colors.blue)),
        // ),
        );
  }
}

class HeroPages extends StatefulWidget {
  const HeroPages({super.key});

  @override
  State<HeroPages> createState() => _HeroPagesState();
}

class _HeroPagesState extends State<HeroPages> {
  final _infos = [
    {
      'code': 'Produit cosmetic',
      'title': '20%  de reduction',
      'image':
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'
    },
    {
      'code': 'lkjfgjghlkjh',
      'title': 'djdfjdhjhsdlfdsfl',
      'image':
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'
    },
    {
      'code': 'lkjfgjghlkjh',
      'title': 'djdfjdhjhsdlfdsfl',
      'image':
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'
    },
  ];

  int _currentinfo = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(image: NetworkImage(_infos[_currentInfo]['image']),
        ),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Stack(
        children: [
          PageView(
            children: _infos
                .map(
                  (info) => buildInfo(info),
                )
                .toList(),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(bottom: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _infos.map((info) => _builPageination(info)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builPageination(Map<String, String> info) {
    return Container(
      width: _infos.indexOf(info) == _currentinfo ? 30 : 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
          color: _infos.indexOf(info) == _currentinfo
              ? Colors.white
              : Colors.white54,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget buildInfo(Map<String, String> info) {
    return Stack(
      children: [
        Positioned(
          top: 29,
          left: 29,
          child: Text(
            _infos[_currentinfo]['code']!.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Positioned(
          top: 59,
          left: 29,
          child: Text(
            _infos[_currentinfo]['title']!.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
