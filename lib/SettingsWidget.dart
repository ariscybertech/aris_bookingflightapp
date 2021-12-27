import 'package:flutter/material.dart';


class SettingsWidget extends StatefulWidget {
  String flight1;
  String flight2;

  SettingsWidget(String flight1,String flight2,{Key key}) : super(key: key, ){
    this.flight1=flight1;
    this.flight2=flight2;
  }

  @override
  _SettingsWidgetState createState() => new _SettingsWidgetState(flight1,flight2);
}

class _SettingsWidgetState extends State<SettingsWidget> {

  String flight1;
  String flight2;

  List _cities =  ["Berlin", "Madryt", "Rzym", "Paryż", "Hamburg","Warszawa"];
  _SettingsWidgetState(String flight1,String flight2){

    this.flight1=flight1;
    this.flight2=flight2;

  }

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

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center  ,
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: <Widget>[

              new DropdownButton(
                value: _currentCitydestiny,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),
              Image.network("https://cdn.pixabay.com/photo/2017/02/20/00/03/icon-2081280_960_720.png",width: 40,height: 40,),
              new DropdownButton(
                value: _currentCitytarget,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItemTarget,
              )
            ],
          )
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCitydestiny = selectedCity;
      flight1=selectedCity;
    });
  }
  void changedDropDownItemTarget(String selectedCity) {
    setState(() {
      _currentCitytarget = selectedCity;
      flight2=selectedCity;
    });
  }
}