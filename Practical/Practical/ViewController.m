//
//  ViewController.m
//  Practical
//
//  Created by Ila Panchal on 07/07/21.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self getDetails];
}

#pragma mark - UI Methods

- (void)getDetails {
   
     NSString *strURL = @"http://sd2-hiring.herokuapp.com/api/users?offset=10&limit=5";
     NSLog(@"URL: %@",strURL);
     
     NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL  URLWithString:strURL]];
     [urlRequest setHTTPMethod:@"GET"];
//     [urlRequest setValue:ContentType forHTTPHeaderField:@"Content-Type"];
//     [urlRequest setValue:ContentType forHTTPHeaderField:@"Accept"];
//     [urlRequest setValue:[NSString stringWithFormat:@"%@ %@",TokenType,[dictLoginUserData valueForKey:@"token"]] forHTTPHeaderField:@"Authorization"];
     
     NSURLSession *session = [NSURLSession sharedSession];
     [[session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *error = nil;
            NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
           
            NSLog(@"Response: %@",dictResponse);
            
            NSInteger status = [[dictResponse valueForKey:@"status"] integerValue];
            
            if(status == 1){
                NSDictionary *dictData = [dictResponse objectForKey:@"data"];
                self->arrUsers = [dictData objectForKey:@"users"];
                
                [self->tblData reloadData];
            }else{
                NSLog(@"Error : %@",[dictResponse valueForKey:@"message"]);
            }

         });
     }] resume];
    
 }

#pragma mark - Delegate Methods
#pragma mark TableView Delegate and Datasource Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrUsers count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat tblCellHeight = 0;
    
    NSDictionary *dictUser = [arrUsers objectAtIndex:indexPath.row];
    NSArray *arrItem = [dictUser objectForKey:@"items"];
    
    CGFloat collectionheight = 0;
    if(((arrItem.count)%2) == 0 ) {
        collectionheight = ((arrItem.count)/2)*((viewMain.frame.size.width)/2);
    }else {
        collectionheight = ((arrItem.count + 1)/2)*((viewMain.frame.size.width)/2);
    }
    
    tblCellHeight = 80 + collectionheight + 10;
    
    return tblCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomTblCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTblCell"];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTblCell"];
    }
    
    NSDictionary *dictUser = [arrUsers objectAtIndex:indexPath.row];
//    NSLog(@"%@",dictUser);
    
    cell.lblUsername.text = [NSString stringWithFormat:@"%@",[dictUser valueForKey:@"name"]];
    if (![[dictUser objectForKey:@"image"] isEqualToString:@""]) {
            NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[dictUser objectForKey:@"image"]]];
            cell.imgViewUser.image = [UIImage imageWithData: imageData];
        
      }else {
            cell.imgViewUser.image = [UIImage imageNamed:@"NoImage.png"];
      }
    
    NSArray *arrItem = [dictUser objectForKey:@"items"];
    cell.arrUserItemData = arrItem;
    
    CGFloat collectionheight = 0;
    if(((arrItem.count)%2) == 0 ) {
        collectionheight = ((arrItem.count)/2)*((viewMain.frame.size.width)/2);
    }else {
        collectionheight = ((arrItem.count + 1)/2)*((viewMain.frame.size.width)/2);
    }
    
    cell.CollectionUserItems.frame = CGRectMake(0, 80, viewMain.frame.size.width, collectionheight);
    
    [cell.CollectionUserItems reloadData];
    
    return cell;
}

@end
