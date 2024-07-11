import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFF225CAB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Transaksi',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w200,
            fontFamily: 'Futura',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 21),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _menu(context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _menu(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => DataMaster()),
            // );
            Navigator.of(context).pushNamed('/setor_tabungan');
          },
          child: Column(
            children: [
              _menuItem(
                icon: 'assets/svg/safe_box.svg',
              ),
              const SizedBox(height: 8),
              const Text(
                'Tabungan',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Futura',
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/data_kredit');
          },
          child: Column(
            children: [
              _menuItem(
                icon: 'assets/svg/credit_card.svg',
              ),
              const SizedBox(height: 8),
              const Text(
                'Kredit',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Futura',
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _menuItem({required String icon}) {
  return Container(
    width: 65,
    height: 65,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 237, 244, 246),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Center(
      child: SvgPicture.asset(
        icon,
        width: 50,
        height: 50,
      ),
    ),
  );
}
