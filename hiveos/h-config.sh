#!/usr/bin/env bash                                                                                                                            

conf=""                                                                                                                                        
                                                                                                                                               
if [[ ! -z $CUSTOM_TEMPLATE ]]; then                                                                                                           
    conf+="ADDRESS="                                                                                                                           
    conf+=$CUSTOM_TEMPLATE                                                                                                                     
fi                                                                                                                                             
                                                                                                                                               
conf+="\n"                                                                                                                                     
                                                                                                                                               
if [[ ! -z $CUSTOM_URL ]]; then                                                                                                                
    conf+="POOL="                                                                                                                              
    conf+=$CUSTOM_URL                                                                                                                          
fi                                                                                                                                             
                                                                                                                                               
conf+="\n"                                                                                                                                     
                                                                                                                                               
if [[ ! -z $WORKER_NAME ]]; then                                                                                                               
    conf+="WORKER_NAME="                                                                                                                       
    conf+=$WORKER_NAME                                                                                                                         
fi                                                                                                                                             
                                                                                                                                               
conf+="\n"
if [[ ! -z $CUSTOM_NAME ]]; then                                                                                                        
    conf+="CUSTOM_NAME="                                                                                                                      
    conf+=$CUSTOM_NAME                                                                                                                  
fi

conf+="\n"  

if [[ ! -z $CUSTOM_VERSION ]]; then                                                                                                        
    conf+="CUSTOM_VERSION="                                                                                                                      
    conf+=$CUSTOM_VERSION                                                                                                                  
fi

conf+="\n"  

if [[ ! -z $CUSTOM_ALGO ]]; then                                                                                                        
    conf+="CUSTOM_ALGO="                                                                                                                      
    conf+=$CUSTOM_ALGO                                                                                                                  
fi

conf+="\n"

if [[ ! -z $CUSTOM_USER_CONFIG ]]; then                                                                                                        
    conf+="CUSTOM_USER_CONFIG=\""                                                                                                                      
    conf+="$CUSTOM_USER_CONFIG\""
fi

conf+="\n"                                                                                                                                   
                                                                                                                                               
if [[ ! -z $CUSTOM_LOG_BASENAME ]]; then                                                                                                        
    conf+="CUSTOM_LOG_BASENAME="                                                                                                                      
    conf+=$CUSTOM_LOG_BASENAME                                                                                                                  
fi

conf+="\n"                                                                                                                                     
                                                                                                                                               
if [[ ! -z $CUSTOM_CONFIG_FILENAME ]]; then                                                                                                        
    conf+="CUSTOM_CONFIG_FILENAME="                                                                                                                      
    conf+=$CUSTOM_CONFIG_FILENAME                                                                                                                  
fi

                                                                                                                                               
echo -e "$conf" > $CUSTOM_CONFIG_FILENAME