/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import "AddressBook.h"

@implementation AddressBook

+(AddressBook *)sharedBook
{
    static AddressBook *sharedBook = nil;
    if(!sharedBook)
        sharedBook = [[super allocWithZone:nil] init];
    return sharedBook;
}

+(id)allocWithZone:(NSZone *)zone
{
    return [self sharedBook];
}

-(id)init{
    
    cards = [[NSMutableArray alloc] init];
    self = [super init];
    return self;
    
}

-(NSArray *)allItems
{
    return cards;
}

-(void)sort{
    [cards sortUsingSelector:@selector(compareName:)];
}

-(void)addCard:(NSString *)theName email:(NSString *)theEmail{
    AddressCard* newCard = [[AddressCard alloc] init];

        newCard.name = theName;
        newCard.email = theEmail;
    
    [cards addObject:newCard];
}

-(void)addNew:(NSString *)first last:(NSString *)lastName address:(NSString *)theAddress phone:(NSString *)thePhone date:(NSDate *)theDate email:(NSString *)theEmail
{
    AddressCard *newCard = [[AddressCard alloc]init];
    
    newCard.name =first;
    newCard.last = lastName;
    newCard.address = theAddress;
    newCard.phone = thePhone;
    newCard.birthday = theDate;
    newCard.email = theEmail;
    
    [cards addObject:newCard];
}

-(void)addSetCard:(AddressCard *)card
{
    [cards addObject:card];
}

-(int)entries{
    return [cards count];
}

-(void)print{
    
    for(AddressCard *c in cards){
        [c print];
    }
}

-(void)updateCard:(int)index name:(NSString *)theName email:(NSString *)theEmail{
    AddressCard *card = [cards objectAtIndex:index];
    card.name = theName;
    card.email = theEmail;
}

-(NSString *)getName:(int)atIndex{
   NSString * name = [[cards objectAtIndex:atIndex] name];
    return name;
}

-(NSString *)getEmail:(int)atIndex{
    NSString * email = [[cards objectAtIndex:atIndex] email];
    return email;
}

-(void)removeCard:(AddressCard *)p
{
    [cards removeObjectIdenticalTo:p];
}

@end
