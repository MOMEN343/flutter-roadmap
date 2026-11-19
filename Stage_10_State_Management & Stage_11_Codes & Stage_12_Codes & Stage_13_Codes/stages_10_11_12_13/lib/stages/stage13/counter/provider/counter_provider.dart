import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/counter/notifier/counter_notifier.dart';

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
