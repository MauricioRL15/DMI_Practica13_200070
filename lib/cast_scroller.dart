import 'package:dmi_practica13_200070/common/MediaProvider.dart';
import 'package:dmi_practica13_200070/model/Cast.dart';
import 'package:flutter/material.dart';

class CastController extends StatefulWidget {
  final MediaProvider provider;
  final int mediaId;
  CastController(this.provider, this.mediaId);

  @override
  _CastControllerState createState() => _CastControllerState();
}

class _CastControllerState extends State<CastController> {
  
  @override
  void initState(){
    super.initState();
    loadCast();
  }

  final List<Cast> _casts = [];
  void loadCast() async{
    var results = await widget.provider.fetchCast(widget.mediaId);
    setState(() {
      _casts.addAll(results);
    });

  }

  Widget _builderCasts(BuildContext ctx, int index){
    var cast = _casts[index];
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            cast.getCastUrl()
          ),
          radius: 40.0,
        ),
        Padding(padding: const EdgeInsets.only(top: 16.0),
        child: Text(cast.name),)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: const Size.fromHeight(180.0),
          child: ListView.builder(
            itemCount: _casts.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _builderCasts,
          ),
        )
      ],
    );
  }
}