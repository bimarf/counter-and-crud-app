import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/simple_crud_controller.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get.dart';

class SimpleCrudApp extends StatefulWidget {
  const SimpleCrudApp({super.key});

  @override
  State<SimpleCrudApp> createState() => _SimpleCrudAppState();
}

class _SimpleCrudAppState extends State<SimpleCrudApp> {
  final simpleCrudController = Get.put(SimpleCrudController());

  addView() {
    final edtInput = TextEditingController();

    DInfo.customDialog(
        context: context,
        content: Column(
          children: [
            DInput(controller: edtInput),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  simpleCrudController.add(edtInput.text);
                  Navigator.pop(context);
                  DInfo.toastSuccess('Add Success');
                },
                child: const Text('Add'),
              ),
            )
          ],
        ));
  }

  updateView(String oldData, int index) {
    final edtInput = TextEditingController();
    edtInput.text = oldData;
    DInfo.customDialog(
        context: context,
        content: Column(
          children: [
            DInput(controller: edtInput),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  simpleCrudController.updateItem(index, edtInput.text);
                  Navigator.pop(context);
                  DInfo.toastSuccess('Update Success');
                },
                child: const Text('Update'),
              ),
            )
          ],
        ));
  }

  deleteView(String oldData, int index) {
    DInfo.dialogConfirmation(context, 'Delete', 'are you sure delete $oldData?')
        .then((yes) {
      if (yes ?? false) {
        simpleCrudController.deleteItem(index);
        DInfo.toastSuccess('Delete Success');
      }
    });
  }

  @override
  void dispose() {
    simpleCrudController.clearState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List list = ['Kucing', 'Anjing', 'Kambing', 'Kuda', 'Sapi'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Simple CRUD App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                addView();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: GetX(
          init: simpleCrudController,
          builder: (controller) {
            List<String> list = controller.list;
            if (list.isEmpty) {
              return const Center(child: Text('No Data'));
            }
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  String item = list[index];
                  return ListTile(
                    leading: IconButton.filled(
                      onPressed: () {
                        updateView(item, index);
                      },
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                    ),
                    title: Text(item),
                    trailing: IconButton.filled(
                      onPressed: () {
                        deleteView(item, index);
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                    ),
                  );
                });
          },
        ));
  }
}
