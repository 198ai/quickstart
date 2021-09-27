import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'package:angular_router/angular_router.dart';
import 'hero_service.dart';
import 'route_paths.dart';
@Component(
  selector: 'my-hero',
  directives: [coreDirectives, formDirectives],
  templateUrl: 'hero_component.html',
  styleUrls: ['hero_component.css'],
  // template: '''
  // <div *ngIf="hero != null">
  //   <h2>{{hero.name}}</h2>
  //   <div><label>id: </label>{{hero.id}}</div>
  //   <div>
  //     <label>name: </label>
  //     <input [(ngModel)]="hero.name" placeholder="name">
  //   </div>
  // </div>''',
)
class HeroComponent implements OnActivate{
final HeroService _heroService;
final Location _location;
Hero hero;
HeroComponent(this._heroService, this._location);
  // @Input()
  
  //配置路由以后就不用父子传值了
  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) hero = await (_heroService.get(id));
  }

  void goBack() => _location.back();
  Future<void> save() async {
  await _heroService.update(hero);
  goBack();
}
}