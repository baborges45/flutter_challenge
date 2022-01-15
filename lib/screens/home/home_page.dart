import 'package:flutter/material.dart';
import 'package:flutter_challenge/components/image_widget.dart';
import 'package:flutter_challenge/model/product_model.dart';
import 'package:flutter_challenge/screens/home/home_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageWidget(),
    );
  }

  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Page'),
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final ProductModel item = state[index];
            return ListTile(
              title: Text(item.title),
              subtitle: Text('Quantidade de types: ${item.type.length}'),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error),
              TextButton(
                onPressed: () => controller,
                child: Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}
