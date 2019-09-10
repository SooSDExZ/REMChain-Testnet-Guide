#!/usr/bin/env bash

remnode --config-dir ./config/ --data-dir ./data/ >> remnode.log 2>&1 &
sleep 1
remvault &
sleep 4
remcli wallet create --file walletpass
echo " "
echo "WHATS YOUR PRODUCER DOMAIN ADDRESS?"
read -e domain
echo " "
echo "COPY AND PASTE YOUR TELEGRAM PUBLIC KEY:"
read -e ownerpublickey
echo " "
echo "COPY AND PASTE YOUR TELEGRAM PRIVATE KEY:"
read -e ownerprivatekey
remcli wallet import --private-key=$ownerprivatekey
echo " "
echo "COPY AND PASTE YOUR TESTNET ACCOUNT NAME:"
read -e produceraccountname
echo $produceraccountname > produceraccountname.txt
produceraccountname=$(cat produceraccountname.txt)
echo " "
remcli create key --file key1
cp key1 activekeys
sudo -S sed -i "/^Private key: /s/Private key: //" key1 && sudo -S sed -i "/^Public key: /s/Public key: //" key1
activeprivatekey=$(head -n 1 key1 | tail -1)
activepublickey=$(head -n 2 key1 | tail -1)
remcli wallet import --private-key=$activeprivatekey
echo " "
echo "TAKE NOTE OF YOUR ACTIVE KEYS:"
cat ./activekeys
echo " "
pause 'Press [Enter] key to continue...'
echo " "
remcli create key --file key2
cp key2 requestkeys
sudo -S sed -i "/^Private key: /s/Private key: //" key2 && sudo -S sed -i "/^Public key: /s/Public key: //" key2
requestprivatekey=$(head -n 1 key2 | tail -1)
requestpublickey=$(head -n 2 key2 | tail -1)
remcli wallet import --private-key=$requestprivatekey
echo " "
echo "TAKE NOTE OF YOUR REQUEST KEYS:"
cat ./requestkeys
echo " "
pause 'Press [Enter] key to continue...'
echo " "
remcli create key --file key3
cp key3 producerkeys
sudo -S sed -i "/^Private key: /s/Private key: //" key3 && sudo -S sed -i "/^Public key: /s/Public key: //" key3
producerprivatekey=$(head -n 1 key3 | tail -1)
producerpublickey=$(head -n 2 key3 | tail -1)
remcli wallet import --private-key=$producerprivatekey
echo " "
echo "TAKE NOTE OF YOUR PRODUCER KEYS:"
cat ./producerkeys
echo " "
pause 'Press [Enter] key to continue...'
echo " "
echo -e "plugin = eosio::chain_api_plugin\n\nplugin = eosio::net_api_plugin\n\nhttp-server-address = 0.0.0.0:8888\n\np2p-listen-endpoint = 0.0.0.0:9876\n\np2p-peer-address = 167.71.88.152:9877\n\nverbose-http-errors = true\n\nproducer-name = $produceraccountname\n\nsignature-provider = $producerpublickey=KEY:$producerprivatekey" > ./config/config.ini
remcli system regproducer $produceraccountname $producerpublickey $domain
remcli set account permission $produceraccountname active $activepublickey owner -p $produceraccountname@owner
walletpassword=$(cat walletpass)
echo $walletpassword > producerwalletpass.txt
producerwalletpass=$(cat producerwalletpass.txt)
remcli wallet remove_key $ownerpublickey --password=$producerwalletpass
rm key3
rm -f ./Install-2.sh
