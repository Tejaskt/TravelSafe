# AGENTS.md

## Project Snapshot
- `travel_safe` is a Flutter UI-focused app (no backend/service layer in repo) that currently flows `Splashscreen -> Onboarding -> HomeScreen`.
- Entry point: `lib/main.dart` wraps the app in `ResponsiveSizer` and sets `home: Splashscreen()`.
- Most product text, image paths, and simple list data are centralized under `lib/core/constants/`.

## Architecture and Data Flow
- UI is screen-driven: `lib/views/screen/` contains main screens (`splash_screen.dart`, `onboarding.dart`, `home_screen.dart`).
- Navigation is imperative with `Navigator.pushReplacement(...)` (see `splash_screen.dart` and skip action in `onboarding.dart`).
- Onboarding content is data-driven from `AppData.onboardingData` in `lib/core/constants/app_data.dart`; `onboarding.dart` renders it with `PageView.builder`.
- Home content mixes static constants and widget helpers (`smallHeadings`, `cityView`, `popularDestinationCard`) in `lib/views/screen/home_screen.dart`.

## Conventions Used in This Repo
- Keep design tokens centralized: colors in `app_colors.dart`, strings in `app_strings.dart`, assets in `app_images.dart`.
- Responsive sizing is split between:
  - `ResponsiveHelpers.w/h/sp/screenPadding` in `lib/core/helpers/responsive_helpers.dart`
  - `responsive_sizer` extensions (`.sp`, `.w`) used directly in widgets.
- Styling pattern is inline `TextStyle` with custom font families from `pubspec.yaml` (`JBold`, `JMedium`, `Lato`).
- Many widgets use Dart shorthand enum values (for example `.center`, `.cover`, `.w600`); preserve this style in adjacent code.

## External Dependencies and Integration Points
- `responsive_sizer`: global responsive wrapper in `main.dart`, plus `.sp/.w` extensions.
- `flutter_svg`: used for SVG assets (for example arrow icon in `popularDestinationCard` in `home_screen.dart`).
- Assets and fonts are declared in `pubspec.yaml`; add new files there before use.

## Developer Workflows (verified in this repo)
- Install deps: `flutter pub get`
- Analyze: `flutter analyze` (currently reports 3 issues: 2 unused locals in `home_screen.dart`, 1 async context warning in `splash_screen.dart`).
- Test: `flutter test` currently fails because `test/widget_test.dart` is still the default counter test and does not match this app UI.
- Run app: `flutter run` (choose target device/emulator).

## Agent Guardrails for Changes
- Do not assume an API/data layer exists; new behavior is currently local-widget/state driven.
- If adding text/images/icons, update the relevant constants file first, then consume from screens.
- Preserve navigation flow unless task explicitly changes onboarding/splash behavior.
- If you touch `main.dart` or fonts/assets, verify with both `flutter analyze` and at least one `flutter test` run.
