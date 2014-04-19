/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import <UIKit/UIKit.h>
#import "AddressCard.h"

@protocol PassData <NSObject>
@required
-(void)passData:(AddressCard *)data;
@end


@class AddressCard;
@interface DetailViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
    __weak IBOutlet UITextField *last;
    __weak IBOutlet UITextField *first;
    __weak IBOutlet UITextField *email;
    __weak IBOutlet UITextField *phone;
    __weak IBOutlet UITextField *address;
    __weak IBOutlet UIDatePicker *date;
    __weak IBOutlet UIImageView *imageView;
    
    BOOL newCard;
    id <PassData> delegate;
}

@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) AddressCard *card;
@property (nonatomic) BOOL newCard;

@end
