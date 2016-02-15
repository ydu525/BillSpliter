//
//  BillSpliterViewController.m
//  BillSpliter
//
//  Created by yan du on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BillSpliterViewController.h"
#import "BillSpliterAppDelegate.h"
#import "Friend.h"
#import "FriendDetailsViewController.h"

@interface BillSpliterViewController ()

@end

@implementation BillSpliterViewController

@synthesize swipeLeftRecognizer;
@synthesize swipeRightRecognizer;
@synthesize friendButtonsView;
@synthesize addingNewFriendInfoView;

@synthesize friendButton1;
@synthesize friendButton2;
@synthesize friendButton3;
@synthesize friendButton4;

@synthesize cancelNewFriendButton;

@synthesize addingFriendsTable;

@synthesize segmentEvenOrManual;

@synthesize eventNameField;
@synthesize totalAmountField;

@synthesize friendFirstNameText;
@synthesize friendLastNameText;
@synthesize friendNameText;
@synthesize friendEmailText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"main";
    // Do any additional setup after loading the view from its nib.
    self.swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] 
                                initWithTarget:self
                                action:@selector(handleSwipeFrom:)];
    
    self.swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    self.swipeLeftRecognizer.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    
    self.swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] 
                                 initWithTarget:self
                                 action:@selector(handleSwipeFrom:)];
    
    self.swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    self.swipeRightRecognizer.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:swipeRightRecognizer];
    
    friendGroupNum = 0;
    friends = [[NSMutableArray alloc] init];
    friendObjs = [[NSMutableArray alloc] init];
    addingFriends = [[NSMutableArray alloc] init];
   
    self.addingFriendsTable.delegate = self;
    self.addingFriendsTable.dataSource = self;
    
    [addingNewFriendInfoView setHidden:YES];
    
    eventNameField.returnKeyType = UIReturnKeyDone;
    
    totalAmountField.keyboardType = UIKeyboardTypeNumberPad;
    totalAmountField.returnKeyType = UIReturnKeyDone;
    totalAmountField.text = @"0.00";
    
    //[self loadFriendsArray];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.swipeLeftRecognizer = nil;
    self.swipeRightRecognizer = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [self loadFriendsArray]; 
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    UIViewAnimationOptions transitionOption;
    
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        transitionOption = UIViewAnimationOptionTransitionFlipFromRight;
        
        if (friendGroupNum == friendGroupMax) {
            
        } else {
            friendGroupNum++;
            
        [UIView transitionWithView:friendButtonsView 
                          duration:1.0 
                           options:transitionOption 
                        animations:^{
                            [self loadFriendButtons];
                            [friendButtonsView setHidden:NO];
                        }
                        completion:NULL];
        }
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        transitionOption = UIViewAnimationOptionTransitionFlipFromLeft;
        
        if (friendGroupNum==0) {
            
        } else {
        friendGroupNum--;
        
        [UIView transitionWithView:friendButtonsView 
                          duration:1.0 
                           options:transitionOption 
                        animations:^{
                            [self loadFriendButtons];
                            [friendButtonsView setHidden:NO];
                        }
                        completion:NULL];
        }
    }
}

-(void)signAppDelegate:(BillSpliterAppDelegate *) app{
    appDelegate = app;
}

-(void)loadFriendsArray
{
    [friends removeAllObjects];
    [friends addObject:@"ADD"];
    
    [friendObjs removeAllObjects];
    friendObjs = [appDelegate loadAllFriends];
    for (Friend *thisFriend in friendObjs) {
        [friends addObject:thisFriend.friendName];
    }
    friendGroupMax = ([friends count]-1)/4;
    
    [self loadFriendButtons];
}

-(IBAction)loadFriendButtons {

    if (friendGroupNum*4+0<[friends count]) {
        [friendButton1 setTitle:[friends objectAtIndex:friendGroupNum*4+0] 
                       forState:UIControlStateNormal];
        [friendButton1 setHidden:NO];
  }else {
        [friendButton1 setHidden:YES];
    }
    
    if (friendGroupNum*4+1<[friends count]) {
        [friendButton2 setTitle:[friends objectAtIndex:friendGroupNum*4+1] 
                       forState:UIControlStateNormal];
        [friendButton2 setHidden:NO];
    }else {
        [friendButton2 setHidden:YES];
    }
    
    if (friendGroupNum*4+2<[friends count]) {
        [friendButton3 setTitle:[friends objectAtIndex:friendGroupNum*4+2] 
                       forState:UIControlStateNormal];
        [friendButton3 setHidden:NO];
    }else {
        [friendButton3 setHidden:YES];
    }
    
    if (friendGroupNum*4+3<[friends count]) {
        [friendButton4 setTitle:[friends objectAtIndex:friendGroupNum*4+3] 
                       forState:UIControlStateNormal];
        [friendButton4 setHidden:NO];
    }else {
        [friendButton4 setHidden:YES];
    }            
}

-(IBAction)handleFriendButton1Clicked:(id) sender {
    //UIAlertView *alert;
    if([friendButton1.currentTitle isEqualToString:@"ADD"]){
        /*alert =
        [[UIAlertView alloc] initWithTitle:@"ADD!" message:@"ADD" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        [alert release];*/
        [addingNewFriendInfoView setHidden:NO];
        
    }else {
        if (![self checkAddingFriendIsAlreadyAdded:friendButton1.currentTitle]) {
            [addingFriends addObject:friendButton1.currentTitle];
            [addingFriendsTable reloadData];
        }
    }
}

-(IBAction)handleFriendButton2Clicked:(id) sender {
    if (![self checkAddingFriendIsAlreadyAdded:friendButton2.currentTitle]) {
        [addingFriends addObject:friendButton2.currentTitle];
        [addingFriendsTable reloadData];
    }
}

-(IBAction)handleFriendButton3Clicked:(id) sender {
    if (![self checkAddingFriendIsAlreadyAdded:friendButton3.currentTitle]) {
        [addingFriends addObject:friendButton3.currentTitle];
        [addingFriendsTable reloadData];
    }
}

-(IBAction)handleFriendButton4Clicked:(id) sender {
    if (![self checkAddingFriendIsAlreadyAdded:friendButton4.currentTitle]) {
        [addingFriends addObject:friendButton4.currentTitle];
        [addingFriendsTable reloadData];
    }
}

-(IBAction)handleFriendButton1DoubleClicked:(id)sender{
    if(![friendButton1.currentTitle isEqualToString:@"ADD"]){
        [addingFriends removeAllObjects];
        [addingFriendsTable reloadData];
        [self pushDetailViewControllerWithName:[friendButton1 currentTitle]];
    }
}

-(IBAction)handleFriendButton2DoubleClicked:(id)sender{
    [addingFriends removeAllObjects];
    [addingFriendsTable reloadData];
    [self pushDetailViewControllerWithName:[friendButton2 currentTitle]];
}

-(IBAction)handleFriendButton3DoubleClicked:(id)sender{
    [addingFriends removeAllObjects];
    [addingFriendsTable reloadData];
    [self pushDetailViewControllerWithName:[friendButton3 currentTitle]];
}

-(IBAction)handleFriendButton4DoubleClicked:(id)sender{
    [addingFriends removeAllObjects];
    [addingFriendsTable reloadData];
    [self pushDetailViewControllerWithName:[friendButton4 currentTitle]];
}

-(IBAction)handleCancelNewFriendButtonClicked:(id)sender {
    [addingNewFriendInfoView setHidden:YES];
    
    friendNameText.text = @"";
    friendFirstNameText.text = @"";
    friendLastNameText.text = @"";
    friendEmailText.text = @"";
}

-(IBAction)handleSubmitNewFriendButtonClicked:(id)sender {
    [appDelegate createNewFriendWithName:friendNameText.text email:friendEmailText.text firstName:friendFirstNameText.text lastName:friendLastNameText.text];
    [addingNewFriendInfoView setHidden:YES];
    
    friendNameText.text = @"";
    friendFirstNameText.text = @"";
    friendLastNameText.text = @"";
    friendEmailText.text = @"";
    
    [self loadFriendsArray];
}

-(IBAction)handleSegmentEvenOrManualClicked:(id) sender {
    if([segmentEvenOrManual selectedSegmentIndex] == 0) {
        [addingFriendsTable reloadData];
    } else {
        [addingFriendsTable reloadData];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [addingFriends count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier] autorelease];
    }
    
    NSUInteger row = [indexPath row];
    
    [[cell viewWithTag:100+row] removeFromSuperview];
    
    cell.textLabel.text = [addingFriends objectAtIndex:row];
    
    UITextField *playerTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 120, 30)];
    playerTextField.adjustsFontSizeToFitWidth = YES;
    playerTextField.borderStyle = UITextBorderStyleRoundedRect;
    playerTextField.textColor = [UIColor blackColor];
    if([segmentEvenOrManual selectedSegmentIndex] == 0) {
        NSString *temp = totalAmountField.text;
        int tempAmount = [temp intValue];
        NSString *individualAmount = [NSString stringWithFormat:@"%d",tempAmount/[addingFriends count]]; 
        playerTextField.backgroundColor = [UIColor grayColor];
        playerTextField.text = individualAmount;
        [playerTextField setEnabled: NO];
    }else {
        playerTextField.backgroundColor = [UIColor whiteColor];
        [playerTextField setEnabled: YES];
    }
    playerTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
    playerTextField.autocapitalizationType = UITextAutocapitalizationTypeNone; // no auto capitalization support
    playerTextField.textAlignment = UITextAlignmentLeft;
    playerTextField.tag = 100+row;

    //playerTextField.delegate = self;
    
    playerTextField.clearButtonMode = UITextFieldViewModeNever; // no clear 'x' button to the right
    
    [cell addSubview:playerTextField];

    return cell;
}

-(BOOL)checkAddingFriendIsAlreadyAdded:(NSString *)name
{
    for(int i =0; i<addingFriends.count; i++)
    {
        if([name isEqualToString:[addingFriends objectAtIndex:i]])
        {
            return YES;
        }
    }
    return NO;
}

-(IBAction)doneEditing:(id)sender
{
    [sender resignFirstResponder];
    [addingFriendsTable reloadData];
}

-(IBAction)handleSplit:(id)sender{
    NSString *billName = eventNameField.text;
    NSNumber *billTotalAmount = [NSNumber numberWithDouble:[totalAmountField.text doubleValue]];
    NSDate *billDate = [NSDate date];
    NSString *billStatus = @"new";
    for(int i =0; i<addingFriends.count; i++) {
        NSIndexPath *indexPathFriendName = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *friend_cell = [self.addingFriendsTable cellForRowAtIndexPath:indexPathFriendName];
        UITextField *currentTextField = (UITextField*)[friend_cell viewWithTag:100+i];
        //UITextField *currentTextField = (UITextField*)[self.view viewWithTag:100+i];
        NSNumber *billAmount = [NSNumber numberWithDouble:[currentTextField.text doubleValue]];
        Friend *billFK;
        for (Friend *thisFriend in friendObjs) {
            if([[addingFriends objectAtIndex:i] isEqualToString:thisFriend.friendName]){
                billFK = thisFriend;
                break;
            }
        }
        [appDelegate createNewBillWithName:billName Date:billDate Amount:billAmount TotalAmount:billTotalAmount Status:billStatus FKBillToFriend:billFK];
    }
    eventNameField.text = @"";
    totalAmountField.text = @"";
    [addingFriends removeAllObjects];
    [addingFriendsTable reloadData];
    
}

-(void)pushDetailViewControllerWithName:(NSString *) name{
    Friend *temp;
    for (Friend *thisFriend in friendObjs) {
        if( [name isEqualToString:thisFriend.friendName]){
            temp = thisFriend;
            break;
        }
    }
    FriendDetailsViewController *detailViewController = [[FriendDetailsViewController alloc]
                                                         initWithNibName:nil bundle:NULL
                                                         appDelegate:appDelegate choosedFriend:temp];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

-(Friend *)findFriendInFriendObjsArrayWithName:(NSString *)name
{
    for (Friend *thisFriend in friendObjs) {
        if([name isEqualToString:thisFriend.friendName]){
            return thisFriend;
        }
    }
    return nil;
}



@end
