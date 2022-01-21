# To interact with Fabric-CA Server, we  need another tool on our side. It can be either a Fabric-CA Client or Fabric SDKs.
# Steps to follow to generate crypto materials:

#1. Bring up the Fabric-CA server which is used as the CA of that organization.
#2. Use Fabric-CA client to enroll a CA admin.
#3. With the CA admin, use Fabric-CA client to register and enroll every entity peer, order, user, etc. One by one to the Fabric-CA server.
#4. Move the result material to the directory structure.

source scriptUtils.sh

export PATH=${PWD}/../bin:$PATH

certificatesForHospital(){
	echo
	echo "Encroll the CA admin"
	echo
	mkdir -p consortium/crypto-config/peer0organizations/hospital/
	export FABRIC_CA_CLIENT_HOME=${PWD}/consortium/crypto-config/peer0organizations/hospital/

	#To go back to the previous folder:
	#echo "${PWD%/[^/]*}"

	fabric-ca-client enroll -y https://admin:adminpw@localhost:1010 --caname ca.hospital --tls.certfiles ${PWD}/consortium/fabric-ca/hospital/tls-cert.pem

	#Create a config.yaml file to enable the OU identifiers.
	# and keep the OU identifiers for each type of entity.
	# They are peer, orderer, client and admin.

}
