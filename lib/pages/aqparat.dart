import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Aqparat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            toolbarHeight: 150, // increase the height of AppBar
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // align text to the left
              children: [
                Text(
                  'Qürbym,',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoldPlay",
                  ),
                ),
                Text(
                  'Būl jerde sen gyzygty magalalardy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoldPlay",
                  ),
                ),
                Text(
                  'taba alasyn!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GoldPlay",
                  ),
                ),
              ],
            ),
            expandedHeight: 200, // set the expanded height of the app bar
            floating: false, // set to true if you want a floating app bar
            pinned: true, // set to true if you want a pinned app bar
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60), // set the height of the navigation bar
              child: Container(
                height: 60, // set the height of the navigation bar
                color: Colors.white, // set the background color of the navigation bar
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          // handle second button tap
                        },
                        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.0), // Set the desired padding
            backgroundColor: Color(0xFFC575C7), // Set the desired background color
          ),
                        child: Text(
                          'Maqala',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // added fontWeight
                            fontFamily: "GoldPlay",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          // handle second button tap
                        },
                        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.0), // Set the desired padding
            backgroundColor: Color(0xFFC575C7), // Set the desired background color
          ),
                        child: Text(
                          'Podkast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // added fontWeight
                            fontFamily: "GoldPlay",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          // handle second button tap
                        },
                        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.0), // Set the desired padding
            backgroundColor: Color(0xFFC575C7), // Set the desired background color
          ),
                        child: Text(
                          'Ūnağan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // added fontWeight
                            fontFamily: "GoldPlay",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      // Build your list items here
      return Container(
  height: 420,
  decoration: BoxDecoration(
    color: Color(0xFFF6F6F6),
    borderRadius: BorderRadius.circular(20),
  ),
  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Äbüzerdı ajyratu täsılderı',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: "GoldPlay",
        ),
        textAlign: TextAlign.left,
      ),
      SizedBox(height: 30),
      Text(
        'Düniejüzılık densaulyq saqtau ūiymynyñ deregınşe, äielderdıñ üşten bırı jūbynan fizikalyq nemese jynystyq zorlyq körgen. Osyndai sūmdyq statistikadan keiın «Köñılımız jarasqan adammen qarym-qatynasta jeke bas qauıpsızdıgımızdı qalai qorğaimyz?» degen sūraq tuady.',
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
          fontFamily: "GoldPlay",
        ),
        textAlign: TextAlign.justify,
      ),
      SizedBox(height: 20), // add spacing between text and image
      Image.asset(
        'assets/article.png', // replace with your image path
        height: 130, // specify height of the image
        width: 500, // specify width of the image
        fit: BoxFit.cover, // specify how the image should be fitted within the container
      ),
    ],
  ),
);

    },
    childCount: 3, // specify the number of list items
  ),
),

        ],  
      ),
    );
  }
}  