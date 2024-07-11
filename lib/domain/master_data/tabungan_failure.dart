import 'package:flutter/material.dart';

abstract class TabunganFailure {
  factory TabunganFailure.noData() = NoDataFailure;
  factory TabunganFailure.serverError() = ServerErrorFailure;

  void handle(BuildContext context);
}

class NoDataFailure implements TabunganFailure {
  @override
  void handle(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tidak Ada Data'),
        content: const Text('Tidak ditemukan data. Silakan coba lagi nanti.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class ServerErrorFailure implements TabunganFailure {
  @override
  void handle(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kesalahan Server'),
        content:
            const Text('Terjadi kesalahan server. Silakan coba lagi nanti.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
