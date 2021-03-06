//
//  AppDelegate.m
//  PushNotificationTutorial

//***********************************************************************************************************
// This app demonstrates the function of Push Notification through Built.io Backend's BuiltInstallation class.
// BuiltInstallation allows to create/update/delete channels.
// User has to have a valid certificate with support for push notification enabled.
//***********************************************************************************************************

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
#ifdef __IPHONE_8_0
    [application registerUserNotificationSettings:([UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge| UIUserNotificationTypeAlert | UIUserNotificationTypeSound) categories:nil])];
#else
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound];
#endif
    //***********************************************************************************************************
    // Initialize Built class with your application's API-KEY
    self.builtApplication = [Built applicationWithAPIKey:@"<api-key-here>"];
    //***********************************************************************************************************
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    ViewController *VC = [[ViewController alloc]initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]  initWithRootViewController:VC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Clears out all notifications from Notification Center.
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    // Clears badge count on the app icon
    [[self.builtApplication currentInstallation] clearBadge];
    
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"token %@",deviceToken);
    BuiltInstallation *installation = [self.builtApplication installation];
    installation.deviceToken = [[NSString alloc] initWithData:deviceToken encoding:NSUTF8StringEncoding];
    //***********************************************************************************************************
    // BuiltInstallation createInstallationWithDeviceTokenandSubscriptionChannels method allows to create installation channel for deviceToken.
    // We have to pass the device token that is returned upon registering your device with APNS server.
    // We must remember that push notifications does not work with iOS simulator. So an iOS device is necessary to test push notification.
    //***********************************************************************************************************
    [installation createInstallationInBackgroundWithSubscriptionChannels:@[@"userphoto.object.create"] completion:^(ResponseType responseType, NSError *error) {
        
    }];
    
    //subcscribe to receive notifications whenever an object is created in userphoto class.
    //    [installation subscribeToChannelsInBackground:@[@"userphoto.object.create"] completion:^(ResponseType responseType, NSError *error) {
    //        if (error == nil) {
    //            NSLog(@"subscribeToChannels ");
    //        }else {
    //            NSLog(@"subscribeToChannels error %@",error);
    //        }
    //    }];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError %@",error);
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"didReceiveRemoteNotification %@",userInfo);
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
               
    [alertView show];
}

@end
