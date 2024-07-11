# bkc_super_app

Project branchless android flutter

Installation project

1. git clone
2. flutter pub get
3. flutter run
4. enjoy to code

Struktur
lib/
├── application/
│ └── blocs/
│ └── transaksi_bloc.dart
│ └── transaksi_event.dart
│ └── transaksi_state.dart
├── domain/
│ ├── entities/
│ └── transaksi.dart
│ ├── repositories/
│ └── transaksi_repository.dart
│ └── usecases/
│ └── get_transaksis.dart
│ └── create_transaksi.dart
├── infrastructure/
│ ├── api_config.dart
│ ├── models/
│ └── transaksi_model.dart
│ ├── repositories/
│ └── transaksi_repository_impl.dart
├── Screens/
│ └── auth/
│ └── pages/
│ └── transaksi/
│ └── setor_tabungan.dart
│ └── transaksi.dart
├── dashboard.dart
├── main.dart
