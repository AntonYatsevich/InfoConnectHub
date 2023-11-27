# infoConnectHub
InfoConnect Hub is a lightweight, scalable, easy to implement stand-alone component, that helps surfacing IBM i business logic as standards based REST API, and enables bi-directional event streaming and data replication use cases with little to no custom development required. The product can be deployed natively on any Java enabled infrastructure, including on-prem and cloud environments as well as directly on IBM i, either as a stand-alone component or in combination with other Infoview products (such as InfoCDC change data capture solution) and other integration services (API manager, messaging or event streaming platforms etc) to fit customers' specific infrastructure and functional requirements.

## IBM i Prerequisites

- IBM i OS version:V5R4 and higher
- The Hub must be able to reach the IBM i servers on ports 446, 449, 8470, 8472,8473,8475 and 8476 for non-SSL communications, and ports 448, 449, 9470, 9472, 9473, 9475 and 9476 accessible for SSL communications.
- IBM i must have **\*CENTRAL, \*DTAQ, \*RMTCMD, \*SIGNON and \*SRVMAP** host servers running in the QSYSWRK subsystem
- If secure TLS connection is used, the TLS certificate must be applied to Central, Data Queue, Remote Command, File, Signon, and DDM / DRDA services in Digital Certificate Manager
- IBM i user ID must be authorized to perform the operations on the intended IBM i objects
- If there&#39;s an additional security software that locks down the remote execution functionality, the IBM i user ID defined for connector configuration must be allowed to execute remote calls and access database, IFS and DDM services

## Quick Start Guide
1. Contact Infoview to get the Hub distribution package and a trial license, or launch the Hub from the participating marketplaces such as [AWS Marketplace](https://aws.amazon.com/marketplace/pp/prodview-lfmxn5q7ijeli)
2. Download and run the Hub on any Java supported on-prem or cloud infrastructure, including IBM i. Note the Hub must be able to reach the target IBM i ports listed above. You can run the Hub using **infoConnectHub.sh** script for Linux / AIX / IBMi based platforms, and **infoConnectHub.bat** script for Windows. The script will prompt the user to enter the encryption password, which the Hub uses to encrypt and decrypt sensitive properties.

If you intend to run Hub using the **infoConnectHub.sh** script, execute the following command to make the connector file executable in the _[project-folder]_ directory:
```console
chmod +x infoConnectHub.sh
```

4. If you want to run it manually or set up the Hub to run as a service, then execute following commands from _[project-folder]/executable-jars_:

First, make the connector executable:
```console
chmod +x as400-connector-1.1.0.jar
```
Next, run the connector:
```console
java -Djasypt.encryptor.password=<encryption-password> -Dspring.config.location=../config/application.properties -jar as400-connector-1.1.0.jar
```

Once the Hub instance is running, and security rule allows access to port 8080 of the newly launched instance, use Postman or CURL or any other REST API client to configure and test the IBM i operations, referencing the API documentation below. 

Note that the stand-alone binary distribution version of the product will work without a valid license for the first 15 min after the instance startup then any config and API attempts will fail due to no license error. Please reach out to Infoview sales team at sales@infoviewsystems.com or call +1(734)293-2160. When launching the product from AWS Marketplace or other marketplaces, there is no separate license required. 

For additional information about InfoConnectHub and the complete Quick Start Guide, please refer to the [Hub Quick Start](https://infoviewsystems.com/docs/Hub/)
