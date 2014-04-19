/*
 Ripley Lupine
 3218863
 COP465501 TR 5:00
 Steve Luis ECS 282
 #6 Assignment
 DUE Weds Apr9 2014
 */

#import "DetailViewController.h"
#import "AddressBook.h"
#import "ItemViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize card, newCard, delegate;

-(id)init{
    self = [super init];
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePicture:)];
    [[self navigationItem] setRightBarButtonItem:bbi];
    
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(!newCard)
    {
    
     [first setText:[card name]];
     [last setText:[card last]];
     [email setText:[card email]];
     [phone setText:[card phone]];
     [address setText:[card address]];
     [date setDate:[card birthday]];
     if([card image] != nil)
     {
        [imageView setImage:[card image]];
     }
      
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
        [[self view] endEditing:YES];
    
    if(newCard)
    {
        AddressCard *p = [[AddressCard alloc] init];
        p.name = [first text];
        p.last = [last text];
        p.email = [email text];
        p.address = [address text];
        p.phone = [phone text];
        p.birthday = [date date];
        if([imageView image] != nil)
        {
            p.image = [imageView image];
        }
        [[AddressBook sharedBook] addSetCard:p];
        
        [[self delegate] passData:p];
        
        self.newCard = NO;
        
    }
    else
    {
        [card setName:[first text]];
        [card setLast:[last text]];
        [card setEmail:[email text]];
        [card setPhone:[phone text]];
        [card setAddress:[address text]];
        [card setBirthday:[date date]];
        [card setImage:[imageView image]];
    }
}

-(void)setCard:(AddressCard *)i
{
    card = i;
    NSString *s = [NSString stringWithFormat:@" %@ %@", [card name],[card last]];
    
    [[self navigationItem] setTitle:s];
}

-(IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [imageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL) textFieldShouldReturn: (UITextField *) theTextField
{
    [theTextField resignFirstResponder];
    return YES;
}

@end
