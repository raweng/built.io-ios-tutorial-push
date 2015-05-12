//
//  BuiltUserPresence.h
//  BuiltIO
//
//  Created by Reefaq on 04/02/15.
//  Copyright (c) 2015 raweng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PresenceStatus) {
    PresenceStatusOffline,
    PresenceStatusOnline
};

typedef NS_ENUM(NSUInteger, PresencePrivacyType) {
    PresencePrivacyTypePrivate,
    PresencePrivacyTypePublic
};

@class BuiltUser;

@interface BuiltUserPresence : NSObject
/**
Online and Offline status of the user.

     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     if (presence.status == PresenceStatusOnline) {
        //user is online
     }else {
        //user is offline
     }
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     if (presence.status == PresenceStatus.Online) {
        //user is online
     }else {
        //user is offline
     }
 
 */
@property (nonatomic, assign, readonly) PresenceStatus status;
/**
Last seen timestamp of the user.

     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     NSDate *lastSeen = presence.lastSeen;
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     var lastSeen:NSDate = presence.lastSeen()
 
 */
@property (nonatomic, copy, readonly) NSDate* lastSeen;

/**
Pending users array requested for presence access.

     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     NSArray *usersRequestedForPresence = presence.requests;
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     var usersRequestedForPresence:NSArray = presence.requests()

 
 */
@property (nonatomic, copy, readonly) NSArray* requests;

/**
Enable or disable presence. If disabled user presence will not to shown to others.
 
     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     presence.enable = YES;
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     presence.enable = true

 
 */
@property (nonatomic, assign) BOOL enable;

/**
Type of Privacy i.e Public or Private.
 
     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     presence.privacyType = PresencePrivacyTypePublic;
 
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     presence.privacyType = PresencePrivacyType.Public;

 
 */
@property (nonatomic, assign) PresencePrivacyType privacyType;

/**
Status message of the user if present.
 
     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     presence.statusMessage = @"Hello built.io";
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     presence.statusMessage = "Hello built.io"

 
 */
@property (nonatomic, copy) NSString* statusMessage;

/**
List of users allowed for presence

     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     NSArray *whitelistUsers = [presence whitelistUsers];
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     var whitelistUsers:NSArray = presence.whitelistUsers()

 
@return array of users's uid
 */
-(NSArray*)whitelistUsers;

/**
Add user in whitelist
 
     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     BuiltUser *otherUserObject = [builtApplication userWithUID:@"blt5dsamplef62a111a"];
 
     [presence addUserInWhiteList:otherUserObject];
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     var otherUserObject:BuiltUser = builtApplication.userWithUID("blt5dsamplef62a111a")
 
     presence.addUserInWhiteList(otherUserObject)
 
 
@param user BuiltUser object to add in whitelist
 */
-(void)addUserInWhiteList:(BuiltUser*)user;

/**
Remove user from whitelist
 
     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     BuiltUser *userObjectToRemove = [builtApplication userWithUID:@"blt5dsamplef62a111a"];
     
     [presence removeUserFromWhiteList:userObjectToRemove];
     
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     var userObjectToRemove:BuiltUser = builtApplication.userWithUID("blt5dsamplef62a111a")
     
     presence.removeUserFromWhiteList(userObjectToRemove)


@param user BuiltUser object to remove in whitelist
 */
-(void)removeUserFromWhiteList:(BuiltUser*)user;

/**
Save presence
 
     //Obj-C
     BuiltUserPresence *presence = [userObject presence];
     [presence saveOnCompletion:^(NSError *error) {
         if (error) {
            //some error occured while saving
         }else {
            //presence saved
         }
     }];
 
     //Swift
     var presence:BuiltUserPresence = userObject.presence()
     builtApplication.currentUser.presence.saveOnCompletion { (error) -> Void in
         if (error != nil) {
            //some error occured while saving presence
         }else {
            //presence saved
         }
     }
 
@param completionBlock block called once save is completed. error object present if occured
 */
- (void)saveOnCompletion:(void (^) (NSError *error))completionBlock;

@end
