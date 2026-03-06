# Turneo: Collaborative Work Calendar

**Turneo** is a cloud-native scheduling application designed for workers with rotating shifts. It simplifies tracking your work hours and, more importantly, makes it easy to coordinate your free time with friends, family, or colleagues.

---

## 🚀 The Vision
Managing a rotating schedule (Morning/Afternoon shifts) is often a headache when trying to plan social events or errands. **Turneo** aims to bridge that gap by providing a real-time, synchronized platform where the question "Who is working when?" is answered at a glance.

### Key Features
* **Instant Sync:** Log in with your Google Account and have your schedule available across all your devices instantly.
* **Effortless Editing:** A "click-and-set" interface to toggle between Morning (M) and Afternoon (A) shifts without navigating complex menus.
* **Cloud Persistence:** Every change is saved in real-time to the cloud. No manual "Save" button required.
* **Social Groups:** Create or join groups to see your friends' or partner's schedules in one place.
* **Compatibility View:** A dedicated "Match" calendar that highlights:
    * Common days off.
    * Days where both parties work the same shift.

---

## 🛠️ Tech Stack
* **Frontend:** [Flutter](https://flutter.dev/) (Dart)
* **State Management:** [Riverpod](https://riverpod.dev/) (Reactive State & Stream Providers)
* **Backend (Serverless):** [Firebase](https://firebase.google.com/)
    * **Authentication:** Google Sign-In.
    * **Database:** Cloud Firestore (NoSQL).

---

## 📅 Roadmap
- [x] **Phase 1:** Project setup and Google Auth integration.
- [ ] **Phase 2:** Basic calendar with shifts by color (Morning/Afternoon, Comments and Hours).
- [ ] **Phase 3:** Real-time database integration (CRUD operations).
- [ ] **Phase 4:** Group creation and user invitations.
- [ ] **Phase 5:** Common calendar view.

---

## 📝 License
This project is licensed under the MIT License.