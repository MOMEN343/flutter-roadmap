import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stage10/stages/stage13/Login%20State/notifier/auth_notifier.dart';

final authProvider = NotifierProvider<AuthNotifier, bool>(AuthNotifier.new);
