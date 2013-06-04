/*
 * ItemListPage.cpp
 *
 *  Created on: 2013-05-11
 *      Author: stuart
 */

#include "ItemListPage.h"

using namespace bb::cascades;

ItemListPage::ItemListPage(AbstractPane* parent)
{
	itemListView = parent->findChild<ListView*>("itemListView");
	itemListModel = parent->findChild<ArrayDataModel*>("itemListModel");

	//Check if null. Critical error if yes

	populateItemListView();
}

ItemListPage::~ItemListPage()
{

}

void ItemListPage::populateItemListView()
{
	for(int i = 0; i < 20; i++)
	{
		itemListModel->append(QVariant("Thing" + QString().number(i)));
	}
}
