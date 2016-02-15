//
//  FriendDetailsViewController.h
//  BillSpliter
//
//  Created by yan du on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillSpliterAppDelegate.h"
#import "Friend.h"

@interface FriendDetailsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UILabel *firstNameLabel;
    IBOutlet UILabel *lastNameLabel;
    IBOutlet UILabel *emailLabel;
    
    IBOutlet UITableView *billsTable;
    
    BillSpliterAppDelegate *appDelegate;
    Friend *choosedFriend;
    NSArray *billsArray;
}

@property (nonatomic, retain) UILabel *firstNameLabel;
@property (nonatomic, retain) UILabel *lastNameLabel;
@property (nonatomic, retain) UILabel *emailLabel;

@property (nonatomic, retain) UITableView *billsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
          appDelegate:(BillSpliterAppDelegate *)paramAppDelegate
        choosedFriend:(Friend *)paramFriend;

-(IBAction)handleDelete;

@end
