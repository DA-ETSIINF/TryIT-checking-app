
import 'dart:async';


import 'package:flutter/cupertino.dart';

class _MyInherited extends InheritedWidget {
  _MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);



  final MyInheritedWidgetState data;

  @override
  bool updateShouldNotify(_MyInherited oldWidget) {
    return true;
  }
}



class MyInheritedWidget extends StatefulWidget {
  MyInheritedWidget({
    Key key,
    this.child,
  }): super(key: key);

  final Widget child;

  @override
  MyInheritedWidgetState createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited).data;
  }

}

class MyInheritedWidgetState extends State<MyInheritedWidget>{


  ///Getter UserHome data
  UserHome get user_home => _user_home;

  /// Getter  waves list
  List<Waves> get waves_list => _waves_list;

  /// Getter  wavesfederation list
  List<WavesFederation> get federations => _federations;

  ///Getter index selected federation
  int get selectedFederation => _selectedFederation;

  /// Helper method to rebuild widgets when needed
  void selectFeederation(indexNewSelectedFederation){
    setState(() {
      _selectedFederation = indexNewSelectedFederation;
    });
  }

  /// Helper method to add a shake
  void addShake(int waveindex, Shakes newshake){
    setState((){
      _waves_list[waveindex].shakes.add(newshake);
    });
  }
  /// Helper method to add a wave
  void addWave(Waves new_wave){
    setState((){
      _waves_list.add(new_wave);
    });
  }

  ///Helper method to update (and rebuild) of the widget and ALL API data
  void statusUpdate(){
    setState((){
      _getTrending().then((_data){
        setState(() {
          _waves_list = _data;
        });
      });
    });
    _getHome().then( (_data) {
      setState(() {
        _user_home = _data;
      });
    }
    );
  }

  void homeUpdate() {
    _getHome().then( (_data) {
      setState(() {
        _user_home = _data;
      });
    }
    );
  }



  Future<List<Waves>> _getTrending() async {

    return GetApiData().getTrending();
  }

  Future<UserHome> _getHome() async {
    return GetApiData().getUserHome();
  }



  @override
  void initState() {

    _getHome().then( (_data) {
      setState(() {
        _user_home = _data;
      });
    }
    );
    _getTrending().then((_data){
      setState(() {
        _waves_list = _data;
      });
    });

    super.initState();
  }
  @override
  void didUpdateWidget(MyInheritedWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    _waves_list = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}
