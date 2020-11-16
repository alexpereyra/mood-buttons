# Creating a ios app for mood buttons

## Resources

- [Skillshare - Learn Flutter and Build Android & iOS Apps From Scratch](https://www.skillshare.com/classes/Learn-Flutter-and-Build-Android-iOS-Apps-From-Scratch/928312980/projects?via=custom-lists)
- [Flutter](https://flutter.dev/)
- [Flutter on Docker](https://blog.codemagic.io/how-to-dockerize-flutter-apps/) [github](https://github.com/sbis04/flutter_docker)
- [Enabling developer mode on iphone](https://www.wikihow.com/Enable-Developer-Mode-on-an-iPhone)

### Steps to install flutter

- Go to `https://flutter.dev/docs/get-started/install/macos` and download for your OS
- Move unzipped Flutter to desired location
- [Add flutter to PATH](https://flutter.dev/docs/get-started/install/macos#update-your-path)
`export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"`
- [Install Android Studio](https://developer.android.com/studio/install) and Flutter plugin
- Validate SDK tools & platforms
- Install [xcode](https://flutter.dev/docs/get-started/install/macos)
- Create virtual device via AVD manager in Andriod Studio. Test to ensure Emulator launches.
- For iOS simulator. Install xcode via app store.
- Install cocopods flutter dependency for iOS
`sudo gem install cocoapods`

- Install [Homebrew](https://brew.sh/).
**Note: Failed with permissions error**
Need to reset perssmiions to /user/local.
`sudo chown -R `whoami` /usr/local` # note to uninstall and cleanup homebrew if it is currently installed.
Ref [stackoverflow](https://stackoverflow.com/questions/26519394/permissions-error-while-installing-homebrew)

###
- Install SDK
brew cask install android-platform-tools

### [Build and release an iOS app](https://flutter.dev/docs/deployment/ios)
