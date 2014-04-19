/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import "AddressCard.h"

@implementation AddressCard

@synthesize name, email, phone, last, address, birthday, image;

-(NSComparisonResult) compareName:(id)element{
    return [last compare:[element last]];
}

-(void)print{
    NSLog(@"-------------------");
    NSLog(@"%@", [self name]);
    NSLog(@"%@", self.email);
}

@end
