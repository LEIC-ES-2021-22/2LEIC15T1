// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/login_action.dart';
import '../model/Profile.dart';
import '../model/Session.dart';
import 'homepage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;
  const Event(this.title);
  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(loadJson());


Future<Map<DateTime, List<Event>>> loadEvents() async {
  String data = await rootBundle.loadString('json/activities.json');
  final parsedJson = json.decode(data);

  final _kEventSource = {
    for (var item in parsedJson)
      DateTime.utc(kFirstDay.year, kFirstDay.month, item['day'] as int) :
      List.generate(1, (index) => Event(item['title'] as String))
  } ..addAll({kToday: [Event('ES Class'), Event('SO Class'),],
  });
  return _kEventSource;
}

loadJson() async {
  String data = await rootBundle.loadString('json/activities.json');
  final parsedJson = json.decode(data);

  final _kEventSource = {
    for (var item in parsedJson)
      DateTime.utc(kFirstDay.year, kFirstDay.month, item['day'] as int) :
      List.generate(1, (index) => Event(item['title'] as String))
  } ..addAll({kToday: [Event('Today\'s Event 1'), Event('Today\'s Event 2'),],
  });
  return _kEventSource;
}


int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 6, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 6, kToday.day);

