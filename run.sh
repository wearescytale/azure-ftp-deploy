
#check for curl
#check if password is filled
#check if publish url starts with ftp
#check if publish url endswith wwwroot

FTP_URL=$WERCKER_FTP_STAGE_DEPLOY_PUBLISH_URL
FTP_PASSWORD=$WERCKER_FTP_STAGE_DEPLOY_PASSWORD
FTP_USERNAME=$WERCKER_FTP_STAGE_DEPLOY_USERNAME
OUTPUT_DIR=$WERCKER_FTP_STAGE_DEPLOY_OUTPUT_DIR

echo "Test connection"

echo "curl -u $FTP_USERNAME:FTP_PASSWORD $FTP_URL/"
curl -u $FTP_USERNAME:$FTP_PASSWORD $FTP_URL/

echo "$(ls -A $OUTPUT_DIR | wc -l ) files to send..."

echo "find $OUTPUT_DIR -type f -exec curl -u $FTP_USERNAME:FTP_PASSWORD --ftp-create-dirs -T {} $FTP_URL/ \;"
find $OUTPUT_DIR -type f -exec curl -u $FTP_USERNAME:$FTP_PASSWORD --ftp-create-dirs -T {} $FTP_URL/ \;