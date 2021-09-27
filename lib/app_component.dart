import 'package:angular/angular.dart';

import 'src/hero_service.dart';
//import 'src/hero_list_component.dart';
import 'src/routes.dart';
import 'package:angular_router/angular_router.dart';
//在根目录中做路由
@Component(
  selector: 'my-app',
  // template: '''
  //   <h1>{{title}}</h1>
  //   <my-heroes></my-heroes>
  // ''',
  // directives: [HeroListComponent],
  template: '''
  <h1>{{title}}</h1>
  <nav>
   <a  [routerLink]="RoutePaths.dashboard.toUrl()"
       [routerLinkActive]="'active'">需要的money</a>
    <a [routerLink]="RoutePaths.heroes.toUrl()"
       [routerLinkActive]="'active'">开启食物之旅</a>
  </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],//导出
)
class AppComponent {
  final title = '月月吃土';
}