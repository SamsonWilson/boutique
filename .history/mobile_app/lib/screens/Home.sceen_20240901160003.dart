import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_app/services/Produit.service.dart';

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
            // page de Promotions
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const HeroPages(),
            ),
            // page Categories
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const CategoriesWidget(),
            )
          ],
        )
        // const Center(
        //   child: Text('Home Screen', style: TextStyle(color: Colors.blue)),
        // ),
        );
  }
}

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List categories = [];

  @override
  void initState() {
    super.initState();
    ProduitService.categories().then(
      (value) => setState(() => categories = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Categories',
            style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey)),
        SizedBox(height: 8),
       FutureBuilder(future: ProduitService.categories(), builder: (context, Snapshot){
        if(Snapshot.hasData){
          return List
        }
       })
      ]),
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
      'title': '20%  de reductionhhhh \n hhhhhh',
      'image':
          'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'
    },
    {
      'code': 'lkjfgjghlkjh',
      'title': 'djdfjdh  \n jhsdlfdsfl',
      'image':
          'https://www.powertrafic.fr/wp-content/uploads/2023/04/image-ia-exemple.png'
    },
    {
      'code': 'lkjfgjghlkjh',
      'title': 'djdfjdh  \n jhsdlfdsfl',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV3GxqVCdRvibHDcK2TBtYJAvXugHcIxC277FX0DKU6YIF33ZxQB5z-7DAIVHyzPGS44s&usqp=CAU'
    },
  ];

  int _currentinfo = 0;

  final _pageController = PageController();
  // late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() => _currentinfo = _pageController.page!.round());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: NetworkImage(_infos[_currentinfo]['image']!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: _infos
                .map(
                  (info) => Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: buildInfo(info),
                  ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _infos[_currentinfo]['code']!.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _infos[_currentinfo]['title']!.split('\n').map((word) {
            return Text(
              word.trim(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            );
          }).toList(),
        ),

        //  le boutom sur de reduition

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('shop now '),
        ),
      ],
    );
  }
}
