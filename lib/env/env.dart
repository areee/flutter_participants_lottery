import 'package:envify/envify.dart';
part 'env.g.dart';

@Envify()
abstract class Env {
  static const multiavatar = _Env.multiavatar;
}