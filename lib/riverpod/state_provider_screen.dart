import 'package:flutter_riverpod/flutter_riverpod.dart';


final numberProvider = StateProvider<int>((ref)=> 0);

//watch로 반환하는 값을 구독할 수 있음
