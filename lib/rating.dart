import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rating_dialog/rating_dialog.dart';

void main() {
  runApp(MaterialApp(home: Rating()));
}

class Rating extends StatefulWidget {
  Rating({Key key}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2500));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.teal[50],
        appBar: AppBar(
            backgroundColor: Colors.red[400], title: Text('Rating Dialog')),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Container(
            child: Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.red[400],
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Rating Dialog',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                onPressed: _showRatingAppDialog,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      initialRating: 3,
      ratingColor: Colors.amber,
      title: 'Rating Dialog In Flutter',
      message: 'Rating this app and tell others what you think.'
          ' Add more description here if you want.',
      image: Image.asset(
        "assets/images/Icon-192.png",
        height: 60,
      ),
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
