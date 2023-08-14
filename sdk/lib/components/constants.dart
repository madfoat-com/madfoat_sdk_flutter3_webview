class GlobalUtils{
  static String storeId ='15996';//'15996';//'26286'; //'';//'25557'; // Replace with your storeID
  static String key='pQ6nP-7rHt@5WRFv';//'pQ6nP-7rHt@5WRFv';//'3T4x@bGfnD~4BxHj';//'';//'''';//'qMB6w@wm3tf-Gwrw';//'';//pQ6nP-7rHt@5WRF//Authentication Key : The Authentication Key will be supplied by Telr as part of the Mobile API setup process after you request that this integration type is enabled for your account. This should not be stored permanently within the App.
  static String framed='1';
  static String testmode='0'; // Test mode : Test mode of zero indicates a live transaction. If this is set to any other value the transaction will be treated as a test.
  static String custref='444'; //This is parameter to identify the customers saved card details.
  static String devicetype='iOS'; // Let it be static as iOS for both
  static String deviceid='37fb44a2ec8202a3';  // Application device ID
  static String appname='TelrSDK'; // Application name
  static String version='1.1.6';// Application version
  static String appuser='2';// Application user ID : Your reference for the customer/user that is running the App. This should relate to their account within your systems.
  static String appid='123'; //  Application installation ID
  static String transtype='sale';/* paypage auth Transaction type
                                                    'auth'   : Seek authorisation from the card issuer for the amount specified. If authorised, the funds will be reserved but will not be debited until such time as a corresponding capture command is made. This is sometimes known as pre-authorisation.
                                                    'sale'   : Immediate purchase request. This has the same effect as would be had by performing an auth transaction followed by a capture transaction for the full amount. No additional capture stage is required.
                                                    'verify' : Confirm that the card details given are valid. No funds are reserved or taken from the card.
                                                */
  static String transclass='ecom'; //ecom Transaction class only 'paypage' is allowed on mobile, which means 'use the hosted payment page to capture and process the card details'
  static String firstref='';// (Optinal) Previous user transaction detail reference : The previous transaction reference is required for any continuous authority transaction. It must contain the reference that was supplied in the response for the original transaction
  static String firstname='Divya'; // Forename : It is the minimum required details for a transaction to be processed
  static String lastname='Thampi';// Surname : the minimum required details for a transaction to be processed
  static String addressline1='SIT Tower'; // Street address – line 1: the minimum required details for a transaction to be processed
  static String city='Jeddah'; //the minimum required details for a transaction to be processed
  static String region='Khobar'; //Optional
  static String country='SA'; // Country : Country must be sent as a 2 character ISO code. A list of country codes can be found at the end of this document. the minimum required details for a transaction to be processed
  static String phone='551188269'; //the minimum required details for a transaction to be processed.
  static String emailId='divya.thampi@telr.com';//the minimum required details for a transaction to be processed.
  static String paymenttype='card'; // Let it be static as 'card', used for saved card feature parameter
  static String currency='aed';
}
