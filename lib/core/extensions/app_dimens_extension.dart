
import 'package:flutter/material.dart';

extension AppDimensExtension on double {
  SizedBox get verticalSizedBox => SizedBox(height: this);
  SizedBox get horizontalSizedBox => SizedBox(width: this);
  EdgeInsets get paddingAll => EdgeInsets.all(this);
  EdgeInsets get symmetryVertical => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get symmetryHorizontal => EdgeInsets.symmetric(horizontal: this);


}