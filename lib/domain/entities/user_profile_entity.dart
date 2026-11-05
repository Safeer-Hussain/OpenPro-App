class ExperienceEntity {
  final String id;
  final String userId;
  final String role;
  final String company;
  final String location;
  final String startDate;
  final String endDate;
  final bool isCurrent;
  final String description;

  const ExperienceEntity({
    required this.id,
    required this.userId,
    required this.role,
    required this.company,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.description,
  });

  ExperienceEntity copyWith({
    String? id,
    String? userId,
    String? role,
    String? company,
    String? location,
    String? startDate,
    String? endDate,
    bool? isCurrent,
    String? description,
  }) {
    return ExperienceEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      company: company ?? this.company,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrent: isCurrent ?? this.isCurrent,
      description: description ?? this.description,
    );
  }
}

class ProjectEntity {
  final String id;
  final String userId;
  final String title;
  final String description;
  final List<String> techStack;
  final String githubUrl;
  final String liveUrl;

  const ProjectEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.techStack,
    required this.githubUrl,
    required this.liveUrl,
  });

  ProjectEntity copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    List<String>? techStack,
    String? githubUrl,
    String? liveUrl,
  }) {
    return ProjectEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      techStack: techStack ?? this.techStack,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
    );
  }
}

class UserProfileEntity {
  final String id;
  final String name;
  final String title;
  final String company;
  final String location;
  final String bio;
  final String avatarUrl;
  final bool isOpenToWork;
  final bool isHiring;
  final List<String> skills;
  final List<ExperienceEntity> experiences;
  final List<ProjectEntity> projects;
  final int profileViews;
  final int recruiterAppearances;
  final int aiMatchRateBoost;

  const UserProfileEntity({
    required this.id,
    required this.name,
    required this.title,
    required this.company,
    required this.location,
    required this.bio,
    required this.avatarUrl,
    required this.isOpenToWork,
    required this.isHiring,
    required this.skills,
    required this.experiences,
    required this.projects,
    required this.profileViews,
    required this.recruiterAppearances,
    required this.aiMatchRateBoost,
  });

  UserProfileEntity copyWith({
    String? id,
    String? name,
    String? title,
    String? company,
    String? location,
    String? bio,
    String? avatarUrl,
    bool? isOpenToWork,
    bool? isHiring,
    List<String>? skills,
    List<ExperienceEntity>? experiences,
    List<ProjectEntity>? projects,
    int? profileViews,
    int? recruiterAppearances,
    int? aiMatchRateBoost,
  }) {
    return UserProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      company: company ?? this.company,
      location: location ?? this.location,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isOpenToWork: isOpenToWork ?? this.isOpenToWork,
      isHiring: isHiring ?? this.isHiring,
      skills: skills ?? this.skills,
      experiences: experiences ?? this.experiences,
      projects: projects ?? this.projects,
      profileViews: profileViews ?? this.profileViews,
      recruiterAppearances: recruiterAppearances ?? this.recruiterAppearances,
      aiMatchRateBoost: aiMatchRateBoost ?? this.aiMatchRateBoost,
    );
  }
}
