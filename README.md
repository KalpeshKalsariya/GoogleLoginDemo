# GoogleLoginDemo

1. Add Google Sign-in SDK into our iOS project:
Here we need to add all required dependencies using CocoaPods or Swift Package Manager.

let's add Google Sign-in SDK using Swift Package Manager: 
The Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

install swift packages directly into your project as follows.

Open Xcode then Select file → Select Add packages… option:

refer to the below image:

![Screenshot 2024-03-22 at 8 19 34 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/8b23ff41-362c-4479-88f8-209d9118606f)

A new window will open → searchdependency url → select searched dpendency and add package.

Repository URL: https://github.com/google/GoogleSignIn-iOS

![Screenshot 2024-03-22 at 8 19 51 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/8c83c942-92f9-49b4-b1be-81a30e727e9d)

after verifying Google sign-in: choose the package product and then add the package. After adding dependency your project looks like this

![Uploading Screenshot 2024-03-22 at 8.19.56 AM.png…]()

after the SDK installation is successful, open AppDelegate.swift and import the SDK. import GoogleSignIn
