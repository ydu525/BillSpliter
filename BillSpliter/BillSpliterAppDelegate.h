//
//  BillSpliterAppDelegate.h
//  BillSpliter
//
//  Created by yan du on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

@class BillSpliterViewController;

@interface BillSpliterAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BillSpliterViewController *viewController;
@property (strong, nonatomic) UINavigationController *navController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(BOOL)createNewFriendWithName:(NSString *)paramName
                         email:(NSString *)paramEmail
                     firstName:(NSString *)paramFirstName
                      lastName:(NSString *)paramLastName;
-(NSMutableArray *)loadAllFriends;
-(void)deleteFriendWithName:(Friend *)paramObj;
-(BOOL)createNewBillWithName:(NSString *)paramName
                        Date:(NSDate *)paramDate
                      Amount:(NSNumber *)paramAmount
                 TotalAmount:(NSNumber *)paramTotalAmount
                      Status:(NSString *)paramStatus
              FKBillToFriend:(Friend *)paramFKBillToFriend;
-(NSMutableArray *)loadAllBillsWithFriend:(Friend *)paramFriend;
-(void)deleteBill:(Bill *)paramBill;

@end
