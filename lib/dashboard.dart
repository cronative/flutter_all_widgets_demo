import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Dashboard"),
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Menu(title: "Home", icon: Icons.home, warna: Colors.redAccent),
              Menu(
                  title: "Akademik",
                  icon: Icons.account_balance,
                  warna: Colors.brown),
              Menu(
                  title: "Information",
                  icon: Icons.info_outline,
                  warna: Colors.blue),
              Menu(
                  title: "Perkuliahan",
                  icon: Icons.school,
                  warna: Colors.orange),
              Menu(
                  title: "Dosen",
                  icon: Icons.person_pin,
                  warna: Colors.blueGrey),
              Menu(
                  title: "E-Learning",
                  icon: Icons.local_library,
                  warna: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({this.title, this.icon, this.warna});

  final title;
  final icon;
  final warna;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print(title);
        },
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}
