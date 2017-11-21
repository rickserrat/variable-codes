#!/bin/sh                                                                                 
HTTP_STATUS=`curl -s -o /dev/null -w "%{http_code}" http://example.org`                 
if [ "$HTTP_STATUS" != "200" ]                                                            
then                                                                                      
        service nginx stop                                                                
        echo "Service stop - $(date)" >> log-script.txt
        sleep 10
        service nginx restart
        echo "Service start - $(date)" >> log-script.txt
fi

....

#!/bin/sh                                                                                
HTTP_STATUS=`curl -s -o /dev/null -w "%{http_code}" http://example.org`                 
if [ "$HTTP_STATUS" = "200" ]                                                            
      echo "Service UP - $(date)" >> log-script.txt
else
        service nginx stop                                                                
        echo "Service stop - $(date)" >> log-script.txt
        sleep 10
        service nginx restart
        echo "Service start - $(date)" >> log-script.txt
fi 