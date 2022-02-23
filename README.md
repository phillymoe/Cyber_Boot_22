Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.
ELK-Network-Diagram: 
![alt text](https://github.com/phillymoe/Cyber_Boot_22/blob/main/diagrams/ELK_Soln.png "Logo Title Text 1")


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the general playbook yml file may be used to install only certain pieces of it, such as Filebeat.

Playbook file [here](https://github.com/phillymoe/Cyber_Boot_22/blob/main/ansible/install-elk.yml) and should be pasted into /etc/ansible directory on your container host.

This document contains the following details:

- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored

#### How to Use the Ansible Build


Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

What aspect of security do load balancers protect? **ANSWER: Traffic restriction and congestion management.**

What is the advantage of a jump box? **ANSWER:  Administrative jump point controlling access for remote management.**

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **filesystem** and **system state**.

What does Filebeat watch for?  **ANSWER: Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on servers which monitor log files and collect log events; yada, yada, yada.**

What does Metricbeat record?  **ANSWER: Unlike Filebeat, Metricbeat monitors a server's OS and service metrics.**

The configuration details of each machine may be found below.
Note: Use the Markdown Table Generator to add/remove values from the table.

Colons can be used to align columns.

|Name                 |Function       | IP                | Operating System  |
| -------------       |:-------------:|:-----             | :-----:|
| Nelms-VM-JumpServer |Jump Server    |10.0.0.4           | linux |
| New-ElkVM           |ELK Jump Server|10.1.0.4           | linux |
| PN-Web1             |Web Server     |10.0.0.5           | linux |
| PN-Web2             |Web Server     |10.0.0.6           | linux |




Access Policies
The machines on the internal network are not exposed to the public Internet.
Only the **gateway** machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

Add whitelisted IP addresses:  

**Nelms-VM-JumpServer - 40.71.118.20**

**New-ElkVM - 20.110.216.94**


Machines within the network can only be accessed by a **gateway host**.

Which machine did you allow to access your ELK VM? What was its IP address?  **ANSWER: New-ElkVM - 20.110.216.94**

A summary of the access policies in place can be found in the table below.


|Name                 |Publicly Accessible      |Allowed IP Addresses | 
| -------------       |:-------------:          |:-----               |
| Nelms-VM-JumpServer |Yes                      |40.71.118.20         |
| New-ElkVM           |Yes                      |20.110.216.94        |
| PN-Web1             |No                       |10.0.0.5             |
| PN-Web2             |No                       |10.0.0.6             |



Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because **lightweight vm duplication without error is possible**.

What is the main advantage of automating configuration with Ansible?  **ANSWER: the ability to spin up or down the number of lightweight vm's to accomodate real time demand.**

The playbook implements the following tasks:

In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.
1. Define **TYPE** of server in name field
2. Configure vm services, environmental specs as well as boot behavior
3. Install docker
4. Install python
5. Install other components for ELK implementation; i.e. ports, container elements


The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.
The following image link is an example but yours should look similar. 
![alt text](https://github.com/phillymoe/Cyber_Boot_22/blob/main/diagrams/docker-ps.png "Logo Title Text 1")


Target Machines & Beats
This ELK server is configured to monitor the following machines:

**PN-WEB1 - 10.0.0.5**
**PN-WEB2 - 10.0.0.6**

We have installed the following Beats on these machines:

Filebeat currently installed.
Metricbeat - TBD at the time of this publication.

These Beats allow us to collect the following information from each machine:

**Filebeat manages as well as forward log files and changes and events to be used in Elastisearch analytics platform.**


Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
SSH into the control node and follow the steps below:

Copy the [yml_file_here](https://github.com/phillymoe/Cyber_Boot_22/blob/main/ansible/install-elk.yml) file to container directory **/etc/ansible**.
Update the yml file to include any webservers that will host the web page that collates monitoring data...
Run the playbook, and navigate to the public facing IP address **https://20.110.216.94:5601/app/kibana** to check that the installation worked as expected.


Which file is the playbook? Where do you copy it?  **ANSWER:  /etc/ansible/install-elk.yml**


Which file do you update to make Ansible run the playbook on a specific machine? **ANSWER: configure the host file located in /etc/ansible/hosts**

How do I specify which machine to install the ELK server on versus which to install Filebeat on? **ANSWER: configure the filebeat.yml file and respective host file.**


_Which URL do you navigate to in order to check that the ELK server is running? - same as above - use public IP to port 5601 /app/kibana._
