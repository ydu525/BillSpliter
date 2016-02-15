//
//  FriendBillsTableCell.m
//  BillSpliter
//
//  Created by yan du on 2/18/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FriendBillsTableCell.h"

@implementation FriendBillsTableCell

@synthesize eventNameLabel;
@synthesize billAmountLabel;
@synthesize totalAmountLabel;
@synthesize timeLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass(self);
}

- (NSString *)reuseIdentifier
{
    return [[self class] reuseIdentifier];
}



@end
