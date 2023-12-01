import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/sign_in/models/firestore_user_notifer_provider.dart';

final authProvider = ChangeNotifierProvider((ref) => FirestoreUserNotifier());
final userStream = StreamProvider((ref) => ref.watch(authProvider).authStateChange);
