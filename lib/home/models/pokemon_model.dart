class PokemonModel {
  PokemonModel({
      this.count, 
      this.next, 
      this.previous, 
      this.results,});

  PokemonModel.fromJson(dynamic json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(PokemonListResults.fromJson(v));
      });
    }
  }
  int? count;
  String? next;
  String? previous;
  List<PokemonListResults>? results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['next'] = next;
    map['previous'] = previous;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PokemonListResults {
  PokemonListResults({
      this.name, 
      this.url,});

  PokemonListResults.fromJson(dynamic json) {
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

}