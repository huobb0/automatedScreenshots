//
//  AppDelegate.m
//  automatedScreenshotApp
//
//  Created by Zsombor on 2018. 12. 29..
//  Copyright © 2018. Zsombor. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (weak, nonatomic) IBOutlet UIImageView *BackgroundImage;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _BackgroundImage.hidden = YES;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSLog(@"resign invoked");
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[self.window frame]];
    imageView.tag = 1234;
    [imageView setImage:[UIImage imageNamed:@"smiley.png"]];
    [self.window addSubview:imageView];
    
    // fill screen with our own colour
    /*UIView *colourView = [[UIView alloc]initWithFrame:self.window.frame];
    colourView.backgroundColor = [UIColor whiteColor];
    colourView.tag = 1234;
    colourView.alpha = 0;
    [self.window addSubview:colourView];
    [self.window bringSubviewToFront:colourView];
    
    // fade in the view
    [UIView animateWithDuration:0.5 animations:^{
        colourView.alpha = 1;
    }];*/
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // grab a reference to our coloured view
    UIView *colourView = [self.window viewWithTag:1234];
    
    // fade away colour view from main view
    [UIView animateWithDuration:0.5 animations:^{
        colourView.alpha = 0;
    } completion:^(BOOL finished) {
        // remove when finished fading
        [colourView removeFromSuperview];
    }];

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
