//
//  AppDelegate.h
//  GoogleIntegrationDemo
//
//  Created by Krishana on 12/29/15.
//  Copyright © 2015 Konstant Info Solutions Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
#import <Google/Analytics.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

