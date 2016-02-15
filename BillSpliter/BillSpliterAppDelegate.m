//
//  BillSpliterAppDelegate.m
//  BillSpliter
//
//  Created by yan du on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BillSpliterAppDelegate.h"
#import "BillSpliterViewController.h"
#import "User_Info.h"
#import "Friend.h"
#import "Bill.h"

@implementation BillSpliterAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navController;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[BillSpliterViewController alloc] initWithNibName:@"BillSpliterViewController" bundle:nil] autorelease];
    [self.viewController signAppDelegate:self];
    self.window.rootViewController = self.viewController;
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:self.navController.view];
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil) {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"BillSpliter" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"BillSpliter.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(BOOL)createNewUserWithUserName:(NSString *)paramUserName
                        Password:(NSString *)paramPassword
                           email:(NSString *)paramEmail{
    BOOL result = NO;
    
    User_Info *newUser = [NSEntityDescription
                          insertNewObjectForEntityForName:@"User_info" 
                          inManagedObjectContext:self.managedObjectContext];
    
    if (newUser == nil) {
        NSLog(@"Failed to create the new user");
        return NO;
    }
    
    newUser.userName = paramUserName;
    newUser.userPassword = paramPassword;
    newUser.userEmail = paramEmail;
    
    NSError *savingError = nil;
    
    if([self.managedObjectContext save:&savingError]){
        return YES;
    } else {
        NSLog(@"Failed to save the new User. Error = %@", savingError);
    }
    
    return result;
}

-(BOOL)createNewFriendWithName:(NSString *)paramName
                         email:(NSString *)paramEmail
                     firstName:(NSString *)paramFirstName
                      lastName:(NSString *)paramLastName{
    BOOL result = NO;
    
     Friend *newFriend = [NSEntityDescription
                          insertNewObjectForEntityForName:@"Friend" 
                          inManagedObjectContext:self.managedObjectContext];
    
    if (newFriend == nil) {
        NSLog(@"Failed to create the new friend");
        return NO;
    }
    
    newFriend.friendName = paramName;
    newFriend.friendEmail = paramEmail;
    newFriend.friendFirstName = paramFirstName;
    newFriend.friendLastName = paramLastName;
    
    NSError *savingError = nil;
    
    if([self.managedObjectContext save:&savingError]){
        return YES;
    } else {
        NSLog(@"Failed to save the new Friend. Error = %@", savingError);
    }
    
    return result;
}

-(NSMutableArray *)loadAllFriends{
    NSMutableArray *returnFriends = [[NSMutableArray alloc] init];
    /*fetch request*/
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    /*entity we want to fetch*/
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Friend" inManagedObjectContext:self.managedObjectContext];
    
    /*tell the fetch request*/
    [fetchRequest setEntity:entity];
    
    NSError *requestError = nil;
    
    /*execute the fetch*/
    NSArray *friends = [self.managedObjectContext executeFetchRequest:fetchRequest error:&requestError];
    
    /*check the array*/
    if([friends count] > 0)
    {
        for (Friend *thisFriend in friends) {
            [returnFriends addObject:thisFriend];
        }
    } else {
        NSLog(@"Counld not find any Person entities in the context.");
    }
    
    [fetchRequest release];
    
    return returnFriends;
}

-(void)deleteFriendWithName:(Friend *)paramObj{
    [self.managedObjectContext deleteObject:paramObj];
    NSError *requestError = nil;
    if (![self.managedObjectContext save:&requestError])
    {
        NSLog(@"Problem deleting destination: %@", [requestError localizedDescription]);
    }
    if ([paramObj isDeleted]) {
        NSLog(@"success");
    }
}

-(BOOL)createNewBillWithName:(NSString *)paramName Date:(NSDate *)paramDate Amount:(NSNumber *)paramAmount TotalAmount:(NSNumber *)paramTotalAmount Status:(NSString *)paramStatus FKBillToFriend:(Friend *)paramFKBillToFriend{
    BOOL result = NO;
    
    Bill *newBill = [NSEntityDescription
                         insertNewObjectForEntityForName:@"Bill" 
                         inManagedObjectContext:self.managedObjectContext];
    
    if (newBill == nil) {
        NSLog(@"Failed to create the new bill");
        return NO;
    }
    
    newBill.billName = paramName;
    newBill.billDate = paramDate;
    newBill.billStatus = paramStatus;
    newBill.billTotalAmount = paramTotalAmount;
    newBill.billAmount = paramAmount;
    newBill.fkBillToFriend = paramFKBillToFriend;
    
    NSError *savingError = nil;
    
    if([self.managedObjectContext save:&savingError]){
        return YES;
    } else {
        NSLog(@"Failed to save the new Bill. Error = %@", savingError);
    }
    
    return result;
}

//-(NSMutableArray *)loadAllBillsWithFriend:(Friend *)paramFriend




@end
