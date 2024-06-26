import 'package:flutter/material.dart';

class MasterData extends StatefulWidget {
  const MasterData({super.key});

  @override
  State<MasterData> createState() => _MasterDataState();
}

class _MasterDataState extends State<MasterData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MasterData'),
      ),
      body: Center(
        child: Text(
          'Master Data Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
