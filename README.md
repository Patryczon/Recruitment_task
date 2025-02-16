# Sofomo Task

## Overview

This application is based on the public API of GitHub, works on Web, iOS and Android and allows you
to:

1. Search for repositories based on the given keywords.
2. Present details related to a selected repository (form and amount of data are arbitrary).
3. Present a list of open issues or PRs for the selected repository.

## How it works

- **iOS**
  ![iOS](./gifs/ios_app.gif)
- **Android**
  ![iOS](./gifs/android_app.gif)
- **Web**
  ![iOS](./gifs/web_app.gif)

## Tech Stack

- **Framework:** Flutter
- **API:** GitHub API
- **State Management:** BLoC
- **Service locator and dependency injection:** get_it and injectable
- **Testing:** Flutter Test, Mockito, golden_toolkit

## How to Run the Application

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/sofomo_task.git
    cd sofomo_task
    ```
2. Install dependencies:
    ```bash
    flutter pub get
    ```
3. Run the application:
    ```bash
    flutter run
    ```

## How to Run Tests

1. Run the tests:
    ```bash
    flutter test
    ```
## How to Run code generation
1. Run the code generation:
    ```bash
    flutter pub run build_runner build
    ```
## License

This project is licensed under the MIT License.

## Contact

For any inquiries, please contact [patrykgalazka96@gmail.com].

