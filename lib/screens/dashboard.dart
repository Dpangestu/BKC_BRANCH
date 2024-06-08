import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _greetings(),
            const SizedBox(height: 16),
            _card(),
            const SizedBox(height: 21),
            _search(),
            const SizedBox(height: 21),
            _menu(),
          ],
        ),
      ),
    );
  }

  Padding _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              // Handle tap on Data Master menu item
              print('Data Master tapped');
            },
            child: _menuItem(
              icon: 'assets/svg/data_master.svg',
              title: 'Data Master',
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap on Laporan menu item
              print('Laporan tapped');
            },
            child: _menuItem(
              icon: 'assets/svg/laporan.svg',
              title: 'Laporan',
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap on Transaksi menu item
              print('Transaksi tapped');
            },
            child: _menuItem(
              icon: 'assets/svg/transaksi.svg',
              title: 'Transaksi',
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap on Payment Point menu item
              print('Payment Point tapped');
            },
            child: _menuItem(
              icon: 'assets/svg/payment_point.svg',
              title: 'Payment Point',
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap on Layanan Cardless menu item
              print('Layanan Cardless tapped');
            },
            child: _menuItem(
              icon: 'assets/svg/cardless.svg',
              title: 'Layanan Cardless',
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({required String icon, required String title}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Futura',
            ),
          ),
        ],
      ),
    );
  }

  Padding _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            // fillColor: Color(0xffEDEDED),
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: const Icon(FeatherIcons.search),
            hintText: "Cari Menu",
            hintStyle: const TextStyle(
                fontSize: 17,
                fontFamily: 'Futura',
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(255, 220, 220, 220),
                height: 1.2),
          ),
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 313 / 116,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xff225CAB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset('assets/svg/batik_pattren.svg',
                  width: 180, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/logo_putih.png', width: 95),
                    ],
                  ),
                  const SizedBox(height: 50),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Rp. 500.000.000',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.2),
                        ),
                      ],
                    ),
                  ),
                  const Text('Saldo KAS Hari ini',
                      style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/svg/icon.svg', width: 17.42),
              const SizedBox(width: 8),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'BKC ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Color(0xFF171047),
                      ),
                    ),
                    TextSpan(
                      text: 'SUPER BRANCH',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        color: Color(0xFF225CAB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FeatherIcons.mail),
            color: const Color(0xFF225CAB),
          ),
        ],
      ),
    );
  }
}
