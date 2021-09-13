import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.sp,
);

final kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 55.sp,
);

final kButtonTextStyle = TextStyle(
  fontSize: 30.sp,
  fontFamily: 'Spartan MB',
);

final kConditionTextStyle = TextStyle(
  fontSize: 90.sp,
);

final kTextFieldInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 20,
  ),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  icon: const Icon(
    Icons.location_city_rounded,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
  hintText: 'Enter City Name',
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
);
