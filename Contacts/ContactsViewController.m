//
//  ViewController.m
//  Contacts
//
//  Created by Eric Andersen on 7/12/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        NSArray *contactArray = @[@"Johnny Appleseed",
//                                  @"Paul Bunyan",
//                                  @"Calamity Jane"];
        Contact *c1 = [[Contact alloc] initWithName: @"Johnny Appleseed"];
        Contact *c2 = [[Contact alloc] initWithName: @"Paul Bunyan"];
        Contact *c3 = [[Contact alloc] initWithName: @"Calamity Jane"];
        _contacts = [NSMutableArray arrayWithArray: @[c1, c2, c3]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ContactCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    
    Contact *contact = self.contacts[indexPath.row];
    
    cell.textLabel.text = contact.name;
    
    return cell;
}

- (IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue {
    // No action to take if user cancels
}

- (IBAction)createNewContact:(UIStoryboardSegue *)segue {
    NewContactViewController *newContactVC = segue.sourceViewController;
    NSString *firstName = newContactVC.firstNameTextField.text;
    NSString *lastName = newContactVC.lastNameTextField.text;
    if (firstName.length != 0 || lastName.length != 0) {
        NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact *newContact = [[Contact alloc] initWithName:name];
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destination = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"editContactSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Contact *contact = self.contacts[indexPath.row];
        ExistingContactViewController *existingVC = [destination childViewControllers][0];
        existingVC.firstNameString = contact.firstName;
        existingVC.lastNameString = contact.lastName;
        existingVC.indexPath = indexPath;
    }
}

- (IBAction)updateExistingContact:(UIStoryboardSegue *)segue {
    ExistingContactViewController *existingVC = segue.sourceViewController;
    NSString *firstName = existingVC.firstNameTextField.text;
    NSString *lastName = existingVC.lastNameTextField.text;
    NSIndexPath *indexPath = existingVC.indexPath;
    if (firstName.length != 0 || lastName.length != 0) {
        NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact *contact = [[Contact alloc] initWithName:name];
        [self.contacts replaceObjectAtIndex:indexPath.row withObject:contact];
        [self.tableView reloadData];
    }
}

@end
