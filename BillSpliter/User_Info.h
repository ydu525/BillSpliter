//
//  User_Info.h
//  BillSpliter
//
//  Created by yan du on 10/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface User_Info : NSManagedObject

@property (nonatomic, retain) NSString * userEmail;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userPassword;
@property (nonatomic, retain) NSSet *fkUserToFriend;
@end

@interface User_Info (CoreDataGeneratedAccessors)

- (void)addFkUserToFriendObject:(Friend *)value;
- (void)removeFkUserToFriendObject:(Friend *)value;
- (void)addFkUserToFriend:(NSSet *)values;
- (void)removeFkUserToFriend:(NSSet *)values;

@end
