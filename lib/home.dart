import 'package:dmi_practica12_200070/model/Media.dart';
import 'package:flutter/material.dart';
import 'package:dmi_practica12_200070/media_list.dart';
import 'package:dmi_practica12_200070/common/MediaProvider.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState(){
    _pageController = PageController();
    super.initState();
  }
  @override
  void dispose(){
    _pageController?.dispose();
    super.dispose();
  }

  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();
  PageController? _pageController;

  int _page = 0;

  MediaType mediaType = MediaType.movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieApp - 200070"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Material()),
            ListTile(
              title: Text("Peliculas"),
              selected: mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              onTap: (){
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Televisión"),
              selected: mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv_rounded),
              onTap: (){
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: PageView(
        children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _obtenerIconos(),
        onTap: _navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  List<BottomNavigationBarItem> _obtenerIconos() {
    return mediaType == MediaType.movie ? [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_rounded), label: "Populares"),
      BottomNavigationBarItem(
          icon: Icon(Icons.update_rounded), label: "Proximamente"),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_rounded), label: "Mejor Valoradas"),
    ]:
    [
      BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up_alt_rounded), label: "Populares"),
      BottomNavigationBarItem(
          icon: Icon(Icons.update_rounded), label: "Al aire"),
      BottomNavigationBarItem(
          icon: Icon(Icons.star_rounded), label: "Mejor Valoradas"),
    ];
  }

  void _changeMediaType(MediaType type){
    if (mediaType != type) {
      setState(() {
        mediaType = type;
      });
    }
  }

  List<Widget> _getMediaList(){
    return (mediaType == MediaType.movie) ?
    <Widget>[
      MediaList(movieProvider, "popular"),
      MediaList(movieProvider, "upcoming"),
      MediaList(movieProvider, "top_rated"),
    ]:<Widget>[
      MediaList(showProvider, "popular"),
      MediaList(showProvider, "on_the_air"),
      MediaList(showProvider, "top_rated"),
    ];
  }

  void _navigationTapped(int page){
    _pageController?.animateToPage(page, duration: const Duration(seconds: 1), curve: Curves.ease);
    
  }

}
