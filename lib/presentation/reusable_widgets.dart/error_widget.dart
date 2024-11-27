import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorTextWidget extends StatelessWidget {
  final String? message;
  const ErrorTextWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message ?? AppLocalizations.of(context)!.something_went_wrong),
    );
  }

}