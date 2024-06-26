import 'package:flutter/material.dart';
import 'package:bkc_super_app/screens/pages/data_master/data_master.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Home'),
  //     ),
  //     body: Center(
  //       child: Text(
  //         'Home Page',
  //         style: TextStyle(fontSize: 40),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      // appBar: AppBar(
      //   title: Greetings(),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Greetings(),
            const SizedBox(height: 16),
            _card(),
            const SizedBox(height: 21),
            _search(),
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
              Navigator.of(context).pushNamed('/data_master');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/data_master.svg',
                ),
                const SizedBox(height: 8),
                Text(
                  'Data Master',
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
              Navigator.of(context).pushNamed('/laporan');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/laporan.svg',
                ),
                const SizedBox(height: 8),
                Text(
                  'Laporan',
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
              Navigator.of(context).pushNamed('/transaksi');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/transaksi.svg',
                ),
                const SizedBox(height: 8),
                Text(
                  'Transaksi',
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
              Navigator.of(context).pushNamed('/payment_point');
            },
            child: Column(
              children: [
                _menuItem(
                  icon: 'assets/svg/payment_point.svg',
                ),
                const SizedBox(height: 8),
                Text(
                  'Payment Point',
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
        color: const Color(0xffE6F4F8),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 5),
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
              offset: Offset(0, 4),
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

  Widget _card() {
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
              child: SvgPicture.asset(
                'assets/svg/batik_pattren.svg',
                width: 180,
                fit: BoxFit.cover,
              ),
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
                  const Text(
                    'Saldo KAS Hari ini',
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
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
