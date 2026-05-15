# uni_forums

## Showcase

A sample forum app built with Flutter, displaying threaded topics and replies.

<p float="left">
  <img src="assets/SS%201.png" alt="Screenshot 1" width="320" />
  <img src="assets/SS%202.png" alt="Screenshot 2" width="320" />
</p>

## Overview

`uni_forums` is a Flutter demo app that showcases a simple forum interface with:

- A list of discussion topics
- Reply threads with avatars, timestamps, and like counts
- A `Topic` data model and `Reply` data model stored in `lib/data.dart`
- Navigation from topic list to reply details

## Project Structure

- `lib/main.dart` – app entry point and topic list UI
- `lib/replies_page.dart` – reply detail page and reply list rendering
- `lib/data.dart` – hardcoded forum data for topics and replies
- `lib/utility.dart` – date formatting helper functions
- `assets/` – screenshot images used for showcase and project visuals

## Running the App

1. Install Flutter and set up your development environment.
2. Run `flutter pub get` in the project root.
3. Launch the app with `flutter run`.

## Notes

- Avatar images are loaded from remote URLs.
- The app currently uses static sample data and is intended for demo/assignment purposes.
