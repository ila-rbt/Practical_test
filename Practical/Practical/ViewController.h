//
//  ViewController.h
//  Practical
//
//  Created by Ila Panchal on 07/07/21.
//

#import <UIKit/UIKit.h>
#import "CustomTblCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arrUsers;
    
    IBOutlet UIView *viewMain;
    IBOutlet UITableView *tblData;
}

@end

