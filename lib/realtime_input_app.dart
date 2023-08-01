import 'package:d_input/d_input.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealtimeInputAppState extends StatefulWidget {
  const RealtimeInputAppState({super.key});

  @override
  State<RealtimeInputAppState> createState() => _RealtimeInputAppStateState();
}

class _RealtimeInputAppStateState extends State<RealtimeInputAppState> {
  final realtimeInputController = Get.put(RealtimeInputController());

  @override
  void initState() {
    DMethod.printBasic('initState() - RealtimeInputAppState');
    super.initState();
  }

  @override
  void dispose() {
    realtimeInputController.clearState();
    // Get.delete<RealtimeInputController>(force: true);
    DMethod.printBasic('dispose() - RealtimeInputAppState');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DMethod.printBasic('build() - RealtimeInputAppState');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Input App'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          DInput(
            controller: TextEditingController(),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            radius: BorderRadius.circular(30),
            onChanged: (value) {
              realtimeInputController.input = value!;
            },
          ),
          const SizedBox(height: 20),
          Obx(() {
            return Text(
              realtimeInputController.input,
              style: Theme.of(context).textTheme.displaySmall,
            );
          }),
        ],
      ),
    );
  }
}

class RealtimeInputController extends GetxController {
  final _input = 'Input Initial'.obs;

  String get input => _input.value;
  set input(String value) => _input.value = value;

  clearState() {
    Get.delete<RealtimeInputController>(force: true);
  }
}
