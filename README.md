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

![Screenshot 2024-03-22 at 8 19 56 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/98132d1c-1fa0-4e41-b4fb-94aba86ba27c)

after the SDK installation is successful, open AppDelegate.swift and import the SDK. import GoogleSignIn

2. Get an OAuth client ID: app needs an OAuth client ID to identify itself to Google’s authentication backend for or iOS

To create an OAuth client ID in the console: Go to the Google Cloud Platform Console(https://console.cloud.google.com)

then create a new project for our ios app or If you have already created a project, you can also select it from the project list.

![Screenshot 2024-03-22 at 8 23 55 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/087f5857-7195-4fbd-8e61-6aec32f751ae)

If the APIs & services page isn’t already open, open the console left side menu and select APIs & services.

On the left, click Credentials.

Click New Credentials, before choosing OAuth client ID be sure u have selected the right project from the dropdown menu.

![Screenshot 2024-03-22 at 8 31 01 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/b43e1d02-371b-464b-8381-628ba472456f)

Select the appropriate application type for your project and enter any additional information required.

![Screenshot 2024-03-22 at 8 27 52 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/f7524857-1e78-404f-9bd3-90a028b45e33)

Select created OAuth Client Ids from the below images to access Client ID and iOS URL Scheme we need this to configure Xcode.

![Screenshot 2024-03-22 at 8 26 30 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/f77f8ebb-6ee8-4e49-82c7-b9d696982ae0)

![Screenshot 2024-03-22 at 8 34 33 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/06288016-9bb1-4252-8fc8-7ae7e68b3b98)

When you use OAuth 2.0 Client ID for authorization, Google displays a consent screen to the user including a summary of your project, its policies, and the requested authorization scopes of access. Configuring your app’s OAuth consent screen defines what is displayed to users and app reviewers,

so let's configure the OAuth consent screen. To set up your project’s consent screen and request verification:

Go to the Google API Console OAuth consent screen page

Add required information like a product name and support email address.

Once you finished configuring the OAuth consent screen then let's move to Xcode and configure because Google Sign-In requires your project to be configured with your OAuth client ID and a custom URL scheme.

3. Add your OAuth client ID and custom URL scheme

Update your app’s Info.plist file to add your OAuth client ID and a custom URL scheme

![Screenshot 2024-03-22 at 8 39 50 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/ae8164b9-dd42-4d9e-849a-825eecbf0397)

or add in Info.plist → open as → source code and add below in plist Dict.

![Screenshot 2024-03-22 at 8 44 09 AM](https://github.com/KalpeshKalsariya/GoogleLoginDemo/assets/38584779/cfae121a-9959-47d9-8cd5-534ff391adab)

4. Handle the authentication redirect URL: iOS: UIApplicationDelegate

Now open class AppDelegate and import GoogleSignIn Module

In your AppDelegate’s application:openURL:options method, call GIDSignIn's handleURL: method:



    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var handled: Bool
        
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        
        // Handle other custom URL types.
        
        // If not handled by this app, return false.
        return false
    }

5. Attempt to restore the user’s sign-in state:

When your app starts up, call restorePreviousSignInWithCallback to try and restore the sign-in state of users who already signed in using Google. Doing so ensures users don't have to sign in every time they open your app (unless they've signed out).

iOS apps often do this in UIApplicationDelegate's application:didFinishLaunchingWithOptions: method


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
              // Show the app's signed-out state.
            } else {
              // Show the app's signed-in state.
            }
          }
        
        return true
    }


