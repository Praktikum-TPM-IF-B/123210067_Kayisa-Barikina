class dart {
  List<Amiibo>? amiibo;

  dart({this.amiibo});

  dart.fromJson(Map<String, dynamic> json) {
    if (json['amiibo'] != null) {
      amiibo = <Amiibo>[];
      json['amiibo'].forEach((v) {
        amiibo!.add(new Amiibo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amiibo != null) {
      data['amiibo'] = this.amiibo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Amiibo {
  String? amiiboSeries;
  String? character;
  String? gameSeries;
  String? head;
  String? image;
  String? name;
  Release? release;
  String? tail;
  String? type;

  Amiibo(
      {this.amiiboSeries,
      this.character,
      this.gameSeries,
      this.head,
      this.image,
      this.name,
      this.release,
      this.tail,
      this.type});

  Amiibo.fromJson(Map<String, dynamic> json) {
    amiiboSeries = json['amiiboSeries'];
    character = json['character'];
    gameSeries = json['gameSeries'];
    head = json['head'];
    image = json['image'];
    name = json['name'];
    release =
        json['release'] != null ? new Release.fromJson(json['release']) : null;
    tail = json['tail'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amiiboSeries'] = this.amiiboSeries;
    data['character'] = this.character;
    data['gameSeries'] = this.gameSeries;
    data['head'] = this.head;
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.release != null) {
      data['release'] = this.release!.toJson();
    }
    data['tail'] = this.tail;
    data['type'] = this.type;
    return data;
  }
}

class Release {
  String? au;
  String? eu;
  String? jp;
  String? na;

  Release({this.au, this.eu, this.jp, this.na});

  Release.fromJson(Map<String, dynamic> json) {
    au = json['au'];
    eu = json['eu'];
    jp = json['jp'];
    na = json['na'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['au'] = this.au;
    data['eu'] = this.eu;
    data['jp'] = this.jp;
    data['na'] = this.na;
    return data;
  }
}
