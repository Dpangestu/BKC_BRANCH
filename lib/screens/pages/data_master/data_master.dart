import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../data_master/partial/app_bar.dart';

class DataMaster extends StatelessWidget {
  const DataMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Greetings(),
          ],
        ),
      ),
    );
  }
}
