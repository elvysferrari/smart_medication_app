import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{
  @observable
  int valor = 0;

  @action
  void aumentaValor(){
    print("Aumenta");
    valor++;
  }
}