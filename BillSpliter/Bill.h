//
//  Bill.h
//  BillSpliter
//
//  Created by yan du on 10/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friend;

@interface Bill : NSManagedObject

@property (nonatomic, retain) NSNumber * billAmount;
@property (nonatomic, retain) NSDate * billDate;
@property (nonatomic, retain) NSString * billName;
@property (nonatomic, retain) NSString * billStatus;
@property (nonatomic, retain) NSNumber * billTotalAmount;
@property (nonatomic, retain) Friend *fkBillToFriend;

@end
