# csf-formula

Salt Stack Formula to set up and configure CSF (ConfigServer Security & Firewall) from http://configserver.com/cp/csf.html

## NOTICE BEFORE YOU USE

* This formula aims to follow the conventions and recommendations described at http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#conventions-formula and http://docs.saltstack.com/en/latest/topics/best_practices.html

## TODO

* add automated cluster configuration
* test under linux distributions other than CentOS 6/7

## Instructions

1. Add this repository as a `GitFS <http://docs.saltstack.com/topics/tutorials/gitfs.html>`_ backend in your Salt master config

2. Configure your Pillar top file (``/srv/pillar/top.sls``) and your pillars, see pillar.example.sls

3. Include this Formula within another Formula or simply define your needed states within the Salt top file (``/srv/salt/top.sls``)

4. Assign csf-cluster-master role to the master node in the CSF cluster
	* salt \<node\> grains.setval roles ['csf-cluster','csf-cluster-master']

5. Assign csf-cluster role to the remaining nodes in the CSF cluster
	* salt \<node\> grains.setval roles ['csf-cluster']

6. Run CSF state on the nodes
	* salt \<nodes\> state.sls csf

## Available states

``csf``
Setup and configure a CSF

## Additional resources

This formula is based on https://github.com/ALinuxNinja/saltstack-csf

## Formula Dependencies

System Requirements:

* Internet HTTP access for downloading various libs

### Formulas:

* https://github.com/tinuva/selinux-formula (to disable selinux)
* https://github.com/tinuva/firewalld-formula (optional, to disable firewalld)

## Contributions

Contributions are always welcome. All development guidelines you have to know are

* set a shebang in the first line (e.g. ``#!jinja|yaml``)
* write clean code (proper YAML+Jinja syntax, no trailing whitespaces, no empty lines with whitespaces, LF only)
* set sane default settings
* test your code
* update README.rst doc

## Salt Compatibility

Tested with:

* Salt Development Version (f9ec0bfb5a2c573785d55d02a01267e99848d333)

## OS Compatibility

Tested with:

* CentOS 6
* CentOS 7

