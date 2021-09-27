import 'package:angular/angular.dart';
import 'package:angular_app/src/route_paths.dart';
import 'hero.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero_component.dart';
import 'hero_service.dart';
import 'package:angular_router/angular_router.dart';
@Component(
  selector: 'my-heroes',
  directives: [formDirectives, coreDirectives, HeroComponent],
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)
//双花括号是Angular的插值语法。
//这些插值绑定将组件的title和hero属性值以字符串的形式呈现在HTML头标签中。
class HeroListComponent implements OnInit{
  final title = '好久没吃到的食物之旅';
  var hero = '苹果'; //改变名字后app-test会报错，不影响启动
  Hero girl = Hero(1, '草莓'); //实例化英雄类
  //List<Hero> heroes = mockHeroes; //建一个数组来实例化类

  Hero selected;
  void onSelect(Hero hero) => selected = hero;

  //注入服务，用构造函数方式
 final HeroService _heroService;
 HeroListComponent(this._heroService, this._router);
 List<Hero> heroes;
// 不再直接使用英雄列表类而是通过服务来注入
// void _getHeroes() {
//   heroes = _heroService.getAll();
// }
// void _getHeroes() {
//   _heroService.getAll().then((heroes) => this.heroes = heroes);
//   //异步函数  将回调函数作为参数传递给Future.then()方法:  
// }
Future<void> _getHeroes() async {
  //又多个返回异步方法时可以用
  heroes = await _heroService.getAll() ;
}
final Router _router;
//在试图加载的时候调用服务
 void ngOnInit() => _getHeroes();
 String _heroUrl(int id) =>
      RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
Future<NavigationResult> gotoDetail() =>  _router.navigate(_heroUrl(selected.id));

Future<void> add(String name) async {
  name = name.trim();
  if (name.isEmpty) return null;
  heroes.add(await _heroService.create(name));
  selected = null;
}
Future<void> delete(Hero hero) async {
  await _heroService.delete(hero.id);
  heroes.remove(hero);
  if (selected == hero) selected = null;
}
}
