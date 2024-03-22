# GoogleLoginDemo

1. Add Google Sign-in SDK into our iOS project:
Here we need to add all required dependencies using CocoaPods or Swift Package Manager.

let's add Google Sign-in SDK using Swift Package Manager: 
The Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

install swift packages directly into your project as follows.

Open Xcode then Select file → Select Add packages… option:

refer to the below image:

![Screenshot 2024-03-22 at 8 13 28 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/87793223-eb1b-4f42-9e1d-3a9a1513896f)

A new window will open → searchdependency url → select searched dpendency and add package.

Repository URL: https://github.com/google/GoogleSignIn-iOS

![Screenshot 2024-03-22 at 8 15 01 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/48242cef-6ea6-47cd-a1e8-7d3f8ee8f85c)

after verifying Google sign-in: choose the package product and then add the package. After adding dependency your project looks like this

![Screenshot 2024-03-22 at 8 17 11 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/a7f1717c-ce54-4757-a541-06c57a63781b)

after the SDK installation is successful, open AppDelegate.swift and import the SDK. import GoogleSignIn
