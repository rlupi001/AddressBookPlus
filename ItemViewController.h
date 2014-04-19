/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import <Foundation/Foundation.h>
#import "DetailViewController.h"


@interface ItemViewController : UITableViewController<PassData>

@property(strong, nonatomic) NSArray *peopleArray;

-(IBAction)addNewItem:(id)sender;
@end
