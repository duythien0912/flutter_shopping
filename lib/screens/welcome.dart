import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> images = [
  "assets/intro2.png",
  "assets/intro1.png",
  "assets/intro3.png",
];

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Text(
              "Buy your favourites",
              style: TextStyle(fontSize: 17),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
              width: 200,
              child: Text(
                "Personalization of your shopping brands",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ),
            Expanded(
              child: Container(
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.asset(
                      images[index],
                      fit: BoxFit.scaleDown,
                    );
                  },
                  scale: 0.6,
                  viewportFraction: 0.9,
                  index: 1,
                  autoplay: true,
                  itemCount: images.length,
                  pagination: new SwiperPagination(
                    margin: new EdgeInsets.only(top: 50.0),
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.black38,
                      activeColor: Colors.black54,
                      size: 4.0,
                      activeSize: 6.0,
                      space: 5.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            FlatButton(
              color: Color.fromARGB(255, 155, 89, 182),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Buy your favourites",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: () {},
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have account?",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
            ),
          ],
        ),
      ),
    ));
  }
}
