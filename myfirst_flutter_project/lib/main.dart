import 'package:flutter/material.dart';

void main() => runApp(ProjectId());

class ProjectId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class NinjaCard extends StatefulWidget
{
  
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Project ID'),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: CircleAvatar(
                backgroundImage: AssetImage("assets/pokemon.jpg"),
                radius: 50,
              )),
              Divider(
                height: 30,
              ),
              Text("NAME",
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0)),
              SizedBox(
                height: 10,
              ),
              Text("Ly Thanh Hai",
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Text("Current level",
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0)),
              SizedBox(
                height: 10,
              ),
              Text("8",
                  style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.mail, color: Colors.grey[400]),
                  SizedBox(
                    width: 10,
                  ),
                  Text("lythanhhait@gmail.com",
                      style: TextStyle(
                        color: Colors.grey[400],
                        letterSpacing: 1,
                        fontSize: 18,
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
