//
//  BuiltErrorCodes.h
//  builtDemo
//
//  Created by Akshay Mhatre on 04/06/13.
//  Copyright (c) 2013 raweng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuiltErrorCodes : NSObject

extern NSInteger const kErrorUnauthorizedAccess;
extern NSInteger const kErrorForgotPasswordUserNotFound;
extern NSInteger const kErrorApplicationNotFound;
extern NSInteger const kErrorInvalidClass;
extern NSInteger const kErrorObjectCreateFailed;
extern NSInteger const kErrorInvalidObjectClassUid;
extern NSInteger const kErrorObjectUpdateFailed;
extern NSInteger const kErrorObjectDeleteFailed;
extern NSInteger const kErrorObjectUpsertFailed;
extern NSInteger const kErrorNotificationCreateFailed;
extern NSInteger const kErrorNotificationDeleteFailed;
extern NSInteger const kErrorInvalidNotification;
extern NSInteger const kErrorAppUserCreateFailed;
extern NSInteger const kErrorAppUserUpdateFailed;
extern NSInteger const kErrorAppUserDeleteFailed;
extern NSInteger const kErrorAppUserNotFound;
extern NSInteger const kErrorAppUserLoggedInFailed;
extern NSInteger const kErrorAppUserLoggedOutFailed;
extern NSInteger const kErrorAccessDenied;
extern NSInteger const kErrorNotificationCredentialsCreateFailed;
extern NSInteger const kErrorNotificationCredentialsUpdateFailed;
extern NSInteger const kErrorInstallationNotCreated;
extern NSInteger const kErrorInstallationNotUpdated;
extern NSInteger const kErrorInstallationFailedSubscribe;
extern NSInteger const kErrorInstallationFailedUnsubscribe;
extern NSInteger const kErrorChannelsNotProvidedForSubUnsub;
extern NSInteger const kErrorInvalidParameters;
extern NSInteger const kErrorUploadCreateFailed;
extern NSInteger const kErrorUploadUpdateFailed;
extern NSInteger const kErrorUploadDeleteFailed;
extern NSInteger const kErrorUploadNotFound;
extern NSInteger const kErrorAppUserInvalidActivationToken;
extern NSInteger const kErrorAppUserInvalidEmail;
extern NSInteger const kErrorAppUserResetPasswordFail;
extern NSInteger const kErrorAppSettingsFail;
extern NSInteger const kErrorApplicationUsersDeleteAll;
extern NSInteger const kErrorCustomNotificationNotFound;
extern NSInteger const kErrorCustomNotificationNotCreated;
extern NSInteger const kErrorCustomNotificationNotUpdated;
extern NSInteger const kErrorAppUserAclAccessDenied;
extern NSInteger const kErrorMarkerCreateFailed;
extern NSInteger const kErrorMarkerUpdateFailed;
extern NSInteger const kErrorMarkerDeleteFailed;
extern NSInteger const kErrorInvalidMarker;
extern NSInteger const kErrorEventCreationFailed;
extern NSInteger const kErrorAppUserUidRetrieveFailed;
extern NSInteger const kErrorUserUidRetrieveFailed;
extern NSInteger const kErrorUploadDefaultAclUpdateFailed;
extern NSInteger const kErrorAppUserAccountInactive;
extern NSInteger const kErrorAppUserRegisterEmailTaken;
extern NSInteger const kErrorAppUserRegisterPasswordInvalid;
extern NSInteger const kErrorInternalServerError;
extern NSInteger const kErrorNotFoundError;
extern NSInteger const kErrorAccountNameBlank;
extern NSInteger const kErrorClassUidBlank;
extern NSInteger const kErrorInvalidApiKey;
extern NSInteger const kErrorDeleteUserNotFound;
extern NSInteger const kErrorRegistrationNotCreated;
extern NSInteger const kErrorRegistrationNotUpdated;
extern NSInteger const kErrorRegistrationNotFound;
extern NSInteger const kErrorApiLimitReached;

extern NSString *const kTwitterErrorDomain;

@end

