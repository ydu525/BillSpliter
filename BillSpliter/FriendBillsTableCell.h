//
//  FriendBillsTableCell.h
//  BillSpliter
//
//  Created by yan du on 2/18/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendBillsTableCell : UITableViewCell
{
    IBOutlet UILabel *eventNameLabel;
    IBOutlet UILabel *billAmountLabel;
    IBOutlet UILabel *totalAmountLabel;
    IBOutlet UILabel *timeLabel;
    
}

@property (nonatomic, retain) UILabel *eventNameLabel;
@property (nonatomic, retain) UILabel *billAmountLabel;
@property (nonatomic, retain) UILabel *totalAmountLabel;
@property (nonatomic, retain) UILabel *timeLabel;


@end
