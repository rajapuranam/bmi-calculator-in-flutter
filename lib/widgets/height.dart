import 'dart:math' as math;

import 'package:BMI_Calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeightBackground extends StatelessWidget {
  final Widget child;

  HeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(child: child),
        Positioned(
          bottom: 3,
          child: Container(
            child: Icon(
              FontAwesomeIcons.angleUp,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
        ),
        Divider(color: Color.fromRGBO(196, 197, 203, 1.0))
      ],
    );
  }
}

class HeightSlider extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final double width;
  final int value;
  final ValueChanged<int> onChanged;
  final ScrollController scrollController;

  HeightSlider(
      {Key key,
      this.minValue,
      this.maxValue,
      this.width,
      this.value,
      this.onChanged})
      : scrollController = ScrollController(
            initialScrollOffset: (value - minValue) * width / 3),
        super(key: key);

  double get itemExtent => width / 5;

  @override
  Widget build(BuildContext context) {
    int itemCount = (maxValue - minValue) + 3;

    return NotificationListener(
      onNotification: _onNotification,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final int itemValue = _indexToValue(index);
          bool isExtra = index == 0 || index == itemCount - 1;

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _animateTo(itemValue, durationMillis: 50),
            child: isExtra
                ? Container()
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    // fit: BoxFit.none,
                    child: Text(
                      itemValue.toString(),
                      style:
                          itemValue == value ? kValuesStyle : kFadeValuesStyle,
                    ),
                  ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemExtent: itemExtent,
        itemCount: itemCount,
        physics: BouncingScrollPhysics(),
        controller: scrollController,
      ),
    );
  }

  int _indexToValue(int index) => minValue + (index - 1);

  int _offsetToMiddleIndex(double offset) => (offset + width / 2) ~/ itemExtent;

  int _offsetToMiddleValue(double offset) {
    int indexOfMiddleElement = _offsetToMiddleIndex(offset);
    int middleValue = _indexToValue(indexOfMiddleElement);
    middleValue = math.max(minValue, math.min(maxValue, middleValue));
    return middleValue;
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      int middleValue = _offsetToMiddleValue(notification.metrics.pixels);

      if (_userStoppedScrolling(notification)) {
        _animateTo(middleValue);
      }

      if (middleValue != value) {
        onChanged(middleValue);
      }
    }

    return true;
  }

  bool _userStoppedScrolling(Notification notification) {
    return notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        scrollController.position.activity is! HoldScrollActivity;
  }

  // TextStyle _getDefaultStyle() {
  //   return kFadeValuesStyle;
  // }

  // TextStyle _getHighlightTextStyle() {
  //   return kValuesStyle;
  // }

  // TextStyle _getTextStyle(int itemValue) {
  //   // return itemValue == value ? _getHighlightTextStyle() : _getDefaultStyle();
  //   return itemValue == value ? kValuesStyle : kFadeValuesStyle;
  // }

  _animateTo(int valueToSelect, {int durationMillis = 200}) {
    double targetExtent = (valueToSelect - minValue) * itemExtent;
    scrollController.animateTo(targetExtent,
        duration: Duration(milliseconds: durationMillis),
        curve: Curves.decelerate);
  }
}
