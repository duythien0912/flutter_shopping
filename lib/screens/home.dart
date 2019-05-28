import 'package:flutter/material.dart';

import 'dashBoard.dart';
import 'preferences.dart';
import 'user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  TabController _tabController;

  static const List<Widget> _widgetBodyHome = <Widget>[
    DashBoard(),
    Notification(),
    User(),
    Preferences(),
  ];

  static const List<Widget> _widgetBodyDrawer = <Widget>[
    Text(
      'Index 1: ',
    ),
    Text(
      'Index 2: ',
    ),
    Text(
      'Index 3: ',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _widgetBodyHome.elementAt(_selectedIndex),
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: TabBar(
                indicatorColor: Color.fromRGBO(155, 89, 182, 1),
                labelColor: Color.fromRGBO(155, 89, 182, 1),
                controller: _tabController,
                tabs: _buildTabs(),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _widgetBodyDrawer,
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabs() {
    return <Widget>[
      Tab(text: "Women"),
      Tab(text: "Kids"),
      Tab(text: "Men"),
    ];
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Color.fromRGBO(155, 89, 182, 1),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Color.fromRGBO(155, 89, 182, 1),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Color.fromRGBO(155, 89, 182, 1),
          onPressed: () {},
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.view_list,
            color: _selectedIndex == 0
                ? Color.fromRGBO(155, 89, 182, 1)
                : Color.fromRGBO(127, 127, 127, 1),
          ),
          title: Container(height: 0.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: _selectedIndex == 1
                ? Color.fromRGBO(155, 89, 182, 1)
                : Color.fromRGBO(127, 127, 127, 1),
          ),
          title: Container(height: 0.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.sentiment_satisfied,
            color: _selectedIndex == 2
                ? Color.fromRGBO(155, 89, 182, 1)
                : Color.fromRGBO(127, 127, 127, 1),
          ),
          title: Container(height: 0.0),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: _selectedIndex == 3
                ? Color.fromRGBO(155, 89, 182, 1)
                : Color.fromRGBO(127, 127, 127, 1),
          ),
          title: Container(height: 0.0),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}

class Notification extends StatelessWidget {
  const Notification({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Index 2: Business',
    );
  }
}
