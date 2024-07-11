// lib/application/blocs/transaksi_state.dart
part of 'transaksi_tab_bloc.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object?> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiLoaded extends TransaksiState {
  final List<Transaksi> transaksis;

  const TransaksiLoaded(this.transaksis);

  @override
  List<Object?> get props => [transaksis];
}

class TransaksiCreated extends TransaksiState {
  final String message;

  const TransaksiCreated(this.message);

  @override
  List<Object?> get props => [message];
}

class TransaksiError extends TransaksiState {
  final String message;

  const TransaksiError(this.message);

  @override
  List<Object?> get props => [message];
}
