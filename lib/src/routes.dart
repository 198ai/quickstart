import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'hero_list_component.template.dart' as hero_list_template;
import 'dashboard_component.template.dart' as  dashboard_template;
export 'route_paths.dart';
import 'hero_component.template.dart' as hero_template;
class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );
  //将路径添加到路由
  static final dashboard = RouteDefinition(
  routePath: RoutePaths.dashboard,
  component: dashboard_template.DashboardComponentNgFactory,
);
  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );
//routePath: The router matches this path against the URL in the browser address bar (heroes).
//component: The (factory of the) component that will be activated when this route is navigated to
  static final all = <RouteDefinition>[
    heroes,dashboard,hero,
  ];
}