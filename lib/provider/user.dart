import 'package:flutter_chat/domain/isar/account/account.dart';
import 'package:flutter_chat/provider/isar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accountProvider = Provider<Account>((ref) {
  ref
      .watch(isarProvider)
      .accounts
      .watchObject(1, initialReturn: true)
      .listen((event) {
    if (event is Account) {
      ref.state = event;
    }
  });
  return Account();
});