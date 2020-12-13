![HealthMonitor](https://socialify.git.ci/yashk2000/HealthMonitor/image?description=1&descriptionEditable=Remote%20testing%20made%20easy&font=Raleway&forks=1&language=1&pattern=Charlie%20Brown&stargazers=1&theme=Light)

# Health Monitor
An app build to allow people to carry out preliminary health assessments at the comfort of their homes using their mobile/laptop.

## 👨‍🏭  Who are we?
This project was built by [Rachit Gupta](https://github.com/dotrachit), [Sakshi Rambhia](https://github.com/Sakshi16), [Rohan Rout](https://github.com/routrohan) and [Yash Khare](https://github.com/yashk2000).

## 💻 What did we use?
The webapp has been built using [ReactJS](https://reactjs.org/) and styled with [React Bootstrap](https://react-bootstrap.github.io/) and the mobile app is built with [Flutter](https://flutter.dev/)

## 🛠️ Setting up the Project
### For setting up the webapp:
1) Clone the repository
- `git clone https://github.com/yashk2000/HealthMonitor.git`
2) Move into the project root
- `cd HealthMonitor`
3) Move into the frontend folder
- `cd website/frontend`
4) Install the dependencies
- `npm install`
5) Start the local server
- `npm start`

### Setting up the mobile app:

The mobile app is in progress, and is being built using flutter. 

First enter the `healthmonitor_mobile` folder. 
- `cd healthmonitor_mobile`

To build it, you need to have Flutter installed. Refer to the official docs provided by Flutter over [here](https://flutter.dev/docs/get-started/install) and install it for your operating system. 

Once you're done, you can open up the application in your preferred editor. The best way to go would be to use Android Studio, but you can use any other editor such as VS Code as well. 

The next step would be to enter the application directory and run the following command to fetch the dependencies. 

```
flutter pub get
```

If you're using Android Studio, you can directly use the green play button to install the app on your device or an emulator. Else, you need to run the following command: 

```
flutter run
```

This will run the application either on a physical device you'll have connected to your system or on an emulator that has been set up. 

Other useful links: 

- [Download Android Studio](https://developer.android.com/studio)
- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- For help getting started with Flutter, view the Flutter [online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## :wrench: The backend

The backend is deployed here: [https://health-monitor-mlh.herokuapp.com/](https://health-monitor-mlh.herokuapp.com/)

The two endpoints: 

- /spo
- /hr

Both require POST API calls and the json body should contain the base64 strings of the images attached to one after the another separated by a semicolon only

- **/spo** returns the SpO2 value if the images contain fingers pointed at the camera. If not, or if the image isnt that clear it;'ll return "Finger not recognised"

- **/hr** returns both heart rate and respiratory rate separated by a space (ex: (72,18)) the requirement for this is face in the image. If its not visible it'll return "Face no recognised".

## 📜 License
This project is released under a free and open-source software license, Apache License 2.0 or later ([LICENSE](LICENSE) or https://www.apache.org/licenses/LICENSE-2.0). The documentation is also released under a free documentation license, namely the [GFDL v1.3](https://www.gnu.org/licenses/fdl-1.3.en.html) license or later.

### 🖊️ Contributions
Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the work by you, as defined in the Apache-2.0 license, shall be licensed as above, without any additional terms or conditions.
