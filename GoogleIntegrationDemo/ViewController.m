//
//  ViewController.m
//  GoogleIntegrationDemo
//
//  Created by Krishana on 12/29/15.
//  Copyright © 2015 Konstant Info Solutions Pvt. Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [GIDSignIn sharedInstance].uiDelegate = self;
    // Uncomment to automatically sign in the user.
    //[[GIDSignIn sharedInstance] signInSilently];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    label.center = self.view.center;
    NSString *localizedString = [NSString localizedStringWithFormat:NSLocalizedString(@"%d file(s) remaining", @"Message shown for remaining files"), 2];
    label.text = localizedString;
//    label.text = NSLocalizedString(@"label", nil);
    [self.view addSubview:label];
}

-(void) viewWillAppear:(BOOL)animated
{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"MainView"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

// Stop the UIActivityIndicatorView animation that was started when the user
// pressed the Sign In button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error
{
    //[myActivityIndicator stopAnimating];
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapSignOut:(id)sender
{
    [[GIDSignIn sharedInstance] signOut];
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Success" message:@"User logged out" preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
//    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

-(IBAction)shareBtnAction:(id)sender
{
//    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"kipl" ofType:@"png"];
//    NSURL *imgUrl = [NSURL fileURLWithPath:urlStr];
//    [self showGooglePlusShare:imgUrl];

    [self showGooglePlusShare:[NSURL URLWithString:@"http://www.krishnadattshukla.branded.me"]];
}

- (void)showGooglePlusShare:(NSURL*)shareURL
{
    
    // Construct the Google+ share URL
    NSURLComponents* urlComponents = [[NSURLComponents alloc]
                                      initWithString:@"https://plus.google.com/share"];
    urlComponents.queryItems = @[[[NSURLQueryItem alloc]
                                  initWithName:@"url"
                                  value:[shareURL absoluteString]]];
    NSURL* url = [urlComponents URL];
    
    if ([SFSafariViewController class]) {
        // Open the URL in SFSafariViewController (iOS 9+)
        SFSafariViewController* controller = [[SFSafariViewController alloc]
                                              initWithURL:url];
        controller.delegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        // Open the URL in the device's browser
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
