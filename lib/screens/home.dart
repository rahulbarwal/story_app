import 'package:flutter/material.dart';
import 'package:story_app/models/dummy_data.dart';
import 'package:story_app/widgets/card_scroller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = allStories.length - 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  _buildBody() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        _buildMockAppBar(),
        _buildAppTitle("Trending"),
        SizedBox(
          height: 8.0,
        ),
        _buildAppSubTitle("Animated", 25),
        _buildStoriesStack(),
        _buildAppTitle("Favorite"),
        _buildAppSubTitle("Latest", 9),
        SizedBox(height: 30.0),
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      allStories[0].imageUrl,
                      width: 296.0,
                      height: 222.0,
                      fit: BoxFit.cover,
                    ))),
          ],
        ),
        SizedBox(height: 30.0),
      ],
    ));
  }

  _buildMockAppBar() {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, top: 30.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              iconSize: 30,
              color: Colors.white70,
              icon: Icon(Icons.menu),
              onPressed: () {}),
          IconButton(
              iconSize: 30,
              color: Colors.white70,
              icon: Icon(Icons.search),
              onPressed: () {})
        ],
      ),
    );
  }

  _buildAppTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 46,
                fontFamily: "Calibre-Semibold",
                letterSpacing: 1.0,
                color: Colors.white),
          ),
          IconButton(
              iconSize: 45.0,
              color: Colors.white70,
              icon: Icon(Icons.more_horiz),
              onPressed: () {})
        ],
      ),
    );
  }

  _buildAppSubTitle(String btnText, int numStories) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Theme.of(context).accentColor),
            child: Text(
              btnText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontFamily: "Calibre-Semibold",
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "$numStories+ Stories",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15.0,
                fontFamily: "Calibre-Semibold",
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _buildStoriesStack() {
    PageController controller =
        PageController(initialPage: allStories.length - 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Stack(
      children: <Widget>[
        CardScroller(
          currentPage: currentPage,
        ),
        Positioned.fill(
            child: PageView.builder(
          itemCount: allStories.length,
          controller: controller,
          reverse: true,
          itemBuilder: (context, index) {
            return Container();
          },
        ))
      ],
    );
  }
}
