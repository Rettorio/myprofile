import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Pebble {
  final String image;
  final String title;

  Pebble({required this.image, required this.title});
}


class MyGallery extends StatefulWidget {
  const MyGallery({super.key});


  @override
  State<StatefulWidget> createState()  => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  final List<Pebble> photos = [
    Pebble(image: "assets/gallery/foto_1.jpg", title: "We Ballin (2020)"),
    Pebble(image: "assets/gallery/foto_2.jpg", title: "Gloomy Day (2024)"),
    Pebble(image: "assets/gallery/foto_3.jpg", title: "Sunset at the Side Coast (2022)"),
    Pebble(image: "assets/gallery/foto_4.jpg", title: "Siang Ngantuk bang (2023)"),
    Pebble(image: "assets/gallery/foto_5.jpg", title: "Chillin (2024)"),
    Pebble(image: "assets/gallery/foto_6.jpg", title: "Mothers Love (2024)"),
    Pebble(image: "assets/gallery/foto_7.jpg", title: "Tial (2024)"),
    Pebble(image: "assets/gallery/foto_8.jpg", title: "Am I Dreaming? (2023)"),
    Pebble(image: "assets/gallery/foto_9.jpg", title: "Peradaban (2023)"),
    Pebble(image: "assets/gallery/foto_10.jpg", title: "Haunted House (2023)"),
    Pebble(image: "assets/gallery/foto_12.jpg", title: "Gotham City (2024)"),
  ];

  int _photoIndex = 0;


  void onNextClick() {
    int maxPhoto = photos.length;
    if(_photoIndex+1 == maxPhoto) {
      setState(() {
        _photoIndex = 0;
      });
    } else {
      setState(() {
        _photoIndex += 1;
      });
    }
  }

  void onPreviousClick() {
    if(_photoIndex > 0) {
      setState(() {
        _photoIndex -= 1;
      });
    } else if(_photoIndex == 0) {
      setState(() {
        _photoIndex = photos.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.indigo.shade500,
          centerTitle: true,
          // google fonts
          title: Text(
            'Gallery',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
          ),
        ),
        endDrawer: const AppNavigationDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(photos[_photoIndex].title, style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500
                ),)],
              ),
              const SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                height: 500,
                child: Image.asset(
                  photos[_photoIndex].image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  FilledButton(
                      onPressed: onPreviousClick,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.chevron_left, size: 18),
                          const SizedBox(width: 4),
                          Text("Previous", style: GoogleFonts.poppins(fontSize: 14),)
                        ],
                      )
                  ),
                  const Spacer(),
                  FilledButton(
                      onPressed: onNextClick,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Next", style: GoogleFonts.poppins(fontSize: 14)),
                          const SizedBox(width: 4),
                          const Icon(Icons.chevron_right, size: 18),
                        ],
                      )
                  )
                ],
              ),
              Text(
                "Photo: ${_photoIndex + 1}"
              )
            ],
          ),
        )
    );
  }

}