//어떤 provider든 사용할 수 있음
//아래 예제는 future 버전

import 'package:flutter_riverpod/flutter_riverpod.dart';

//family는 두 개의 파라미터를 받는다.
final familyModiferProvider = FutureProvider.family<List<int>, int>((ref, data)async{
    await Future.delayed(Duration(seconds: 2));
    return List.generate(3, (index) => index * data);
});