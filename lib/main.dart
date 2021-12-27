import 'dart:math';
import 'dart:ui' as prefix0;

import 'package:bookinapp/SettingsWidget.dart';
import 'package:bookinapp/TabLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:simple_share/simple_share.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookingFlight',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: CardProject(),
        ));
  }
}

class CardProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Card(
//            child: InkWell(
//      splashColor: Colors.blue.withAlpha(30),
//      onTap: () {
//        print('Card tapped.');
//      },
            child: Container(
      width: 300,
      height: 600,
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 220,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.network(
                          "https://i.pinimg.com/originals/b4/70/34/b470340fc0edd6303747a79b15e1e77d.png",
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Ryjaner flight",
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealBold',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Book your flight with us !",
                                  style: TextStyle(
                                      fontFamily: 'AirbnbCerealBook',
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
          BookList(),
        ],
      ),
    )));
  }
}

class BookList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookListState();
  }
}

class BookListState extends State<BookList> {
  List _cities = ["Berlin", "Madryt", "Rzym", "Paryż", "Hamburg", "Warszawa"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _currentCitydestiny;
  String _currentCitytarget;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCitydestiny = _dropDownMenuItems[0].value;
    _currentCitytarget = _dropDownMenuItems[1].value;
    super.initState();
  }

  String flight1 = "";
  String flight2 = "";
  String date1 = "";
  String date2 = "";

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date1=  picked.toIso8601String().substring(0,10);
     //   date1 = picked as String;
      });
  }

  DateTime selectedDate1 = DateTime.now();

  Future<Null> _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
        date2=  picked.toIso8601String().substring(0,10);
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      new Container(
        color: Colors.white,
        child: new Center(
            child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new DropdownButton(
              value: _currentCitydestiny,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
            ),
            Image.network(
              "https://cdn.pixabay.com/photo/2017/02/20/00/03/icon-2081280_960_720.png",
              width: 40,
              height: 40,
            ),
            new DropdownButton(
              value: _currentCitytarget,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItemTarget,
            )
          ],
        )),
      ),
      Container(
        height: 220,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: Colors.cyan[200],
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.flight_land)),
                    Tab(icon: Icon(Icons.flight_takeoff)),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(
                              "https://static.vecteezy.com/system/resources/previews/000/634/656/non_2x/top-view-of-island-beach-in-summer-vector-illustration-flat-design-background-for-copy-space.jpg"),
                          fit: BoxFit.cover)),
//      backgroundColor: Colors.cyan[200],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: prefix0.FontStyle.normal,
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.cyan[400],
                          onPressed: () => _selectDate(context),
                          child: Text(
                            'Select date',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(
                              "https://static.vecteezy.com/system/resources/previews/000/634/656/non_2x/top-view-of-island-beach-in-summer-vector-illustration-flat-design-background-for-copy-space.jpg"),
                          fit: BoxFit.cover)),
//      backgroundColor: Colors.cyan[200],
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("${selectedDate1.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: prefix0.FontStyle.normal,
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.cyan[400],
                          onPressed: () => _selectDate1(context),
                          child: Text(
                            'Select date',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "This is flight from $flight1 to $flight2 beetwen  $date1/$date2",
          style: TextStyle(fontSize: 10.0),
        ),
      ),
      Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.cyan[800],
          onPressed: () => {_ackAlert(context,"This is flight from $flight1 to $flight2 beetwen  $date1/$date2")},
          child: Text(
            'Booking',
          ),
        ),
      ),
    ]);
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCitydestiny = selectedCity;
      flight1 = selectedCity;
    });
  }

  void changedDropDownItemTarget(String selectedCity) {
    setState(() {
      _currentCitytarget = selectedCity;
      flight2 = selectedCity;
    });
  }
}

Future<void> _ackAlert(BuildContext context,String tekst) {
  Random random = new Random();
  String Title='Lot nr FH${random.nextInt(1000)}RT${random.nextInt(20)}';
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(Title),
        content:   Text(tekst),
        actions: <Widget>[

          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              SimpleShare.share(
                title: Title,
                msg:
                tekst,
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
