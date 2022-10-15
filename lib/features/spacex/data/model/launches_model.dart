class SpacexLaunches {
  Fairings? fairings;
  Links? links;
  String? staticFireDateUtc;
  int? staticFireDateUnix;
  bool? net;
  int? window;
  String? rocket;
  bool? success;
  List<Failures>? failures;
  String? details;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  String? dateUtc;
  int? dateUnix;
  String? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Cores>? cores;
  bool? autoUpdate;
  bool? tbd;
  String? id;

  SpacexLaunches(
      {this.fairings,
      this.links,
      this.staticFireDateUtc,
      this.staticFireDateUnix,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.failures,
      this.details,
      this.payloads,
      this.launchpad,
      this.flightNumber,
      this.name,
      this.dateUtc,
      this.dateUnix,
      this.dateLocal,
      this.datePrecision,
      this.upcoming,
      this.cores,
      this.autoUpdate,
      this.tbd,
      this.id});

  SpacexLaunches.fromJson(Map<String, dynamic> json) {
    fairings =
        json['fairings'] != null ? Fairings.fromJson(json['fairings']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    staticFireDateUtc = json['static_fire_date_utc'];
    staticFireDateUnix = json['static_fire_date_unix'];
    net = json['net'];
    window = json['window'];
    rocket = json['rocket'];
    success = json['success'];
    if (json['failures'] != null) {
      failures = <Failures>[];
      json['failures'].forEach((v) {
        failures!.add(Failures.fromJson(v));
      });
    }
    details = json['details'];

    payloads = json['payloads'].cast<String>();
    launchpad = json['launchpad'];
    flightNumber = json['flight_number'];
    name = json['name'];
    dateUtc = json['date_utc'];
    dateUnix = json['date_unix'];
    dateLocal = json['date_local'];
    datePrecision = json['date_precision'];
    upcoming = json['upcoming'];
    if (json['cores'] != null) {
      cores = <Cores>[];
      json['cores'].forEach((v) {
        cores!.add(Cores.fromJson(v));
      });
    }
    autoUpdate = json['auto_update'];
    tbd = json['tbd'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fairings != null) {
      data['fairings'] = fairings!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    data['static_fire_date_utc'] = staticFireDateUtc;
    data['static_fire_date_unix'] = staticFireDateUnix;
    data['net'] = net;
    data['window'] = window;
    data['rocket'] = rocket;
    data['success'] = success;
    if (failures != null) {
      data['failures'] = failures!.map((v) => v.toJson()).toList();
    }
    data['details'] = details;

    data['payloads'] = payloads;
    data['launchpad'] = launchpad;
    data['flight_number'] = flightNumber;
    data['name'] = name;
    data['date_utc'] = dateUtc;
    data['date_unix'] = dateUnix;
    data['date_local'] = dateLocal;
    data['date_precision'] = datePrecision;
    data['upcoming'] = upcoming;
    if (cores != null) {
      data['cores'] = cores!.map((v) => v.toJson()).toList();
    }
    data['auto_update'] = autoUpdate;
    data['tbd'] = tbd;
    data['id'] = id;
    return data;
  }
}

class Fairings {
  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;

  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
  });

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reused'] = reused;
    data['recovery_attempt'] = recoveryAttempt;
    data['recovered'] = recovered;

    return data;
  }
}

class Links {
  Patch? patch;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links(
      {this.patch,
      this.webcast,
      this.youtubeId,
      this.article,
      this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    patch = json['patch'] != null ? Patch.fromJson(json['patch']) : null;

    webcast = json['webcast'];
    youtubeId = json['youtube_id'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (patch != null) {
      data['patch'] = patch!.toJson();
    }

    data['webcast'] = webcast;
    data['youtube_id'] = youtubeId;
    data['article'] = article;
    data['wikipedia'] = wikipedia;
    return data;
  }
}

class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  Patch.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class Failures {
  int? time;
  String? reason;

  Failures({this.time, this.reason});

  Failures.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['reason'] = reason;
    return data;
  }
}

class Cores {
  String? core;
  int? flight;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landingAttempt;

  Cores({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
  });

  Cores.fromJson(Map<String, dynamic> json) {
    core = json['core'];
    flight = json['flight'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landingAttempt = json['landing_attempt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['core'] = core;
    data['flight'] = flight;
    data['gridfins'] = gridfins;
    data['legs'] = legs;
    data['reused'] = reused;
    data['landing_attempt'] = landingAttempt;

    return data;
  }
}
