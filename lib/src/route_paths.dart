import 'package:angular_router/angular_router.dart';

const idParam = 'id';
class RoutePaths {
  //配置路由路径
  static final heroes = RoutePath(path: 'heroes');
  static final dashboard = RoutePath(path: 'dashboard');
  static final hero = RoutePath(path: '${heroes.path}/:$idParam');

 
}

 //通过id传值
  int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}