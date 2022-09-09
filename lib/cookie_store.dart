import 'package:flutter/material.dart';

class CookieStore extends StatefulWidget {
  CookieStore({Key key}) : super(key: key);

  @override
  _CookieStoreState createState() => _CookieStoreState();
}

class _CookieStoreState extends State<CookieStore>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pickup'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            SizedBox(height: 15.0),
            Text(
              'Categories',
              style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Cookies',
                    style: TextStyle(fontSize: 21.0),
                  ),
                ),
                Tab(
                  child: Text(
                    'Cookies cake',
                    style: TextStyle(fontSize: 21.0),
                  ),
                ),
                Tab(
                  child: Text(
                    'Ice cream',
                    style: TextStyle(fontSize: 21.0),
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100.0,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: [
                  CookiePage(),
                  CookieCake(),
                  IceCream(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IceCream extends StatelessWidget {
  const IceCream({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: Center(
        child: Text('Ice Cream'),
      ),
    );
  }
}

class CookieCake extends StatelessWidget {
  const CookieCake({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: Center(
        child: Text('Cookies Cake'),
      ),
    );
  }
}

class CookiePage extends StatelessWidget {
  const CookiePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
              children: [
                _buildCard('Cookie mint', '\$3.99', 'assets/images/plat1.png',
                    false, false, context),
                _buildCard('Cookie cream', '\$4.99', 'assets/images/plat1.png',
                    true, false, context),
                _buildCard('Cookie classic', '\$10.99',
                    'assets/images/plat1.png', false, true, context),
                _buildCard('Cookie choco', '\$3.99', 'assets/images/plat1.png',
                    true, true, context),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFav, countxt) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFav
                        ? Icon(
                            Icons.favorite,
                            color: Color(0xFFEFF7532),
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0xFFEFF7532),
                          )
                  ],
                ),
              ),
              Hero(
                tag: imgPath,
                child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.contain),
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFFCC8053),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFF575E67),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Icon(
                        Icons.shopping_basket,
                        color: Color(0xFFD17E50),
                        size: 12.0,
                      ),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFD17E50),
                        ),
                      )
                    ],
                    if (added) ...[
                      Icon(
                        Icons.remove_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 12.0,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFFD17E50),
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(0xFFD17E50),
                        size: 12.0,
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
