/*
 * statusPage.cpp
 *
 *  Created on: 2013-05-11
 *      Author: stuart
 */

#include "StatusPage.h"

using namespace bb::cascades;

StatusPage::StatusPage(AbstractPane* parent)
{
	statusPageContainer = parent->findChild<Container*>("statusPage");
	//Check NULL

	//statusPageLayout = new DockLayout();
	//statusPageContainer->setLayout(statusPageLayout);

	//Setup the text fields
	//Label * teamNameLabel;
}

StatusPage::~StatusPage()
{

}

