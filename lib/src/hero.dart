//创建一个英雄的类，方便以后实例化
class Hero {
  final int id;
  String name;
  Hero(this.id,this.name);
  factory Hero.fromJson(Map<String, dynamic> hero) =>
        Hero(_toInt(hero['id']), hero['name']);
    Map toJson() => {'id': id, 'name': name};
}
int _toInt(id) => id is int ? id : int.parse(id);
