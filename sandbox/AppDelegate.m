//
//  AppDelegate.m
//  sandbox

//***********************************************************************************************************
// This app demonstrates the function of Push Notification through built.io 's BuiltInstallation class.
// BuiltInstallation allows to create/update/delete channels.
// User has to have a valid certificate with support for push notification enabled.
//***********************************************************************************************************

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound];
    //***********************************************************************************************************
    // Initialize Built class with your application's API-KEY and APP-UID
    [Built initializeWithApiKey:@"<api-key-here>" andUid:@"<app-uid-here>"];
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
    [[BuiltInstallation currentInstallation]clearBadge];
    
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"token %@",deviceToken);
    BuiltInstallation *installation = [BuiltInstallation installation];
    
    //***********************************************************************************************************
    // BuiltInstallation createInstallationWithDeviceTokenandSubscriptionChannels method allows to create installation channel for deviceToken.
    // We have to pass the device token that is returned upon registering your device with APNS server.
    // We must remember that push notifications does not work with iOS simulator. So an iOS device is necessary to test push notification.
    //***********************************************************************************************************

    [installation createInstallationWithDeviceToken:deviceToken andSubscriptionChannels:@[@"userphoto.object.create"] onSuccess:^{
        //installation created successfully
        NSLog(@"Installation Created");
    } onError:^(NSError *error) {
        //there was some error creating an installation
            NSLog(@"Error creating installation %@",error.userInfo);
    }];
    
    //subcscribe to receive notifications whenever an object is created in userphoto class.
    /*
    [installation subscribeToChannels:[NSArray arrayWithObjects:@"userphoto.object.create", nil] onSuccess:^{
        NSLog(@"subscribeToChannels ");
    } onError:^(NSError *error) {
        NSLog(@"subscribeToChannels error %@",error);
    }];
     */
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
