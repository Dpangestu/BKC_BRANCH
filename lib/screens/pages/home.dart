import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../pages/partial/app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        title: const Greetings(),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            final isPortrait = height > width;
            return Column(
              children: [
                _card(width, height),
                const SizedBox(height: 21),
                _search(),
                const SizedBox(height: 21),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _menu(context, width),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _menu(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: width > 600 ? 6 : 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/data_master');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/data_master.svg',
                  width: width,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Data Master',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Futura',
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/laporan');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/laporan.svg',
                  width: width,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Laporan',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Futura',
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/transaksi');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/transaksi.svg',
                  width: width,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Transaksi',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Futura',
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/payment_point');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/payment_point.svg',
                  width: width,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Payment Point',
                  style: TextStyle(
                    fontSize: 10,
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

  Widget _menuItem({required String icon, required double width}) {
    return Container(
      width: width * 0.15,
      height: width * 0.15,
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
          width: width * 0.12,
          height: width * 0.12,
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
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
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _card(double width, double height) {
    return AspectRatio(
      aspectRatio: 313 / 116,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: height * 0.2,
        decoration: BoxDecoration(
          color: const Color(0xff225CAB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                'assets/svg/batik_pattren.svg',
                width: width * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/logo_putih.png',
                          width: width * 0.25),
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  const Text(
                    'Saldo KAS Hari ini',
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
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
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
