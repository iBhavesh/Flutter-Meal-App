import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final Size appBarSize;
  final Widget child;
  final double imageHeight;
  SectionContainer(
      {this.mediaQuery, this.appBarSize, this.child, this.imageHeight,});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: (mediaQuery.size.height -
              imageHeight -
              ((25 + 40) * 2) -
              mediaQuery.padding.top -
              kToolbarHeight) *
          0.5,
      width: mediaQuery.size.width * 0.8,
      child: child,
    );
  }
}
