//
//  Friend.h
//  BillSpliter
//
//  Created by yan du on 10/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bill, User_Info;

@interface Friend : NSManagedObject

@property (nonatomic, retain) NSString * friendEmail;
@property (nonatomic, retain) NSString * friendName;
@property (nonatomic, retain) NSString * friendFirstName;
@property (nonatomic, retain) NSString * friendLastName;
@property (nonatomic, retain) NSSet *fkFriendToBill;
@property (nonatomic, retain) User_Info *fkFriendToUser;
@end

@interface Friend (CoreDataGeneratedAccessors)

- (void)addFkFriendToBillObject:(Bill *)value;
- (void)removeFkFriendToBillObject:(Bill *)value;
- (void)addFkFriendToBill:(NSSet *)values;
- (void)removeFkFriendToBill:(NSSet *)values;

@end
