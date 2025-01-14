//import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:angular_router/angular_router.dart';
import 'main.template.dart' as self;
import 'package:angular_app/in_memory_data_service.dart';
import 'package:http/http.dart';
@GenerateInjector([
  routerProvidersHash, // You can use routerProviders in production
  ClassProvider(Client, useClass: InMemoryDataService),
]
)

final InjectorFactory injector = self.injector$Injector;
void main() {
  runApp(ng.AppComponentNgFactory,createInjector: injector);
}
