// lib/application/blocs/transaksi_event.dart

part of 'transaksi_tab_bloc.dart';

abstract class TransaksiEvent extends Equatable {
  const TransaksiEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransaksis extends TransaksiEvent {}

class AddTransaksi extends TransaksiEvent {
  final Transaksi transaksi;

  const AddTransaksi(this.transaksi);

  @override
  List<Object?> get props => [transaksi];
}
