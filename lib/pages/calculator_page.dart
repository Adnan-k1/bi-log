import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blog/calculator_bloc.dart';
import '../event/calculator_event.dart';
import '../state/calculator_state.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _angka1Controller = TextEditingController();
  final _angka2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator BLoC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _angka1Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Angka 1',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _angka2Controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Angka 2',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  tombol('+', () {
                    context.read<CalculatorBloc>().add(
                          TambahEvent(
                            _angka1Controller.text,
                            _angka2Controller.text,
                          ),
                        );
                  }),
                  tombol('-', () {
                    context.read<CalculatorBloc>().add(
                          KurangEvent(
                            _angka1Controller.text,
                            _angka2Controller.text,
                          ),
                        );
                  }),
                  tombol('×', () {
                    context.read<CalculatorBloc>().add(
                          KaliEvent(
                            _angka1Controller.text,
                            _angka2Controller.text,
                          ),
                        );
                  }),
                  tombol('÷', () {
                    context.read<CalculatorBloc>().add(
                          BagiEvent(
                            _angka1Controller.text,
                            _angka2Controller.text,
                          ),
                        );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 12),

            
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  builder: (context, state) {
                    return Text(
                      'HASIL\n${state.value}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 12),

            
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _angka1Controller.clear();
                    _angka2Controller.clear();
                    context.read<CalculatorBloc>().add(ResetEvent());
                  },
                  child: const Text(
                    'RESET',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget tombol(String text, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
