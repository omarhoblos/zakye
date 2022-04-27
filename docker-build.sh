#!/bin/bash
#
# // Copyright 2021 Omar Hoblos
# //
# // Licensed under the Apache License, Version 2.0 (the "License");
# // you may not use this file except in compliance with the License.
# // You may obtain a copy of the License at
# //
# //     http://www.apache.org/licenses/LICENSE-2.0
# //
# // Unless required by applicable law or agreed to in writing, software
# // distributed under the License is distributed on an "AS IS" BASIS,
# // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# // See the License for the specific language governing permissions and
# // limitations under the License.
#

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}##################################################################${NC}"
echo -e "${GREEN}############ BUILDING SWISS ON FHIR APPLICATION IMAGE ############${NC}"
echo -e "${GREEN}##################################################################${NC}"
echo

docker build -t swiss . 

echo
echo -e "${GREEN}#################################################################${NC}"
echo -e "${GREEN}######### DEPLOYING SWISS ON FHIR APPLICATION CONTAINER #########${NC}"
echo -e "${GREEN}#################################################################${NC}"
echo

docker run -d -p 4200:80 --env-file .env --name swiss_app_local swiss
