import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRadio extends StatefulWidget {

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {

  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(true, 'رعاية'));
    sampleData.add(new RadioModel(false, 'بستان'));
    sampleData.add(new RadioModel(false, 'تمهيدي'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: ListView.builder(
            itemCount: sampleData.length,
            shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return new InkWell(
                splashColor: Theme.of(context).accentColor,
                onTap: () {
                  setState(() {
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[index].isSelected = true;
                  });
                },
                child: new RadioItem(sampleData[index]),
             );
            },
          ),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width*0.25,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: new Center(
        child: new Text(_item.buttonText,
            style: new TextStyle(
                color:
                _item.isSelected ? Colors.white : Theme.of(context).accentColor,
                //fontWeight: FontWeight.bold,
                fontSize: 18.0)),
      ),
      decoration: new BoxDecoration(
        color: _item.isSelected
            ? Theme.of(context).accentColor
            : Colors.transparent,
        border: new Border.all(
            width: 1.0,
            color: Theme.of(context).accentColor),
        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}