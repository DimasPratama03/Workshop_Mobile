import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> agama = [
    "Islam",
    "Kristen",
    "Budha",
    "Katholic",
    "Hindu",
  ];

  String _agama = "Islam";

  String _jk = "";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihjk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimdata() {
    // ignore: unnecessary_new
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Password : ${controllerPass.text}"),
            new Text("Moto Hidup : ${controllerMoto.text}"),
            new Text("Jenis Kelamin : ${_jk}"),
            new Text("agama : ${_agama}"),
            new ElevatedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                padding: MaterialStateProperty.all(EdgeInsets.all(25)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Data diri"),
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: <Widget>[
          new TextField(
            controller: controllerNama,
            decoration: new InputDecoration(
                hintText: "Nama Lengkap",
                labelText: "Nama Lengkap",
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            controller: controllerPass,
            obscureText: true,
            decoration: new InputDecoration(
                hintText: "Password",
                labelText: "Password",
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            controller: controllerMoto,
            maxLines: 3,
            decoration: new InputDecoration(
                hintText: "Noto Hidup",
                labelText: "Moto Hidup",
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
          ),
          new Padding(padding: new EdgeInsets.only(top: 20.0)),
          new RadioListTile(
            value: "laki-laki",
            title: new Text("Laki-Laki"),
            groupValue: _jk,
            onChanged: (String? value) {
              _pilihjk(value!);
            },
            activeColor: Colors.blue,
            subtitle: new Text("Pilih ini jika anda laki-laki"),
          ),
          new RadioListTile(
            value: "perempuan",
            title: new Text("Perempuan"),
            groupValue: _jk,
            onChanged: (String? value) {
              _pilihjk(value!);
            },
            activeColor: Colors.blue,
            subtitle: new Text("Pilih ini jika anda perempuan"),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new Row(
            children: <Widget>[
              new Text(
                "Agama",
                style: new TextStyle(fontSize: 18.0, color: Colors.blue),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0),
              ),
              DropdownButton(
                onChanged: (String? value) {
                  pilihAgama(value!);
                },
                value: _agama,
                items: agama.map((String value) {
                  return new DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              )
            ],
          ),
          new ElevatedButton(
            child: new Text("OK"),
            onPressed: () {
              kirimdata();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal),
              padding: MaterialStateProperty.all(EdgeInsets.all(25)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14)),
            ),
          )
        ],
      ),
    );
  }
}
