//state notifier는 클래스 직접 생성
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/model/shopping_model.dart';

//1. notifer provider로 사용할 notifer class를 하나 만들어준다.
//2. notifer class의 인스턴스를 StateNotiferProvider 메서드를 통해 provider로 등록한다.


//StateNotifer을 상속받아 만든 class를 notifer provider로써 사용하는 방법
//<notifier 종류, notifer타입>
//notifier provider라는 더 간결하게 상태관리를 할 수 있도록 도와주는 새로운 방식이 2.0때 새로 나옴, 아래는 이전 notifierProvider임
final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) => ShoppingListNotifier());


//상태관리할 타입이 어떤 타입인지 항상 지정해줘야한다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {

  //생성자의 super에는 provider 상태의 초기값이 들어간다.
  ShoppingListNotifier() : super([
    ShoppingItemModel(name: '감차', quantity: 3, hasBought: false, isSpicy: true),
    ShoppingItemModel(name: '라면', quantity: 5, hasBought: false, isSpicy: true),
    ShoppingItemModel(
        name: '삼겹살', quantity: 10, hasBought: false, isSpicy: false),
    ShoppingItemModel(
        name: '수박', quantity: 2, hasBought: false, isSpicy: false),
    ShoppingItemModel(
        name: '카스테라', quantity: 6, hasBought: false, isSpicy: false)
  ]);

  //업데이트 방법: 메서드

  void toggleHasBought({required String name}) {
    //state: StateNotifer로부터 상속받은 상태, 초기화해준 값이 처음에 들어온다.
    state = state.map((e) =>
    e.name == name ? ShoppingItemModel(
        name: e.name,
        quantity: e.quantity,
        hasBought: !e.hasBought,
        isSpicy: e.isSpicy) : e).toList();
  }

}