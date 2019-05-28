import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key key,
  }) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var _value = "1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
          ),
          new TitleDashboard(),
          Padding(
            padding: const EdgeInsets.all(4),
          ),
          buildCategoryDropDown(),
          Padding(
            padding: const EdgeInsets.all(3),
          ),
          buildTextNumberStyles(),
          Padding(
            padding: const EdgeInsets.all(5),
          ),
          buildRowNewItem(),
        ],
      ),
    );
  }

  Row buildRowNewItem() {
    return Row(
      children: <Widget>[
        buildExpandedNewItem(),
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        buildExpandedNewItem(),
      ],
    );
  }

  Expanded buildExpandedNewItem() {
    return Expanded(
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/item1.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    print("Click on love button");
                  },
                  padding: EdgeInsets.all(0),
                  iconSize: 30,
                  // icon: ,
                  icon: Image(
                    image: AssetImage("assets/heart-line.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                height: 20,
                child: Center(
                  child: Text(
                    "NEW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildTextNumberStyles() {
    return Text(
      '256 styles',
      style: TextStyle(
        fontSize: 12,
        color: Colors.black45,
      ),
    );
  }

  Row buildCategoryDropDown() {
    return Row(
      children: <Widget>[
        Container(
          height: 30,
          width: 110,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(155, 89, 182, 1),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Center(
            child: DropdownButton(
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
              underline: Container(),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              value: _value,
              items: [
                DropdownMenuItem(
                  value: "1",
                  child: Text(
                    "Featured",
                  ),
                ),
                DropdownMenuItem(
                  value: "2",
                  child: Text(
                    "New",
                  ),
                ),
                DropdownMenuItem(
                  value: "3",
                  child: Text(
                    "Hot",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TitleDashboard extends StatelessWidget {
  const TitleDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'WOMENS MAKE A MOVE',
      style: TextStyle(
        fontSize: 17,
      ),
    );
  }
}
