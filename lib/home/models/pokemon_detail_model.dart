class PokemonDetailModel {
  PokemonDetailModel({
      this.id, 
      this.name, 
      this.sprites, 
      this.types,});

  PokemonDetailModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    sprites = json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types?.add(Types.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  Sprites? sprites;
  List<Types>? types;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (sprites != null) {
      map['sprites'] = sprites?.toJson();
    }
    if (types != null) {
      map['types'] = types?.map((v) => v.toJson()).toList();
    }


    return map;
  }

  @override
  String toString() {
    return 'PokemonDetailModel{id: $id, name: $name, sprites: $sprites, types: $types}';
  }
}

class Types {
  Types({
      this.slot, 
      this.type,});

  Types.fromJson(dynamic json) {
    slot = json['slot'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }
  int? slot;
  Type? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slot'] = slot;
    if (type != null) {
      map['type'] = type?.toJson();
    }
    return map;
  }

}

class Type {
  Type({
      this.name, 
      this.url,});

  Type.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

  @override
  String toString() {
    return '$name,';
  }
}

class Sprites {
  Sprites({
      this.other,});

  Sprites.fromJson(dynamic json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }
  Other? other;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (other != null) {
      map['other'] = other?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'Sprites{other: $other}';
  }
}

class Other {
  Other({
      this.home,});

  Other.fromJson(dynamic json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }
  Home? home;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (home != null) {
      map['home'] = home?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'Other{home: $home}';
  }
}

class Home {
  Home({
      this.frontDefault, 
      this.frontFemale, 
      this.frontShiny, 
      this.frontShinyFemale,});

  Home.fromJson(dynamic json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }
  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['front_default'] = frontDefault;
    map['front_female'] = frontFemale;
    map['front_shiny'] = frontShiny;
    map['front_shiny_female'] = frontShinyFemale;
    return map;
  }

  @override
  String toString() {
    return 'Home{frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale}';
  }
}


class PokemonFavoriteModel {
  PokemonFavoriteModel({
    this.id,
    this.name,
    this.image,
   });

  PokemonFavoriteModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  String? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = name;

    return map;
  }

  @override
  String toString() {
    return 'PokemonFavoriteModel{id: $id, name: $name, image: $image}';
  }
}
