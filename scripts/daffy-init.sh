#!/bin/bash
############################################################
#Author           : Kyle Dawson
#Author email     : Kyle.Dawson@us.ibm.com
#Original Date    : 2021-11-30
#Initial Version  : v2021-12-01
############################################################
DAFFY_URL=http://get.daffy-installer.com
DAFFY_ENV_CONTEXT=downloads
DAFFY_CONTEXT=download-scripts
RED_TEXT=`tput setaf 1`
GREEN_TEXT=`tput setaf 2`
ORANGE_TEXT=`tput setaf 5`
BLUE_TEXT=`tput setaf 6`
RESET_TEXT=`tput sgr0`
DAFFY_INSTALL_TAR=daffy.tar

OS_NAME=`uname`
if [ ${OS_NAME} == "Linux" ] ;then
    if [ "$EUID" -ne 0 ] ; then
      echo "${RED_TEXT}Please run as root!!!!!!"
      echo "${RED_TEXT}Exiting Script!!!!!!!${RESET_TEXT}"
      exit 99
    fi
fi

#Cleanup File before we start
rm -fR daffy-init.sh &> /dev/null
if [ "${DAFFY_ACCEPT_WARRANTY}" != "Y" ]; then
  clear
  echo "${RED_TEXT}Disclaimer of Warranty and Liability. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.${RESET_TEXT}"
  echo ""
  echo ""
  echo ""
  read -p "${BLUE_TEXT}Do you accept Daffy Warranty and Liability? (Y/N/Yes/No) > ${RESET_TEXT}" ACCEPT_WARRANTY  < /dev/tty
  case ${ACCEPT_WARRANTY} in
    y|Y|Yes|yes)
        echo "${BLUE_TEXT}Agreement Accepted${RESET_TEXT}"
        ;;
     *)
       echo "${RED_TEXT}Aggreement NOT Accpted. Exiting Script!!!!!!!!!!!!!${RESET_TEXT}"
       exit 99
       ;;
  esac
fi
#Download another verion of daffy
if [[ "${1}" == "daffy-v"*".tar" ]]; then
  DAFFY_INSTALL_TAR=${1}
fi

if [ ${OS_NAME} == "Linux" ]; then
  if [  -d "/data/daffy" ]; then
     mkdir -p /tmp/daffy-update/env  &> /dev/null
     mkdir -p /tmp/daffy-update/tmp  &> /dev/null
     mkdir -p /tmp/daffy-update/log  &> /dev/null
     mkdir -p /tmp/daffy-update/certs  &> /dev/null
     cp -f --preserve=timestamps /data/daffy/env/* /tmp/daffy-update/env &> /dev/null
     cp -fR --preserve=timestamps /data/daffy/tmp/* /tmp/daffy-update/tmp &> /dev/null
     cp -fR --preserve=timestamps /data/daffy/log/* /tmp/daffy-update/log &> /dev/null
     cp -fR --preserve=timestamps /data/daffy/certs/* /tmp/daffy-update/certs &> /dev/null
     rm -fR /data/daffy
   fi
   #Build Folder and start in that new location
   mkdir -p /data &> /dev/null
   cd /data
   #Downlaod Daffy Install Tool
   wget ${DAFFY_URL}/${DAFFY_CONTEXT}/${DAFFY_INSTALL_TAR}
   tar -xvf ${DAFFY_INSTALL_TAR} &> /dev/null
   rm -fR  ${DAFFY_INSTALL_TAR} &> /dev/null
   cp -fR --preserve=timestamps /tmp/daffy-update/* /data/daffy/ &> /dev/null
   rm -fR /tmp/daffy-update &> /dev/null
   mkdir -p /data/daffy/{certs,tmp,log} 2>/dev/null
   chmod -fR 755 /data/daffy
else
  if [  -d "~/tools/daffy" ]; then
    mkdir -p /tmp/daffy-update/env  &> /dev/null
    mkdir -p /tmp/daffy-update/tmp  &> /dev/null
    mkdir -p /tmp/daffy-update/log  &> /dev/null
    mkdir -p /tmp/daffy-update/certs  &> /dev/null
    cp -f --preserve=timestamps ~/tools/daffy/env/* /tmp/daffy-update/env &> /dev/null
    cp -fR --preserve=timestamps ~/tools/daffy/tmp/* /tmp/daffy-update/tmp &> /dev/null
    cp -fR --preserve=timestamps ~/tools/daffy/log/* /tmp/daffy-update/log &> /dev/null
    cp -fR --preserve=timestamps ~/tools/daffy/certs/* /tmp/daffy-update/certs &> /dev/null
    rm -fR ~/tools/daffy
  fi
  #Build Folder and start in that new location
  mkdir -p ~/tools &> /dev/null
  cd ~/tools
  #Downlaod Daffy Install Tool
  wget ${DAFFY_URL}/${DAFFY_CONTEXT}/${DAFFY_INSTALL_TAR}
  tar -xvf ${DAFFY_INSTALL_TAR} &> /dev/null
  rm -fR  ${DAFFY_INSTALL_TAR} &> /dev/null
  cp -fR /tmp/daffy-update/* ~/tools/daffy/ &> /dev/null
  mkdir -p /data/daffy/{certs,tmp,log} 2>/dev/null
  rm -fR /tmp/daffy-update &> /dev/null
  chmod -fR 755 ~/tools/daffy
fi

if [ -n "${2}" ] ;then
  #Downlaod new environment file
  rm -fR /data/daffy/env/$2-env.sh 2> /dev/null
  wget -O /data/daffy/env/$2-env.sh ${DAFFY_URL}/${DAFFY_ENV_CONTEXT}/$1
  chmod -fR 755 /data/daffy

  #Start the All-in-one rebuild with new environment file
  /data/daffy/rebuild.sh $2 $3
fi
#Cleanup File post install
rm -fR daffy-init.sh &> /dev/null
source /data/daffy/env.sh
echo ""
echo ""
echo "##########################################################################################################"
echo "Daffy Process                       : init - ${DAFFY_VERSION}"
echo "Install Location                    : ${DATA_DIR}/${PROJECT_NAME}"
echo "Log Location                        : ${LOG_DIR}"
echo "Temp File Location                  : ${TEMP_DIR}"
echo "Environment Config Location         : ${DATA_DIR}/${PROJECT_NAME}/env"
echo "Environment Sample Config Location  : ${DATA_DIR}/${PROJECT_NAME}/env/samples"
echo "Certificate Location                : ${DATA_DIR}/${PROJECT_NAME}/certs"
echo "##########################################################################################################"