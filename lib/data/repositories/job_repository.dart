import 'package:sqflite/sqflite.dart';
import '../../core/database/app_database.dart';
import '../../core/database/database_tables.dart';
import '../../domain/entities/job_entity.dart';
import '../models/job_model.dart';

class JobRepository {
  final AppDatabase database;

  JobRepository({required this.database});

  Future<List<JobEntity>> getJobs() async {
    final db = await database.database;
    final maps = await db.query(DatabaseTables.jobs);
    return maps.map((m) => JobModel.fromMap(m)).toList();
  }

  Future<JobEntity?> toggleBookmark(String jobId) async {
    final db = await database.database;
    final results = await db.query(
      DatabaseTables.jobs,
      where: 'id = ?',
      whereArgs: [jobId],
      limit: 1,
    );
    if (results.isEmpty) return null;

    final currentJob = JobModel.fromMap(results.first);
    final updatedSaved = !currentJob.isBookmarked;

    await db.update(
      DatabaseTables.jobs,
      {'is_bookmarked': updatedSaved ? 1 : 0},
      where: 'id = ?',
      whereArgs: [jobId],
    );

    return currentJob.copyWith(isBookmarked: updatedSaved);
  }

  Future<JobEntity?> submitApplication({
    required String jobId,
    required String coverNote,
    String? portfolioUrl,
  }) async {
    final db = await database.database;
    final results = await db.query(
      DatabaseTables.jobs,
      where: 'id = ?',
      whereArgs: [jobId],
      limit: 1,
    );
    if (results.isEmpty) return null;

    final currentJob = JobModel.fromMap(results.first);
    const newStatus = 'applied';

    await db.update(
      DatabaseTables.jobs,
      {'application_status': newStatus},
      where: 'id = ?',
      whereArgs: [jobId],
    );

    return currentJob.copyWith(applicationStatus: newStatus);
  }

  Future<JobEntity?> updateApplicationStatus({
    required String jobId,
    required String status,
  }) async {
    final db = await database.database;
    final results = await db.query(
      DatabaseTables.jobs,
      where: 'id = ?',
      whereArgs: [jobId],
      limit: 1,
    );
    if (results.isEmpty) return null;

    final currentJob = JobModel.fromMap(results.first);

    await db.update(
      DatabaseTables.jobs,
      {'application_status': status},
      where: 'id = ?',
      whereArgs: [jobId],
    );

    return currentJob.copyWith(applicationStatus: status);
  }

  Future<void> addJob(JobEntity job) async {
    final db = await database.database;
    final model = JobModel(
      id: job.id,
      title: job.title,
      company: job.company,
      companyLogo: job.companyLogo,
      location: job.location,
      workplaceType: job.workplaceType,
      employmentType: job.employmentType,
      salaryMin: job.salaryMin,
      salaryMax: job.salaryMax,
      salaryCurrency: job.salaryCurrency,
      equity: job.equity,
      description: job.description,
      requirements: job.requirements,
      skills: job.skills,
      postedDate: job.postedDate,
      isBookmarked: job.isBookmarked,
      applicationStatus: job.applicationStatus,
      matchScore: job.matchScore,
      recruiterName: job.recruiterName,
      recruiterTitle: job.recruiterTitle,
    );
    await db.insert(
      DatabaseTables.jobs,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
