import 'package:angular/angular.dart';
import 'package:angular_app/src/route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'hero_search_component.dart';
@Component(
  selector: 'my-dashboard',
  // template: '<h3>食物导航</h3>',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives,routerDirectives,HeroSearchComponent,],
  styleUrls: ['dashboard_component.css'],
)
class DashboardComponent implements OnInit {
   List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);
  
  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(2).take(4).toList();
    //从第二个开始拿出四个
  }

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
}