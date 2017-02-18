//
//  SimpleAlertView.h
//  testrecorder
//
//  Created by pro on 11/30/1395 AP.
//  Copyright © 1395 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol SimpleAlertViewDelegate;

@interface SimpleAlertView : UIViewController

@property (weak, nonatomic) NSString* viewTitle;
@property (weak, nonatomic) NSString* message;
@property (strong, nonatomic) NSMutableArray* buttonTitles;
@property (weak, nonatomic) NSString* alertID;
@property (weak, nonatomic) id <SimpleAlertViewDelegate> delegate;
@property (strong, nonatomic) UIAlertController* alert;
@property (nonatomic) int numberOfButtons;
@property (nonatomic) int cancelButtonIndex;

- (id) initWithTitle: (NSString*) title message:(NSString*) message delegate: (id) del cancelButtonTitle: (NSString*) cancelTitle otherButtonTitles: (NSArray*) otherTitles alertID: (NSString*) alertID;
- (void) addButtonWithTitle: (NSString*) title;
- (void) show;
- (NSString*) buttonTitleAtIndex: (int) index;
- (void) dismissWithClickedButtonIndex: (int) index animated: (BOOL)animate;

@end

@protocol SimpleAlertViewDelegate <NSObject>
@optional
- (void) didDismissWithButtonIndex:(NSInteger) index alertID:(NSString*) alertID;
@end
