import 'package:json_annotation/json_annotation.dart';

/// .g.dart 将在我们运行生成命令后自动生成
part 'user_entity.g.dart';

/// 这个标注是告诉生成器，这个类是需要生成Model类的，[参考链接](https://flutterchina.club/json/)
@JsonSerializable()
class UserEntity {
	@JsonKey(name: 'gists_url')
	String gistsUrl;
	@JsonKey(name: 'repos_url')
	String reposUrl;
	@JsonKey(name: 'following_url')
	String followingUrl;
	dynamic bio;
	@JsonKey(name: 'created_at')
	String createdAt;
	String login;
	String type;
	String blog;
	@JsonKey(name: 'subscriptions_url')
	String subscriptionsUrl;
	@JsonKey(name: 'updated_at')
	String updatedAt;
	@JsonKey(name: 'site_admin')
	bool siteAdmin;
	dynamic company;
	int id;
	@JsonKey(name: 'public_repos')
	int publicRepos;
	@JsonKey(name: 'gravatar_id')
	String gravatarId;
	dynamic email;
	@JsonKey(name: 'organizations_url')
	String organizationsUrl;
	dynamic hireable;
	@JsonKey(name: 'starred_url')
	String starredUrl;
	@JsonKey(name: 'followers_url')
	String followersUrl;
	int publicGists;
	String url;
	@JsonKey(name: 'received_events_url')
	String receivedEventsUrl;
	int followers;
	@JsonKey(name: 'avatar_url')
	String avatarUrl;
	@JsonKey(name: 'events_url')
	String eventsUrl;
	@JsonKey(name: 'html_url')
	String htmlUrl;
	int following;
	dynamic name;
	dynamic location;
	String nodeId;
	/// 已验证用户返回该字段
	@JsonKey(name: 'private_gists')
	int privateGists;
	/// 已验证用户返回该字段
	@JsonKey(name: 'total_private_repos')
	int totalPrivateRepos;
	/// 已验证用户返回该字段
	@JsonKey(name: 'owned_private_repos')
	int ownedPrivateRepos;
	/// 已验证用户返回该字段
	@JsonKey(name: 'disk_usage')
	int diskUsage;
	/// 已验证用户返回该字段
	int collaborators;
	/// 已验证用户返回该字段
	@JsonKey(name: 'two_factor_authentication')
	bool twoFactorAuthentication;
	/// 已验证用户返回该字段
	UserPlan plan;

	UserEntity({this.gistsUrl, this.reposUrl, this.twoFactorAuthentication, this.followingUrl, this.bio, this.createdAt, this.login, this.type,
		this.blog, this.privateGists, this.totalPrivateRepos, this.subscriptionsUrl, this.updatedAt, this.siteAdmin, this.diskUsage, this.collaborators,
		this.company, this.ownedPrivateRepos, this.id, this.publicRepos, this.gravatarId, this.plan, this.email, this.organizationsUrl, this.hireable,
		this.starredUrl, this.followersUrl, this.publicGists, this.url, this.receivedEventsUrl, this.followers, this.avatarUrl, this.eventsUrl,
		this.htmlUrl, this.following, this.name, this.location, this.nodeId});

	factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

	Map<String, dynamic> toJson() => _$UserEntityToJson(this);

	/// 判断用户类型，[type] 为 User时返回true，为Organization或其他时返回false。
	bool get isUser => this.type == 'User';

}

@JsonSerializable()
class UserPlan {
	@JsonKey(name: 'private_repos')
	int privateRepos;
	String name;
	int collaborators;
	int space;

	UserPlan({this.privateRepos, this.name, this.collaborators, this.space});
	factory UserPlan.fromJson(Map<String, dynamic> json) => _$UserPlanFromJson(json);
	Map<String, dynamic> toJson() => _$UserPlanToJson(this);

}
