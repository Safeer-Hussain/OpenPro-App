# OpenPro Autonomous Sprint Automation Rules

These rules govern the autonomous execution of engineering sprints for OpenPro.

## Trigger Phrase
When the user issues the exact command or instruction:
```text
run daily sprint
```

The AI agent MUST autonomously execute the following deterministic cycle:

---

### Step 1: Identify Next Sprint
1. Read `docs/AUTONOMOUS_BACKLOG.md`.
2. Locate the very first unchecked task item matching `- [ ] **Task Definition:**`.
3. If all items are marked `- [x]`, inform the user that all 25 sprints have been successfully delivered and suggest generating a comprehensive release report.

---

### Step 2: Implementation Standards
1. **Clean Architecture & SOLID:**
   - Place entities in `lib/domain/entities/`.
   - Place repository interfaces in `lib/domain/repositories/`.
   - Place data models and repository implementations in `lib/data/`.
   - Place ViewModels (`ChangeNotifier`) and UI views/widgets in `lib/presentation/`.
   - Register any new services, repositories, or ViewModels in `lib/core/services/service_locator.dart`.
2. **Strict Zero Hardcoded Colors:**
   - Resolve all colors dynamically via `Theme.of(context).colorScheme`.
   - Never use `Colors.black`, `Colors.white`, `Colors.grey`, or hardcoded `Color(0x...)` values in presentation widgets.
3. **Strict Zero Emojis:**
   - Never include emojis in source code, UI strings, comments, debug logs, commit messages, or documentation.
   - Use vector Material Symbols (`Icons.*`) exclusively for icons.
4. **Hero Tag Exclusivity:**
   - Any new `FloatingActionButton` MUST define a unique, explicit `heroTag` string.
5. **Responsive & Landscape Safety:**
   - Ensure all layouts conform to compact landscape heights (360dp) without `RenderFlex` overflow stripes.
   - Constrain text inside rows with `Expanded` or `Flexible` and specify `overflow: TextOverflow.ellipsis`.
   - In `GridView`, use explicit `mainAxisExtent` bounds rather than squished aspect ratios.

---

### Step 3: Test Suite Implementation
1. For every implemented sprint, write comprehensive automated tests in `test/unit/` or `test/widget/`.
2. Mock dependencies cleanly using `get_it` or fake classes without blocking platform channel timeouts.
3. Verify all edge cases defined in the sprint acceptance criteria.

---

### Step 4: Verification and Quality Gate
1. Execute static analysis:
   ```powershell
   flutter analyze
   ```
   Zero issues, warnings, or lints are permitted. Any finding must be resolved immediately before proceeding.
2. Execute automated test suite:
   ```powershell
   flutter test
   ```
   100% of tests across the entire repository must pass.

---

### Step 5: Mark Completed, Commit, and Push
1. In `docs/AUTONOMOUS_BACKLOG.md`, update the target sprint checkbox from `- [ ]` to `- [x]`.
2. Stage all modifications and newly created files:
   ```powershell
   git add .
   ```
3. Create a Conventional Commit without emojis:
   ```powershell
   git commit -m "feat(sprint-XX): <short descriptive summary of implemented feature>"
   ```
4. Push the commit to the remote repository:
   ```powershell
   git push origin main
   ```
5. Report to the user with a concise summary of the delivered sprint, files modified, and test verification results.
