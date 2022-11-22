import 'dart:convert';

import 'package:github_list/data/other/response_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(createToJson: false)
class UserResponse extends ResponseObject {
  List<DataUsers>? dataUsers;

  UserResponse({
    this.dataUsers,
  });

  factory UserResponse.fromJson(List<dynamic> json) =>
      _$UserResponseFromJson(json);

  static get serializer => _$UserResponseFromJson;
}

class DataUsers {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  DataUsers({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory DataUsers.fromMap(Map<String, dynamic> map) {
    return DataUsers(
      login: map['login'],
      id: map['id'],
      nodeId: map['node_id'],
      avatarUrl: map['avatar_url'],
      gravatarId: map['gravatar_id'],
      url: map['url'],
      htmlUrl: map['html_url'],
      followersUrl: map['followers_url'],
      followingUrl: map['following_url'],
      gistsUrl: map['gists_url'],
      starredUrl: map['starred_url'],
      subscriptionsUrl: map['subscriptions_url'],
      organizationsUrl: map['organizations_url'],
      reposUrl: map['repos_url'],
      eventsUrl: map['events_url'],
      receivedEventsUrl: map['received_events_url'],
      type: map['type'],
      siteAdmin: map['site_admin'],
    );
  }

  factory DataUsers.fromJson(String source) =>
      DataUsers.fromMap(json.decode(source));
}
