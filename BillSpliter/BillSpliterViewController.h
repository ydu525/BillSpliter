//
//  BillSpliterViewController.h
//  BillSpliter
//
//  Created by yan du on 10/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BillSpliterAppDelegate.h"

@interface BillSpliterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    //IBOutlet UISwipeGestureRecognizer *swipeRecognizer;
    IBOutlet UISwipeGestureRecognizer *swipeLeftRecognizer;
    IBOutlet UISwipeGestureRecognizer *swipeRightRecognizer;
    IBOutlet UIView *friendButtonsView;
    IBOutlet UIView *addingNewFriendInfoView;
    
    IBOutlet UIButton *friendButton1;
    IBOutlet UIButton *friendButton2;
    IBOutlet UIButton *friendButton3;
    IBOutlet UIButton *friendButton4;
    
    IBOutlet UIButton *cancelNewFriendButton;
    
    IBOutlet UITableView *addingFriendsTable;
    
    IBOutlet UISegmentedControl *segmentEvenOrManual;
    
    IBOutlet UITextField *eventNameField;
    IBOutlet UITextField *totalAmountField;
    
    IBOutlet UITextField *friendFirstNameText;
    IBOutlet UITextField *friendLastNameText;
    IBOutlet UITextField *friendNameText;
    IBOutlet UITextField *friendEmailText;
    
    //IBOutlet UINavigationBar *navBarBetweenViews;
    
    int friendGroupNum;
    int friendGroupMax;
    NSMutableArray *friends;
    NSMutableArray *friendObjs;
    NSMutableArray *addingFriends;

    BillSpliterAppDelegate *appDelegate;
}

//@property (nonatomic, strong) UISwipeGestureRecognizer *swipeRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeLeftRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeRightRecognizer;
@property (nonatomic, retain) UIView *friendButtonsView;
@property (nonatomic, retain) UIView *addingNewFriendInfoView;

@property (nonatomic, retain) UIButton *friendButton1;
@property (nonatomic, retain) UIButton *friendButton2;
@property (nonatomic, retain) UIButton *friendButton3;
@property (nonatomic, retain) UIButton *friendButton4;

@property (nonatomic, retain) UIButton *cancelNewFriendButton;

@property (nonatomic, retain) UITableView *addingFriendsTable;

@property (nonatomic, retain) UISegmentedControl *segmentEvenOrManual;

@property (nonatomic, retain) UITextField *eventNameField;
@property (nonatomic, retain) UITextField *totalAmountField;

@property (nonatomic, retain) UITextField *friendFirstNameText;
@property (nonatomic, retain) UITextField *friendLastNameText;
@property (nonatomic, retain) UITextField *friendNameText;
@property (nonatomic, retain) UITextField *friendEmailText;

//@property (nonatomic, retain) UINavigationBar *navBarBetweenViews;

-(IBAction)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer;
//-(IBAction)handleSwipeLeft:(UISwipeGestureRecognizer *)recognizer;
//-(IBAction)handleSwipeRight:(UISwipeGestureRecognizer *)recognizer;
-(IBAction)loadFriendButtons;
-(IBAction)handleFriendButton1Clicked:(id) sender;
-(IBAction)handleFriendButton2Clicked:(id) sender;
-(IBAction)handleFriendButton3Clicked:(id) sender;
-(IBAction)handleFriendButton4Clicked:(id) sender;
-(IBAction)handleCancelNewFriendButtonClicked:(id)sender;
-(IBAction)handleSubmitNewFriendButtonClicked:(id)sender;
-(IBAction)handleFriendButton1DoubleClicked:(id) sender;
-(IBAction)handleFriendButton2DoubleClicked:(id) sender;
-(IBAction)handleFriendButton3DoubleClicked:(id) sender;
-(IBAction)handleFriendButton4DoubleClicked:(id) sender;
-(IBAction)handleSegmentEvenOrManualClicked:(id) sender;
-(void)signAppDelegate:(BillSpliterAppDelegate *) app;
-(IBAction)handleSplit:(id)sender;
-(IBAction)doneEditing:(id)sender;
-(Friend *)findFriendInFriendObjsArrayWithName:(NSString *)name;

@end
