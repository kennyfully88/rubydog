import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kondate_app/providers/ingredient_provider.dart';

class Test extends ConsumerWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredients = ref.watch(ingredientNotifierProvider);

    return Column(
      //いったん想定していたテストのListViewをいれる。ルビー師匠のElevatedButtonは残すのでとりあえずカラム
      children: [
        ListView.builder(
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(ingredients[index]?.name ?? 'null'),
            );
          },
        )
        
        ,ElevatedButton(
          onPressed: () {
            // ここでは read
            // .notifier をつける
            // .notifier をつけたときは ingredients ではなく notifier を左辺に受け取る
            final notifier = ref.read(ingredientNotifierProvider.notifier);
            // いろんな関数を呼び出してみるテスト
            //notifier.XXXX();
          },
          child: const Text('押してみて！'),
        ),
      ],
    );
  }
}
