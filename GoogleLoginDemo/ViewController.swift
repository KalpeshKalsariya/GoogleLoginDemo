//
//  ViewController.swift
//  GoogleLoginDemo
//
//  Created by  Kalpesh on 22/03/24.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    //MARK:  @IBOutlet
    @IBOutlet weak var btnGoogleSignIn: UIButton?
    @IBOutlet weak var btnGoogleSignOut: UIButton?
    @IBOutlet weak var lblSignInStatus: UILabel?
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }


}
//MARK: @IBAction
extension ViewController {
    @IBAction func btnGoogleSingInDidTap(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            self.btnGoogleSignIn?.isHidden = false
            self.btnGoogleSignOut?.isHidden = true
            self.lblSignInStatus?.text = "Welcome To GoogleSignIn! To continue with GoogleSignIn please hit below button. "
            guard error == nil else { return }

          // If sign in succeeded, display the app's main content View.
            guard let signInResult = signInResult else { return }
            let user = signInResult.user

            let emailAddress = user.profile?.email

            let fullName = user.profile?.name
            let givenName = user.profile?.givenName
            let familyName = user.profile?.familyName
            
            self.btnGoogleSignIn?.isHidden = true
            self.btnGoogleSignOut?.isHidden = false
            self.lblSignInStatus?.text = "Hi \(fullName ?? "")"
            
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            guard let profilePicUrl = user.profile?.imageURL(withDimension: 320) else {
                // Handle the case where the profile picture URL is not available
                return
            }

            // Create a URL session to download the image data
            let session = URLSession.shared
            let task = session.dataTask(with: profilePicUrl) { data, response, error in
                // Check if there's an error
                if let error = error {
                    print("Error downloading profile picture: \(error.localizedDescription)")
                    return
                }

                // Check if data is available
                guard let imageData = data else {
                    print("No data received for profile picture")
                    return
                }

                // Create an image from the data
                if let image = UIImage(data: imageData) {
                    // Assign the image to the UIImageView on the main thread
                    DispatchQueue.main.async {
                        self.imgProfile.image = image
                    }
                } else {
                    print("Failed to create image from data")
                }
            }
            task.resume()
            
            
             
        }
    }
    
    @IBAction func btnGoogleSignOutDidTap(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
    }
}
