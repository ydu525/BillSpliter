//
//  FriendDetailsViewController.m
//  BillSpliter
//
//  Created by yan du on 10/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FriendDetailsViewController.h"
#import "BillSpliterAppDelegate.h"
#import "Friend.h"
#import "Bill.h"
#import "FriendBillsTableCell.h"

@interface FriendDetailsViewController ()

@end

@implementation FriendDetailsViewController

@synthesize firstNameLabel;
@synthesize lastNameLabel;
@synthesize emailLabel;

@synthesize billsTable;

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil
          appDelegate:(BillSpliterAppDelegate *)paramAppDelegate
        choosedFriend:(Friend *)paramFriend
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = paramAppDelegate;
        choosedFriend = paramFriend;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=choosedFriend.friendName;
	// Do any additional setup after loading the view.
    firstNameLabel.text = choosedFriend.friendFirstName;
    lastNameLabel.text = choosedFriend.friendLastName;
    emailLabel.text = choosedFriend.friendEmail;
    
    //billsArray = [[NSArray alloc] init];
    
    billsArray =  [choosedFriend.fkFriendToBill allObjects];
    
    self.billsTable.delegate = self;
    self.billsTable.dataSource = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];   //it hides  
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];    // it shows
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
 * delete friend from the database
 */
-(void)handleDelete
{
    [appDelegate deleteFriendWithName:choosedFriend];
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[choosedFriend.fkFriendToBill allObjects] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *SimpleTableIdentifier = @"FriendBillsTableCell";
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    FriendBillsTableCell *cell = (FriendBillsTableCell *) [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];

    
    //if (cell == nil) {
    //    cell = [[[FriendBillsTableCell alloc]
    //             initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier] autorelease];
    //}
    
    if(!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FriendBillsTableCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    
    NSUInteger row = [indexPath row];
    Bill *aBill = [[choosedFriend.fkFriendToBill allObjects] objectAtIndex:row];
    
    cell.eventNameLabel.text = aBill.billName;

    double tempAmount = [aBill.billAmount doubleValue];
    NSString *individualAmount = [NSString stringWithFormat:@"%.2f",tempAmount]; 
    
    cell.billAmountLabel.text = individualAmount;
    
    double tempTotalAmount = [aBill.billTotalAmount doubleValue];
    NSString *totalAmount = [NSString stringWithFormat:@"%.2f",tempTotalAmount]; 
    
    cell.totalAmountLabel.text = totalAmount;
    
    //cell.timeLabel.text = [abill.billDate ];

    
    return cell;
}

@end
