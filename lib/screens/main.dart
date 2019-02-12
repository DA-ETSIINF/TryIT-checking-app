import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tryit_checkin/routes.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  _MyAppState(){
    final router = new Router();
    Routes().configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return  new MyInheritedWidget(

      child: new MaterialApp (
          debugShowCheckedModeBanner: true,
          title: 'Radix',
          theme: new ThemeData(
            primaryColor: Colors.black,
            primarySwatch: blackish,
            primaryTextTheme: newTextTheme,
            // scaffoldBackgroundColor: Colors.grey[50], //Colors.blue[600],
            bottomAppBarColor: Colors.blueAccent,


          ),

          home: LoginScreen(),
          onGenerateRoute:  Application.router.generator
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {
  };

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Checkin APP'),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('Sesiones: '),
              children: <Widget>[
                //Text('Descripcion'),
                MaterialButton(child: Text('Nombre charla'), onPressed: (){
                    Navigator.of(context).pushNamed(Routes.camera);
                })
              ],
            ),

          ExpansionTile(
            title: Text('Hola el nombre y el id de la charla'),
            children: <Widget>[
              //Text('Descripcion'),
              MaterialButton(child: Icon(Icons.add_a_photo), onPressed: (){})
            ],
          ),

          Divider(),
          MaterialButton(child: MaterialButton(onPressed: null, child: Text("Sincronizar"),),
          onPressed: null, ),
        ],
      )
      
    );
  }
}