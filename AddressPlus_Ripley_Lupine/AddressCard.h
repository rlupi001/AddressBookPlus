/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject
{
    NSString *name;
    NSString *last;
    NSString *address;
    NSString *phone;
    NSString *email;
    NSDate *birthday;
    UIImage *image;
}

@property (copy, nonatomic) NSString *name, *email, *last, *address, *phone;
@property (copy, nonatomic) NSDate  *birthday;
@property (copy, nonatomic) UIImage *image;

-(NSComparisonResult) compareName:(id)element;
-(void)print;

@end
