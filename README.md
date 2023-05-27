# nasa_images

A Flutter project to demostrate the fetching data from the nasa api.

![ezgif-3-95047899e1](https://github.com/enadun/nasa_image/assets/4685388/b79ea651-8dc3-4375-ae53-3d5dd0353003)


## Getting Started

First of all get an api_key from [NASA API.](https://api.nasa.gov/)
Then crate a `.env` file in the root of the project and add your api_key there.

`API_KEY = 'your_api_key'`

![Screenshot of adding .env file](https://github.com/enadun/nasa_image/assets/4685388/851b93b1-2101-4520-b485-8b8186f2d909)

Then create a new project on [Firbase](https://console.firebase.google.com/) and enable the [Annonymously loging](https://firebase.google.com/docs/auth/flutter/anonymous-auth) feature.

Make sure to put the `google-services.json` file in [Android](https://firebase.google.com/docs/android/setup#add-config-file) project and `GoogleService-Info.plist` in [iOS](https://firebase.google.com/docs/ios/setup#add-config-file) project.

![Screenshot of adding GoogleService-Info.plist file](https://github.com/enadun/nasa_image/assets/4685388/8dc386e0-746f-4353-9ab0-efac6cc643a0)

Than go the root of flutter project in terminal and run the `flutter run` command.
