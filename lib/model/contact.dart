import 'package:flutter/material.dart';
import 'package:json_api/document.dart';
import 'package:timeago/timeago.dart' as timeago;

class Contact {
  final String id;
  final String name;
  final String avatarUrl;
  final int lastOnline;

  Contact(
      {@required this.id,
      @required this.name,
      this.avatarUrl,
      this.lastOnline});

  factory Contact.fromResource(Resource resource) {
    final attrs = resource.attributes;
    return Contact(
        id: resource.id,
        name: attrs['name'],
        avatarUrl: attrs['avatar-url'],
        lastOnline: attrs['last-online']);
  }

  String getLastSeenText() =>
      "last seen " +
      timeago.format(DateTime.fromMillisecondsSinceEpoch(lastOnline * 1000));
}
