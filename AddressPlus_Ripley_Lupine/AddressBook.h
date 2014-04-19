/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject
{
    NSMutableArray *cards;
}

+(AddressBook *)sharedBook;

-(NSArray *)allItems;

-(void)sort;
-(id)init;
-(void)addCard:(NSString *)theName email:(NSString *)theEmail;
-(void)addSetCard:(AddressCard *)card;
-(void)addNew:(NSString *)first last:(NSString *)lastName address:(NSString *)theAddress phone:(NSString *)thePhone
         date:(NSDate *)theDate email:(NSString *)theEmail;

-(int)entries;
-(void)updateCard:(int)index name:(NSString *)theName email:(NSString *)theEmail;
-(NSString *)getName:(int)atIndex;
-(NSString *)getEmail:(int)atIndex;
-(void)print;
-(void)removeCard:(AddressCard *)p;

@end
