import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _quantity = 0; // underline for make it private
  String _message = "Pode entrar !";

  void _update(int delta){

    setState(() {
      if(_quantity<100)
        _quantity+=delta;

      if(_quantity<0) {
        _message = "? oditrevni odnuM";
      } else if(_quantity == 100){
        _message = "Lotado !";
      } else {
        _message = "Pode entrar !";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Image.asset("images/app_background.jpg", fit: BoxFit.cover, height: 1280.0),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
                "Pessoas: $_quantity",
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style:
                      TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                    onPressed: (){
                      _update(-1);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style:
                      TextStyle(color: Colors.white, fontSize: 60.0),
                    ),
                    onPressed: (){
                      _update(1);
                    },
                  ),
                ),

              ],
            ),

            Text(
              _message,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
