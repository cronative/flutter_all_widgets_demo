import 'package:flutter/material.dart';

class UiChallenge1 extends StatefulWidget {
  UiChallenge1({Key key}) : super(key: key);

  @override
  _UiChallenge1State createState() => _UiChallenge1State();
}

class _UiChallenge1State extends State<UiChallenge1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF8830FE),
      ),
      body: Column(children: [
        topWidget(),
        SizedBox(
          height: 25,
        ),
        bottomWidget()
      ]),
    );
  }

  Widget topWidget() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),

        ///profile image
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/moon.jpeg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFB178FF),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy, Gylfi!",
                  style: TextStyle(color: Color(0xFFB178FF), fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Let's plan your bright future",
                  style: TextStyle(color: Color(0xFFB178FF), fontSize: 11),
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.notifications,
              size: 35,
              color: Color(0xFFB178FF),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),

        ///police number part
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "042345-900",
                  style: TextStyle(
                      color: Color(0xFFB178FF),
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Police Number",
                      style: TextStyle(
                          color: Color(0xFFDEC7FF),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF7B17FF)),
                )
              ],
            ),
            Spacer(),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Color(0xFF6800FE),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFE9DBFF)),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),

        ///horizontal text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "--------------------------------------------",
            style: TextStyle(
                color: Color(0xFF8931FF),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
        ),
        SizedBox(
          height: 10,
        ),

        ///values and date
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ 1,040",
                    style: TextStyle(color: Color(0xFFB178FF), fontSize: 23),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Premium Amount",
                    style: TextStyle(color: Color(0xFFB178FF), fontSize: 11),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ 2,689",
                    style: TextStyle(color: Color(0xFFB178FF), fontSize: 23),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Surendder Value",
                    style: TextStyle(color: Color(0xFFB178FF), fontSize: 11),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "13/08/2018",
                    style: TextStyle(color: Color(0xFFB178FF), fontSize: 23),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Amount Date",
                    style: TextStyle(color: Color(0xFFB178FF), fontSize: 11),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),

        ///my policy and payment buttons
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 13,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "View My Policy",
                  style: TextStyle(color: Color(0xFFE7D5FF), fontSize: 13),
                ),
              ),
              Spacer(),
              Container(
                  height: 60,
                  width: 5,
                  child: VerticalDivider(
                    color: Color(0xFF6B00FF),
                  )),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Make a Payment",
                  style: TextStyle(color: Color(0xFFE7D5FF), fontSize: 13),
                ),
              ),
              Icon(
                Icons.arrow_upward,
                color: Colors.white,
                size: 13,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xFF964AFF)),
        ),
      ],
    );
  }

  Widget bottomWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .85,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),

              /// Icon List
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconWidget(
                    iconName: "assets/images/sport-car.png",
                    title: "Sport Car",
                  ),
                  IconWidget(
                    iconName: "assets/images/hotel.png",
                    title: "Hospital",
                  ),
                  IconWidget(
                    iconName: "assets/images/gym.png",
                    title: "Gym & Sport",
                  ),
                  IconWidget(
                    iconName: "assets/images/hotel.png",
                    title: "Hotel",
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),

                      /// Boat Alert
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            "Bot Alert",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF323333)),
                          ),
                          Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 13, color: Color(0xFF8830FE)),
                          ),
                          SizedBox(
                            width: 35,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            width: 50,
                            height: 50,
                            child: Text(
                              "@",
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xFF1BCBFF)),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF6900FF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 1,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email Verification",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF565B5A)),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  "Open your mail and check on inbox. wejust sent\nthe link for confirmation step on there",
                                  style: TextStyle(
                                      fontSize: 10, color: Color(0xFFCBCDDA)),
                                  maxLines: 3,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 45,
                      ),

                      /// News Update
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Text(
                                    "News and Updates",
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFF323333)),
                                  ),
                                  Spacer(),
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xFF8830FE)),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    width: 80,
                                    height: 100,
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      "assets/images/image1.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Emergency medical coverage",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF565B5A)),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Text(
                                          "When you are travelling with a health condition\nthe last thing you want to worry abount is\n" +
                                              "whether or not you'll be covered if you need",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xFFCBCDDA)),
                                          maxLines: 3,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          decoration: CustomDecoration.decorationForNews,
                        ),
                      )
                    ],
                  ),
                  decoration: CustomDecoration.decorationForBotAlert,
                ),
              )
            ],
          ),
          decoration: CustomDecoration.decorationForIconList,
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final String iconName;
  final String title;

  const IconWidget({Key key, this.iconName, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 50,
          height: 50,
          child: Image.asset(
            iconName,
            color: Color(0xFF903DFF),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF5EEFF),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13, color: Color(0xFFF5EEFF)),
        )
      ],
    );
  }
}

class CustomDecoration {
  static const decorationForNews = BoxDecoration(
      color: Color(0xFFFFFFFF),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)));

  static const decorationForBotAlert = BoxDecoration(
      color: Color(0xFFF7F5FA),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)));

  static const decorationForIconList = BoxDecoration(
      color: Color(0xFF6900FF),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)));

  static BoxDecoration decorationForEmailVerfication = BoxDecoration(
    color: Color(0xFF6900FF),
    borderRadius: BorderRadius.all(Radius.circular(15)),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Color(0xFF000000).withOpacity(0.1),
        blurRadius: 1,
        offset: Offset(0, 3),
      ),
    ],
  );
}
