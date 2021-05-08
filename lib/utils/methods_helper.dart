import 'package:flutter/material.dart';

Size getSize(context) {
  return MediaQuery.of(context).size;
}

double setHeight(BuildContext context, double heightPercentage) {
  return getSize(context).height * heightPercentage;
}

double setWidth(BuildContext context, double widthPercentage) {
  return getSize(context).width * widthPercentage;
}

navigateTo(BuildContext context, createPage) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return createPage;
  }));
}

navigateToWithReplacement(BuildContext context, createPage) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
    return createPage;
  }));
}
