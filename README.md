### Objective
Your assignment is to implement a movie streaming dashboard using Dart and Flutter.

### Brief
You are the owner of a movie theater in **Thikkiiana City,** on the Wookiee homeworld of Kashyyyk. Your customers are bored with the never changing selection and are asking for something completely different - they want to see what's playing on Earth. Wookies are the main exporter of Computer Technology for the New Republic so naturally you roll up your sleeves and get to work. You quickly scribble down some notes and after a few hours of relentless work you have a design in mind.

### Tasks
-   Implement assignment using:
    -   Language: **Dart**
    -   Framework: **Flutter**
-   Build out the project to the designs inside the `/Designs` folder
-   Connect your application to the **CodeSubmit Movie Database** at `https://wookie.codesubmit.io/movies`
-   For authentication pass the `"Authorization: Bearer Wookie2021"` header
-   Parse the API response and display the results as outlined in the design. **Make sure to group movies by categories**.
-   Implement a detail view for the movies in the list
-   Make sure that opening detail pages works as expected
-   Implement search by connecting to `https://wookie.codesubmit.io/movies?q=<search_term>`

### Bonus
Crawling text on the detail screen - The crawling text should ideally be perspective distorted and animated similarly to the opening of the Star Wars films.

### Deliverables
Make sure to include all source code in the repository. 

### Some nice to haves
##### Some suggestions on frameworks and patterns we use if you want to try them out
- Usage of the Bloc pattern/package: [Link](https://bloclibrary.dev/#/)
- Usage of the Provider pattern/package: [Link](https://docs.flutter.dev/development/data-and-backend/state-mgmt/simple)
- Component decomposition and reusability: [Link](https://itnext.io/atomic-design-with-flutter-11f6fcb62017)

### Evaluation Criteria
-   **Dart** best practices
-   We're looking for you to produce working code, with enough room to demonstrate how to structure components in a small program.
-   Show us your work through your commit history
-   Completeness:did you complete the features?

    ### Correctness: 
    Does the functionality act in sensible, thought-out ways?

    ### Maintainability:
    Is it written in a clean, maintainable way?

    ### Testing:
    Is the system adequately tested?
    You can check [this](https://docs.flutter.dev/cookbook/testing/unit/introduction) out for more info.

### CodeSubmit
Please organize, design, test and document your code as if it were going into production - then push your changes to the master branch. After you have pushed your code, you may submit the assignment on the assignment page.

All the best and happy coding,

The Bash Team


### App architecture (BLoC)
The application is built on BLoC architecture which is a design pattern that separates business logic from UI, promoting a clean, testable, and scalable codebase.
1. UI Layer(Widgets) -> Events(User actions) -> BLoC(Business Logic) -> Data Layer(APIs)

### Get the app running
1. run `flutter pub get`
2. to run the app `flutter run`

### Test Evidence
just in-case the app does not build on your side
https://drive.google.com/file/d/1-7tOgez9jJPdJPjMQOoO8mnT7YeazVZp/view?usp=sharing