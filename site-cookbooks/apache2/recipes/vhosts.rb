#
# Cookbook Name:: apache2
# Recipe:: vhosts
#
# Copyright 2012, Adam Brett. All Rights Reserved.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "apache2"

web_app "hospitalsites" do
 # server_name "hospitalsites.local"
 # server_aliases["*.hospitalsites.local"]
 server_name "hospitalsites.local"
 server_aliases ["*.hospitalsites.local","localhost.hospital-sites-v2.com","localhost.tennovahealthcare.com"]
# server_name "centos63.local"
 #server_aliases ["*.centos63.local"]
  #server_aliases ["local.davisregional.com local.carlislermc.com local.tennovahealthcare.com local.physiciansregional.com local.physiciansregional.com local.sparksphysicians.com"]
  allow_override "all"
  docroot "/var/www/html"
end

#web_app "centos63" do
 # server_name "centos63.local"
  #server_aliases ["*.centos63.local"]
  #allow_override "all"
  #docroot "/var/www/html"
#end
