import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/layout/default_layout.dart';
import 'package:flutter_study/riverpod/state_provider_screen.dart';

// class StateProviderScreen extends StatelessWidget {
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  // Widget build(BuildContext context) {
  //ConsumerWidget은 stateLess widget하고 99프로 같으나, 받는 파라미터가 하나 더 생긴다.
  //선언한 stateProvider에 접근하는 파라미터가 새로 추가된다.
  Widget build(BuildContext context, WidgetRef ref) {
    //provider가 반환하는 값을 구독하고, 변경 감지 = ui 반영용
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width, //넓이 최대한
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  //provider반환값을 update시키고 싶을 땐 read
                  //현재 상태를 뜻하는 state를 파라미터로 받음
                  ref
                      .read(numberProvider.notifier)
                      .update((state) => state + 1);
                },
                child: Text('up'),
              ),
              ElevatedButton(
                onPressed: () {
                  //update메서드를 사용하지 않고, state를 읽어서 직접 변경시킬 수도 있음
                  ref.read(numberProvider.notifier).state =
                      ref.read(numberProvider.notifier).state - 1;
                },
                child: Text('down'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => _NextScreen(),
                    ),
                  );
                },
                child: Text('Next Screen'),
              )
            ],
          ),
        ));
  }
}

class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width, //넓이 최대한
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                provider.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(numberProvider.notifier)
                      .update((state) => state + 1);
                },
                child: Text('up'),
              )
            ],
          ),
        ));
  }
}
