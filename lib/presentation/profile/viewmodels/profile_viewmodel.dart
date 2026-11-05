import 'package:flutter/foundation.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../../domain/entities/user_profile_entity.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository repository;

  UserProfileEntity? _profile;
  bool _isLoading = true;

  ProfileViewModel({required this.repository}) {
    loadProfile();
  }

  UserProfileEntity? get profile => _profile;
  bool get isLoading => _isLoading;

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();
    try {
      _profile = await repository.getUserProfile();
    } catch (_) {}
    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleOpenToWork() async {
    if (_profile == null) return;

    final updated = _profile!.copyWith(isOpenToWork: !_profile!.isOpenToWork);
    _profile = updated;
    notifyListeners();

    try {
      await repository.toggleOpenToWork(updated.id);
    } catch (_) {}
  }

  Future<void> toggleHiring() async {
    if (_profile == null) return;

    final updated = _profile!.copyWith(isHiring: !_profile!.isHiring);
    _profile = updated;
    notifyListeners();

    try {
      await repository.updateProfile(updated);
    } catch (_) {}
  }

  Future<void> updateBioAndTitle({
    required String name,
    required String title,
    required String company,
    required String location,
    required String bio,
    required List<String> skills,
  }) async {
    if (_profile == null) return;

    final updated = _profile!.copyWith(
      name: name,
      title: title,
      company: company,
      location: location,
      bio: bio,
      skills: skills,
    );

    _profile = updated;
    notifyListeners();

    try {
      await repository.updateProfile(updated);
    } catch (_) {}
  }

  Future<void> addExperience({
    required String role,
    required String company,
    required String location,
    required String startDate,
    required String endDate,
    required bool isCurrent,
    required String description,
  }) async {
    if (_profile == null) return;

    final newExp = ExperienceEntity(
      id: 'exp_${DateTime.now().millisecondsSinceEpoch}',
      userId: _profile!.id,
      role: role,
      company: company,
      location: location,
      startDate: startDate,
      endDate: endDate,
      isCurrent: isCurrent,
      description: description,
    );

    final updatedExperiences = List<ExperienceEntity>.from(_profile!.experiences)..insert(0, newExp);
    _profile = _profile!.copyWith(experiences: updatedExperiences);
    notifyListeners();

    try {
      await repository.addExperience(newExp);
    } catch (_) {}
  }

  Future<void> addProject({
    required String title,
    required String description,
    required List<String> techStack,
    required String githubUrl,
    required String liveUrl,
  }) async {
    if (_profile == null) return;

    final newProj = ProjectEntity(
      id: 'proj_${DateTime.now().millisecondsSinceEpoch}',
      userId: _profile!.id,
      title: title,
      description: description,
      techStack: techStack,
      githubUrl: githubUrl,
      liveUrl: liveUrl,
    );

    final updatedProjects = List<ProjectEntity>.from(_profile!.projects)..insert(0, newProj);
    _profile = _profile!.copyWith(projects: updatedProjects);
    notifyListeners();

    try {
      await repository.addProject(newProj);
    } catch (_) {}
  }
}
