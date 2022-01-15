import 'package:flutter_challenge/modules/repositories/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final Repository _dioRepository;

  HomeController(this._dioRepository);

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _dioRepository.getAllProductos();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar produtos'));
    }
  }
}
