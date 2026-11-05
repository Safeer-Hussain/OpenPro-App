# Product Requirements Document (PRD)

## OpenPro: Next-Generation AI-Powered Professional Network & Recruiter-Talent Matching Platform

### Document Metadata
- **Product Name:** OpenPro Mobile
- **Version:** 1.0.0+1
- **Architect & Author:** Safeer Hussain (Principal Mobile Architect)
- **Target Platforms:** Android (API 21 - 35), iOS (iOS 13+), Edge-to-Edge Adaptive Desktop
- **Repository:** `https://github.com/Safeer-Hussain/openpro`

---

### 1. Executive Summary
OpenPro is a next-generation professional networking, vertical job discovery feed, and AI recruiter-candidate matching platform engineered in Flutter. It combines TikTok/Reels-style vertical swiping ergonomics for job hunting with rich engineering community discussions, interactive timed professional stories, on-device AI career consulting, and live recruiter telemetry.

The platform is designed with an offline-first SQLite career graph, eliminating paid third-party dependencies while providing sub-millisecond local queries, optimistic list mutations, and resilient network simulation via Dio interceptors.

---

### 2. Core Architecture & Tech Stack

```
+-------------------------------------------------------------------+
|                     Presentation Layer (MVVM)                     |
|  AdaptiveScaffold (Portrait NavigationBar / Landscape Rail)       |
|  Views: JobFeed, SocialFeed, AiAssistant, CommunityHub, Profile   |
|  ViewModels (ChangeNotifier): JobFeed, SocialFeed, AiAssistant... |
+-------------------------------------------------------------------+
                                 |
                                 v
+-------------------------------------------------------------------+
|                        Domain Layer                               |
|  Entities: JobEntity, PostEntity, StoryEntity, GroupEntity...     |
|  Utilities: MatchCalculator, AppFeedback                          |
+-------------------------------------------------------------------+
                                 |
                                 v
+-------------------------------------------------------------------+
|                         Data Layer                                |
|  Models: JobModel, PostModel, StoryModel, CommentModel...         |
|  Repositories: JobRepository, SocialRepository, ProfileRepo...    |
+-------------------------------------------------------------------+
                                 |
                                 v
+-------------------------------------------------------------------+
|                      Core Infrastructure                          |
|  SQLite (sqflite / sqflite_common_ffi): AppDatabase               |
|  HTTP Network Engine: Dio with MockNetworkInterceptor             |
|  Dependency Injection: GetIt Service Locator                      |
|  State Container: MultiProvider + Selector-driven rebuilds        |
+-------------------------------------------------------------------+
```

#### Principles & Invariants:
1. **SOLID & DRY Design:** Strict boundaries between Presentation, Domain, Data, and Core.
2. **Zero Hardcoded Colors:** Presentation widgets resolve exclusively from `Theme.of(context).colorScheme`.
3. **Unique Hero Tags:** Every `FloatingActionButton` declares an explicit, unique tag (`fab_job_feed`, `fab_create_post`, `fab_groups_create`, `fab_events_create`, `fab_profile_edit`).
4. **Landscape Safety (360dp Viewport):** Compact `NavigationRail` (`minWidth: 56`, `labelType: NavigationRailLabelType.none`) wrapped in `SingleChildScrollView` + `IntrinsicHeight`.
5. **No Emojis:** Exclusively vector Material Symbols / Cupertino icons.

---

### 3. Database Schema Specification (SQLite)

#### Table: `jobs`
- `id` (TEXT PRIMARY KEY): Unique job identifier (e.g., `job_101`).
- `title` (TEXT NOT NULL): Job role title.
- `company` (TEXT NOT NULL): Employing organization.
- `company_logo` (TEXT NOT NULL): Asset path or image URL.
- `location` (TEXT NOT NULL): Geographic location.
- `workplace_type` (TEXT NOT NULL): `Remote`, `Hybrid`, or `On-Site`.
- `employment_type` (TEXT NOT NULL): `Full-time`, `Contract`.
- `salary_min` (INTEGER NOT NULL): Lower compensation bound.
- `salary_max` (INTEGER NOT NULL): Upper compensation bound.
- `salary_currency` (TEXT NOT NULL): Currency symbol/code (USD, EUR, GBP).
- `equity` (TEXT NOT NULL): Equity percentage or range.
- `description` (TEXT NOT NULL): Summary of responsibilities.
- `requirements` (TEXT NOT NULL): JSON-serialized array of bullet requirements.
- `skills` (TEXT NOT NULL): JSON-serialized array of required technologies.
- `posted_date` (TEXT NOT NULL): Human-readable recency string.
- `is_bookmarked` (INTEGER NOT NULL DEFAULT 0): 1 = bookmarked, 0 = unbookmarked.
- `application_status` (TEXT NOT NULL DEFAULT 'none'): `none`, `applied`, `inReview`, `interviewScheduled`.
- `match_score` (INTEGER NOT NULL DEFAULT 85): AI compatibility rating.
- `recruiter_name` (TEXT NOT NULL): Lead hiring partner.
- `recruiter_title` (TEXT NOT NULL): Hiring partner title.

#### Table: `posts`
- `id` (TEXT PRIMARY KEY): Unique post identifier.
- `author_name` (TEXT NOT NULL): Post creator.
- `author_role` (TEXT NOT NULL): Author designation.
- `author_avatar` (TEXT NOT NULL): Avatar asset path.
- `author_company` (TEXT NOT NULL): Company affiliation.
- `content` (TEXT NOT NULL): Main editorial content.
- `code_snippet` (TEXT): Optional source code block.
- `code_language` (TEXT): Code syntax language (dart, rust, python).
- `timestamp` (TEXT NOT NULL): Recency indicator.
- `likes_count` (INTEGER NOT NULL DEFAULT 0): Aggregated likes.
- `comments_count` (INTEGER NOT NULL DEFAULT 0): Total discussion replies.
- `shares_count` (INTEGER NOT NULL DEFAULT 0): Repost counter.
- `is_liked` (INTEGER NOT NULL DEFAULT 0): Boolean state for active user.
- `is_bookmarked` (INTEGER NOT NULL DEFAULT 0): Saved post state.
- `tags` (TEXT NOT NULL): JSON-encoded list of hashtags.
- `image_url` (TEXT): Optional graphic asset.

#### Table: `comments`
- `id` (TEXT PRIMARY KEY): Unique comment ID.
- `post_id` (TEXT NOT NULL): Foreign key referencing `posts(id)`.
- `author_name` (TEXT NOT NULL): Commenter name.
- `author_avatar` (TEXT NOT NULL): Commenter image.
- `author_role` (TEXT NOT NULL): Professional role.
- `content` (TEXT NOT NULL): Message body.
- `timestamp` (TEXT NOT NULL): Relative timestamp.

#### Table: `stories`
- `id` (TEXT PRIMARY KEY): Unique story identifier.
- `author_name` (TEXT NOT NULL): Story publisher.
- `author_avatar` (TEXT NOT NULL): Publisher emblem.
- `title` (TEXT NOT NULL): Story title.
- `subtitle` (TEXT NOT NULL): Story summary.
- `media_url` (TEXT NOT NULL): Graphic card asset path.
- `duration_seconds` (INTEGER NOT NULL DEFAULT 6): Display duration.
- `posted_at` (TEXT NOT NULL): Timestamp.
- `is_viewed` (INTEGER NOT NULL DEFAULT 0): Viewed state.
- `reaction_count` (INTEGER NOT NULL DEFAULT 0): Aggregated user reactions.

#### Table: `groups` & `events`
- `groups`: `id`, `name`, `tagline`, `description`, `banner_url`, `member_count`, `topic`, `is_joined`, `recent_posts_count`.
- `events`: `id`, `title`, `organizer`, `organizer_logo`, `date_description`, `date_time`, `location_or_link`, `is_virtual`, `attendee_count`, `is_rsvp`, `speakers`, `tags`.

#### Table: `user_profile`
- `id`, `name`, `title`, `company`, `location`, `bio`, `avatar_url`, `is_open_to_work`, `is_hiring`, `skills`, `profile_views`, `recruiter_appearances`, `ai_match_rate_boost`.

---

### 4. Production Modules Specifications

#### Module 1: Vertical Job-Offer Scrolling Feed & 1-Tap Smart Apply
- Vertical full-height `PageView` in portrait; 2-pane Master-Detail in landscape.
- Dynamic `MatchScoreRing` computing candidate-role alignment (0 - 100%).
- Filter chips (Remote, Hybrid, On-Site, Seniority).
- 1-Tap Smart Apply modal validating cover pitch and portfolio links with status tracking (`Applied` -> `In Review` -> `Interview Scheduled`).
- Share Job Sheet offering clipboard export, repost to feed, and match card generation.

#### Module 2: Interactive Stories & Professional Community Feed
- Horizontal Stories bar with timed `StoryViewerModal` featuring progress bars, pause on hold, and quick reaction buttons.
- Feed cards with syntax-highlighted code snippets, copy code buttons, 100% reactive like counter mutations, and nested discussion sheets.
- Post creation modal with tag generation and code attachment support.

#### Module 3: On-Device AI Career Assistant & Resume Optimizer
- Natural conversation workspace pulling contextual knowledge from user profile, skills, and applied jobs in SQLite.
- Token streaming generator with `try ... finally` guaranteed state resets.
- Rapid action chips for instant match analysis, pitch generation, and interview screening simulations.

#### Module 4: Thematic Community Groups & Exclusive Events Hub
- Segmented hub: Tab 0 (Guilds) with instant reactive join/leave counters; Tab 1 (Events) with 1-tap RSVP and "+ Host Event" modal.

#### Module 5: Impactful Profile, Portfolio & Recruiter Analytics
- Verified skills cloud and role history timeline.
- Full-width `fl_chart` LineChart tracking 7-day recruiter engagement.
- Developer & Recruiter Debug Drawer with simulated network latency slider and HTTP 503 error toggles.
