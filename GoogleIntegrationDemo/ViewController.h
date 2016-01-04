//
//  ViewController.h
//  GoogleIntegrationDemo
//
//  Created by Krishana on 12/29/15.
//  Copyright © 2015 Konstant Info Solutions Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
#import <Google/Analytics.h>
#import <SafariServices/SafariServices.h>



@interface ViewController : UIViewController<GIDSignInUIDelegate,SFSafariViewControllerDelegate>

@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

@end

