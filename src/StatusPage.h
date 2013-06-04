/*
 * statusPage.h
 *
 *  Created on: 2013-05-11
 *      Author: stuart
 */

#ifndef STATUSPAGE_H_
#define STATUSPAGE_H_

#include <QObject>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/ListView>
#include <bb/cascades/ArrayDataModel>
#include <bb/cascades/Container>
#include <bb/cascades/DockLayout>
#include <bb/cascades/Label>

namespace bb { namespace cascades { class Application; }}

using namespace bb::cascades;

class StatusPage : public QObject
{

Q_OBJECT

public:
	StatusPage(AbstractPane* parent);
	virtual ~StatusPage();

private:
	Container * statusPageContainer;
	DockLayout * statusPageLayout;
};

#endif /* STATUSPAGE_H_ */
