import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../infrastructure/repositories/transaksi_tab_repository_impl.dart';
import '../../../domain/entities/transaksi_tab.dart';
import '../../../application/transaksi_tab_bloc.dart';

class SetorTabungan extends StatefulWidget {
  const SetorTabungan({Key? key, required this.transaksiRepository})
      : super(key: key);
  final TransaksiRepositoryImpl transaksiRepository;

  @override
  _SetorTabunganState createState() => _SetorTabunganState();
}

class _SetorTabunganState extends State<SetorTabungan> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _noRekeningController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  late String _kodeKantor = '';
  late int _userId = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _kodeKantor = prefs.getString('kode_kantor') ?? '';
      _userId = prefs.getInt('user_id') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF225CAB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Setor Tunai Tabungan',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w200,
            fontFamily: 'Futura',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<TransaksiBloc, TransaksiState>(
          listener: (context, state) {
            if (state is TransaksiCreated) {
              _showDialog(context, 'Success', 'Transaksi Berhasil');
            } else if (state is TransaksiError) {
              _showDialog(context, 'Error', state.message);
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextFormField(
                  controller: _noRekeningController,
                  labelText: "No Rekening",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter no rekening';
                    }
                    return null;
                  },
                  screenSize: screenSize,
                ),
                SizedBox(height: screenSize.height * 0.02),
                _buildTextFormField(
                  controller: _nominalController,
                  labelText: "Nominal",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter nominal';
                    }
                    return null;
                  },
                  screenSize: screenSize,
                ),
                SizedBox(height: screenSize.height * 0.04),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final transaksi = Transaksi(
                        noRekening: _noRekeningController.text,
                        nominal: double.parse(_nominalController.text),
                        userId: _userId,
                        kodeKantor: _kodeKantor,
                        kodeTrans: '153',
                      );
                      context
                          .read<TransaksiBloc>()
                          .add(AddTransaksi(transaksi));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff225CAB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height * 0.018,
                      horizontal: screenSize.width * 0.2,
                    ),
                  ),
                  child: Text(
                    'Proses',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.04,
                      color: Colors.white,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required FormFieldValidator<String>? validator,
    required Size screenSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(screenSize.width * 0.03),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
      ),
    );
  }

  Future<void> _showDialog(
      BuildContext context, String title, String message) async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
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
