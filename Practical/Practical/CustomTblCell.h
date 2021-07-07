//
//  CustomTblCell.h
//  Practical
//
//  Created by Ila Panchal on 07/07/21.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionCell.h"

@interface CustomTblCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
{
    
}

@property(nonatomic,strong)IBOutlet UILabel *lblUsername;
@property(nonatomic,strong)IBOutlet UIImageView *imgViewUser;
@property(nonatomic,strong)IBOutlet UICollectionView *CollectionUserItems;
@property(nonatomic,strong)NSArray *arrUserItemData;

@end

