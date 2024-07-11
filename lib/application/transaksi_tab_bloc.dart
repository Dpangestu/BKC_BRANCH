import 'package:bkc_super_app/domain/repositories/transaksi_tab_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/transaksi_tab.dart';

part 'transaksi_tab_event.dart';
part 'transaksi_tab_state.dart';

typedef GetTransaksis = Future<Either<String, List<Transaksi>>> Function();
typedef CreateTransaksi = Future<Either<String, String>> Function(
    Transaksi transaksi);

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  final GetTransaksis getTransaksis;
  final CreateTransaksi createTransaksi;

  TransaksiBloc(
    TransaksiRepository read, {
    required this.getTransaksis,
    required this.createTransaksi,
  }) : super(TransaksiInitial()) {
    on<LoadTransaksis>(_onLoadTransaksis);
    on<AddTransaksi>(_onAddTransaksi);
  }

  void _onLoadTransaksis(
      LoadTransaksis event, Emitter<TransaksiState> emit) async {
    emit(TransaksiLoading());
    final result = await getTransaksis();
    result.fold(
      (failure) => emit(TransaksiError(failure)),
      (transaksis) => emit(TransaksiLoaded(transaksis)),
    );
  }

  void _onAddTransaksi(AddTransaksi event, Emitter<TransaksiState> emit) async {
    emit(TransaksiLoading());
    final result = await createTransaksi(event.transaksi);
    result.fold(
      (failure) => emit(TransaksiError(failure)),
      (success) => emit(TransaksiCreated(success)),
    );
  }
}
