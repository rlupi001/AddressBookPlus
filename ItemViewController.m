/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import "ItemViewController.h"
#import "AddressBook.h"
#import "AddressCard.h"


@implementation ItemViewController
@synthesize peopleArray;

-(id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self){
        
        
        UINavigationItem *n = [self navigationItem];
        [n setTitle:@"Contacts"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        [[self navigationItem] setLeftBarButtonItem:bbi];
        
        UIBarButtonItem *bbi2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEditingMode:)];
        [[self navigationItem] setRightBarButtonItem:bbi2];
        
        NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"Names" ofType:@"plist"];
        NSDictionary *peopleDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
        
        
        self.peopleArray = peopleDictionary[@"People"];
        
        NSDate *aDate = [NSDate date];
        
        for(NSDictionary *i in peopleArray)
        {
            [[AddressBook sharedBook] addNew:i[@"Name"] last:i[@"Last"] address:@"Nowhere" phone:@"444444444" date:aDate email:i[@"Email"]];
        }
        
        [[AddressBook sharedBook] sort];
    }

    return self;
}

-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[AddressBook sharedBook] allItems] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    AddressCard *p = [[[AddressBook sharedBook] allItems] objectAtIndex:[indexPath row]];
    
    NSString *name = [NSString stringWithFormat:@"%@ %@", [p name], [p last]];
    [[cell textLabel] setText:name];
    
    return cell;
}

-(void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    NSArray *items = [[AddressBook sharedBook] allItems];
    AddressCard *selectedItem = [items objectAtIndex:[indexPath row]];
    
    [detailViewController setCard:selectedItem];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

-(void)passData:(AddressCard *)data
{
    int lastRow = [[[AddressBook sharedBook] allItems] indexOfObject:data];
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
    
}

-(IBAction)addNewItem:(id)sender
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.delegate = self;
    detailViewController.newCard = YES;
    [[self navigationController] pushViewController:detailViewController animated:YES];
    
}

-(IBAction)toggleEditingMode:(id)sender
{
    if([self isEditing])
    {
        [self setEditing:NO animated:YES];
    } else {
        [self setEditing:YES animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        AddressBook *ps = [AddressBook sharedBook];
        NSArray *items = [ps allItems];
        AddressCard *p = [items objectAtIndex:[indexPath row]];
        [ps removeCard:p];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
