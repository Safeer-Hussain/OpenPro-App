import '../entities/skill_endorsement.dart';

abstract class SkillRepositoryInterface {
  Future<List<SkillEndorsement>> getEndorsementsForUser(String userId);
  Future<SkillEndorsement> toggleEndorsement({
    required String userId,
    required String skillName,
    required String endorserName,
    required String endorserTitle,
    required String endorserAvatar,
  });
}
