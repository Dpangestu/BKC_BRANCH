import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../infrastructure/repositories/transaksi_tab_repository_impl.dart';
import 'package:http/http.dart' as http;

List<SingleChildWidget> setupProviders(BuildContext context) {
  return [
    Provider<TransaksiRepositoryImpl>(
      create: (_) => TransaksiRepositoryImpl(client: http.Client()),
    ),
    // Tambahkan provider lainnya di sini
  ];
}
