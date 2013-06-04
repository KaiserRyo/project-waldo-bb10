/*
 * ItemListPage.h
 *
 *  Created on: 2013-05-11
 *      Author: stuart
 */

#ifndef ITEMLISTPAGE_H_
#define ITEMLISTPAGE_H_

#include <QObject>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/ListView>
#include <bb/cascades/ArrayDataModel>

namespace bb { namespace cascades { class Application; }}

using namespace bb::cascades;

class ItemListPage : public QObject
{

Q_OBJECT

public:
	ItemListPage(AbstractPane * parent);
	virtual ~ItemListPage();
	void populateItemListView();

private:
	ListView * itemListView;
	ArrayDataModel * itemListModel;
};

#endif /* ITEMLISTPAGE_H_ */
