import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/dashboard.dart';
import '../screens/pages/master_data.dart';
import '../screens/pages/transaksi/setor_tabungan.dart';
import '../screens/pages/transaksi/transaksi.dart';
import '../screens/splashscreen.dart';
import '../infrastructure/repositories/transaksi_tab_repository_impl.dart';

// Definisikan setupRoutes di sini
Map<String, WidgetBuilder> setupRoutes(BuildContext context) {
  final transaksiRepository = Provider.of<TransaksiRepositoryImpl>(context);

  return {
    '/': (context) => const SplashScreen(),
    '/dashboard': (context) => Dashboard(),
    '/data_master': (context) => MasterData(),

    // transaksi
    '/transaksi': (context) => Transaksi(),
    '/setor_tabungan': (context) =>
        SetorTabungan(transaksiRepository: transaksiRepository),
  };
}
