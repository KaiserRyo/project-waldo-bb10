// Default empty project template
import bb.cascades 1.0
import bb.cascades.multimedia 1.0
import bb.multimedia 1.0

// creates one page with a label
TabbedPane {
    id: tabbedPane
    showTabsOnActionBar: false

    Tab {
        title: "Home"
        content: Page {
		            Container {
                		objectName: "statusPage"
		            }
        }
    }

    Tab {
        title: "Item List"

        content: Page {
		            Container {
		                layout: DockLayout {
		                }
		                
		                ListView {
		                    objectName: "itemListView"
		                    dataModel: ArrayDataModel {
		                        			objectName: "itemListModel"
		                    	   	 }		                    
		                    }
		                }
		            }
        }

    Tab {
        title: "Item Vault"
        
	    content: Page {
			        Container {
			            layout: StackLayout {
			            }
			            Label {
			                text: qsTr("Hello World")
			                textStyle.base: SystemDefaults.TextStyles.BigText
			                verticalAlignment: VerticalAlignment.Center
			                horizontalAlignment: HorizontalAlignment.Center
			            }
			        }
			    }
    }

    Tab {
        title: "Acquire Item"

        content: NavigationPane {
            	id: qrScanStack
            	
	            Page {
		            Container {
		                layout: StackLayout {
		                }
		                Label {
		                    text: qsTr("Add an Item to your Vault")
		                    textStyle.base: SystemDefaults.TextStyles.TitleText
		                    verticalAlignment: VerticalAlignment.Center
		                    horizontalAlignment: HorizontalAlignment.Center
		                }
		                Button {
		                    id: scanQrButton
		                    text: "Scan QR Code"
		                    onClicked: 
	                        {
                        		qrScanStack.push(scanViewer)
                        		barcodeScannerCamera.open()
                        	}
                        	horizontalAlignment: HorizontalAlignment.Center
                        }
	                    Label {
	                        id: qrDataLabel
	                        verticalAlignment: VerticalAlignment.Center
	                        horizontalAlignment: HorizontalAlignment.Center
	                    }
                	}
	             }
	            
	            attachedObjects: [
		                Page {
		                    id: scanViewer
		                    content: Container {
					                        Camera {
					                        	objectName:"barcodeScannerCamera"
					                        	id: barcodeScannerCamera
					                            horizontalAlignment: HorizontalAlignment.Fill
					                            verticalAlignment: VerticalAlignment.Fill
					
					                            onCameraOpened: 
					                            {
					                                // Apply some settings after the camera was opened successfully
					                                getSettings(cameraSettings)
					                                cameraSettings.focusMode = CameraFocusMode.ContinuousAuto
					                                cameraSettings.shootingMode = CameraShootingMode.Stabilization
					                                applySettings(cameraSettings)
					
					                                // Start the view finder as it is needed by the barcode detector
                                     				barcodeScannerCamera.startViewfinder()
					                            }
					                            
					                            attachedObjects: [
					                                BarcodeDetector 
					                                {
					                                    id: barcodeDetector
					                                    camera: barcodeScannerCamera
                                         				formats: BarcodeFormat.Any
					                                    onDetected: 
					                                    {
					                                        if(qrDataLabel.text != data)
					                                        {
						                                        barcodeScannerCamera.stopViewfinder()
						                                        scannedSound.play()
                                                 				qrScanStack.pop()
                                                 				qrDataLabel.text = data;
                                                 		    } 
					                                    }
					                                },
					                                SystemSound 
					                                {
					                                    id: scannedSound
					                                    sound: SystemSound.CameraShutterEvent
					                                },
					                                CameraSettings 
					                                {
					                                    id: cameraSettings
					                                }
					                            ]
	                                		}
		                    }
		                }
                  ]
            }
    }
}
