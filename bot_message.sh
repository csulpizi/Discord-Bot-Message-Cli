TOKEN=`cat bot_token.txt`

if test -z $TOKEN
then
    read -sp 'Bot Token: ' TOKEN
    echo ""
fi

if test -z $1
then
    read -p 'Channel Id: ' CHANNEL
else
    CHANNEL=$1
fi

if test -z $2
then
    read -p 'Message Content: ' MESSAGE
else
    MESSAGE=$2
fi

curl -v \
     -H "Authorization: Bot $TOKEN" \
     -H "Content-Type: application/json" \
     -H "User-Agent: Discordbot/2.0" \
     -d "{\"content\":\"$MESSAGE\"}" \
     https://discordapp.com/api/channels/$CHANNEL/messages
