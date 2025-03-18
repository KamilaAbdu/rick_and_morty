import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';


extension ContextExtension on BuildContext{
  L10ns get lang => L10ns.of(this);
}