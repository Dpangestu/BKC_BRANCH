import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/master_data/tabungan_failure.dart';
import '../../domain/master_data/tabungan_repository_interface.dart';
import '../../domain/master_data/tabungan_model.dart';

// Events
abstract class TabunganEvent extends Equatable {
  const TabunganEvent();

  @override
  List<Object> get props => [];
}

class GetAllTabungan extends TabunganEvent {}

// States
class TabunganState extends Equatable {
  final bool isLoading;
  final Option<Either<TabunganFailure, List<TabunganModel>>>
      tabunganFailureOrSuccessOption;

  const TabunganState({
    required this.isLoading,
    required this.tabunganFailureOrSuccessOption,
  });

  factory TabunganState.initial() {
    return TabunganState(
      isLoading: false,
      tabunganFailureOrSuccessOption: none(),
    );
  }

  TabunganState copyWith({
    bool? isLoading,
    Option<Either<TabunganFailure, List<TabunganModel>>>?
        tabunganFailureOrSuccessOption,
  }) {
    return TabunganState(
      isLoading: isLoading ?? this.isLoading,
      tabunganFailureOrSuccessOption:
          tabunganFailureOrSuccessOption ?? this.tabunganFailureOrSuccessOption,
    );
  }

  @override
  List<Object> get props => [isLoading, tabunganFailureOrSuccessOption];
}

// BLoC
class TabunganBloc extends Bloc<TabunganEvent, TabunganState> {
  final TabunganRepositoryInterface tabunganRepository;

  TabunganBloc(this.tabunganRepository) : super(TabunganState.initial());

  @override
  Stream<TabunganState> mapEventToState(TabunganEvent event) async* {
    if (event is GetAllTabungan) {
      yield state.copyWith(
          isLoading: true, tabunganFailureOrSuccessOption: none());

      final failureOrTabungan = await tabunganRepository.getAllTabungan();

      yield state.copyWith(
        isLoading: false,
        tabunganFailureOrSuccessOption: some(
            failureOrTabungan as Either<TabunganFailure, List<TabunganModel>>),
      );
    }
  }
}
