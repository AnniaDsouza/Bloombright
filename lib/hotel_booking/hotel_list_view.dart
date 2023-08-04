import 'package:best_flutter_ui_templates/hotel_booking/calendar_popup_view.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/hotel_list_data.dart';

class HotelListView extends StatefulWidget {
  final VoidCallback? callback;
  final HotelListData? hotelData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  HotelListView({
    Key? key,
    this.hotelData,
    this.animationController,
    this.animation,
    this.callback,
  }) : super(key: key);

  @override
  _HotelListViewState createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  void showDemoDialog(BuildContext context) { // Pass the context as a parameter
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: (){showDemoDialog(context);},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              child: Image.asset(
                                widget.hotelData!.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: HotelAppTheme.buildLightTheme().backgroundColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              widget.hotelData!.titleTxt,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                              ),
                                            ),
<<<<<<< HEAD


=======
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  widget.hotelData!.subTxt,
                                                  style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  FontAwesomeIcons.locationDot,
                                                  size: 12,
                                                  color: HotelAppTheme.buildLightTheme().primaryColor,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${widget.hotelData!.dist.toStringAsFixed(1)} km to city',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 4),
                                              child: Row(
                                                children: <Widget>[
                                                  RatingBar(
                                                    initialRating: widget.hotelData!.rating,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 24,
                                                    ratingWidget: RatingWidget(
                                                      full: Icon(
                                                        Icons.star_rate_rounded,
                                                        color: HotelAppTheme.buildLightTheme().primaryColor,
                                                      ),
                                                      half: Icon(
                                                        Icons.star_half_rounded,
                                                        color: HotelAppTheme.buildLightTheme().primaryColor,
                                                      ),
                                                      empty: Icon(
                                                        Icons.star_border_rounded,
                                                        color: HotelAppTheme.buildLightTheme().primaryColor,
                                                      ),
                                                    ),
                                                    itemPadding: EdgeInsets.zero,
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                  Text(
                                                    ' ${widget.hotelData!.reviews} Reviews',
                                                    style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                                  ),
                                                ],
                                              ),
                                            ),
>>>>>>> 4734d7bda1f0abc089444e8e7186969959895629
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16, top: 8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
<<<<<<< HEAD

=======
                                        Text(
                                          '\$${widget.hotelData!.perNight}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text(
                                          '/per night',
                                          style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                        ),
>>>>>>> 4734d7bda1f0abc089444e8e7186969959895629
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: HotelAppTheme.buildLightTheme().primaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
