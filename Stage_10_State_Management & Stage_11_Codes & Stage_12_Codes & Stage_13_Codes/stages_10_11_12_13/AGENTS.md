# AI Agents Guidelines & Project Instructions (AGENTS.md)

This document provides definitive instructions and rules for AI agents and developers working on this codebase.

---

## 1. Project Overview & Roadmap Milestones

This repository represents an educational application covering progressive milestones from the **Flutter Mobile Roadmap (From Zero)**:

* **Stage 10 (State Management Basics & Resource Management):**
  * state 
  * setState() 
  * stateless Vs stateful 
  * when to use setState().
* **Stage 11 (Local Storage, Packages & Theming):**
  * Assets 
  * pubspec.yaml 
  * Local Image 
  * Network Image 
  * Fonts 
  * Theme 
  * pub.dev 
  * google_fonts 
  * flutter_svg 
  * cached_network_image 
  * shared_preferences 
  * image_picker 
  * url_launcher 
  * intl 
  * save Login State 
* **Stage 12 (Networking, Models & REST APIs):**
  * What is API?
  * REST API
  * HTTP Request 
  * GET / POST / PUT / DELETE
  * Status Codes 
  * JSON  
  * Headers
  * Body
  * Token 
  * http 
  * Postman
  * Model Class 
  * fromJson 
  * toJson
  * List of Models 
  * Nullable Values
* **Stage 13 (Modern State Management with Riverpod) - [ACTIVE FOCUS]:**
  * Production-grade state management using `flutter_riverpod` (v3.x / modern Notifiers).
  * Layered architecture with strict separation of concerns.

---

## 2. Stage 13 Architecture & Module Structure

When creating any new feature or exercise in `lib/stages/stage13/`, create a dedicated folder using `snake_case` (e.g. `favorites_state`, `todos_state`) with this exact layout:

```text
lib/stages/stage13/<feature_name>/
├── models/       # Immutable data classes with fromJson / toJson / copyWith
├── services/     # HTTP / API calls (only if fetching from remote backend)
├── notifiers/    # State management & business logic (Notifier / AsyncNotifier)
├── providers/    # Provider definitions (NotifierProvider / AsyncNotifierProvider)
└── screens/      # Presentation UI (ConsumerWidget)
```

---

## 3. Reference Blueprints in the Codebase

Instead of re-inventing patterns, mimic the existing reference implementations:

1. **For Asynchronous / Remote API Data:**
   * **Reference:** Look at `lib/stages/stage13/Products State/`
   * **Service:** Handles HTTP calls and JSON decoding.
   * **Notifier:** Extends `AsyncNotifier<T>`, overrides `build()`, and handles async actions using `AsyncValue.guard`.
   * **Provider:** `AsyncNotifierProvider<Notifier, State>`.
   * **Screen:** Watches the provider and handles all 3 states via `.when(data: ..., loading: ..., error: ...)`.

2. **For Synchronous / In-Memory State:**
   * **Reference:** Look at `lib/stages/stage13/cart State/` (or `counter/`, `Login State/`)
   * **Notifier:** Extends `Notifier<T>`, overrides `build()`.
   * **State Mutations:** Strict immutability only. Never use `state.add()`, `state.remove()`, or `state.clear()`. Always assign a new state via `[...state, item]`, `where(...)`, or `copyWith()`.
   * **Computed Values:** Expose getters directly on the notifier (e.g. `totalPrice`, `totalItems`).
   * **Provider:** `NotifierProvider<Notifier, State>`.

---

## 4. Strict Riverpod & Flutter Rules

1. **`ref.watch` vs `ref.read`:**
   * Inside `Widget build(BuildContext context, WidgetRef ref)`: **Only** use `ref.watch(provider)`. Never use `ref.read` to render data.
   * Inside Event Handlers / Callbacks (`onPressed`, `onTap`): **Only** use `ref.read(provider.notifier)`. Never use `ref.watch` inside callbacks.
2. **Widget Types:** Always use `ConsumerWidget` or `ConsumerStatefulWidget`.
3. **Root Configuration:** `ProviderScope` must wrap the root app in `lib/main.dart`.
4. **Clean Imports:** Never import internal library paths (`package:flutter/src/...`). Always import `package:flutter/material.dart` and remove unused imports.
5. **Quality Check:** Run `flutter analyze` after creating or modifying code to ensure 0 errors and 0 warnings.

---

## 5. Testing & Testing Bench

To test any newly created Stage 13 screen:
1. Open `lib/main.dart`.
2. Set `home: const YourNewScreen()` in `MyApp.build()`.
3. Keep other screens commented out for seamless switching.

---

## 6. AI Agent Operational & Safety Rules

1. **User Approval Before Action (Creation, Modification, or Deletion):** Always explain the proposed plan and get explicit user approval before writing, modifying, creating, or deleting any files or running actions. Never implement or execute tasks without user consent.
2. **Explicit Approval for Deletion:** Under no circumstances may any file be deleted without explicitly asking and receiving the user's approval beforehand.
3. **Strict Task Isolation (No Unrelated File Modifications):** Never modify, touch, or delete any files outside the explicit scope of the current task. Earlier stages (Stage 10, 11, 12) and other existing Stage 13 modules must remain completely untouched.
4. **Mandatory Cleanup of Temporary Files (With Approval):** Any temporary files, scratch scripts, mock data, or test files created specifically for debugging, experimenting, or testing must be proposed for removal once testing is complete, and deleted only after getting the user's explicit consent, keeping the workspace clean.
