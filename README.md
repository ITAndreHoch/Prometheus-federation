**Project goal:**

- Automatic deployment of the Prometheus federation environment
- Visualization of metrics using Grafana platforms
- Showing the possibility of Prometheus in the *Hierarchical Federation* configuration

***

**Use cases**

Federation allows a Prometheus server to scrape ***selected time series*** from another Prometheus server.


There are different use cases for federation. Commonly, it is used to either achieve scalable Prometheus monitoring setups or to pull related metrics from one service's Prometheus into another.

**Hierarchical federation**
Hierarchical federation allows Prometheus to scale to environments with tens of data centers and millions of nodes. In this use case, the federation topology resembles a tree, with higher-level Prometheus servers collecting aggregated time series data from a larger number of subordinated servers.

For example, a setup might consist of many per-datacenter Prometheus servers that collect data in high detail (instance-level drill-down), and a set of global Prometheus servers which collect and store only aggregated data (job-level drill-down) from those local servers. This provides an aggregate global view and detailed local views.

In our case we will use two Prometheus server - each one for another datacenter and one global to collect only specific type of metrics intended for senior managers - in our case - for analyzing the load on the databases -  comparison two environment - eg PROD and DEV


***

**Prerequisites:**

You must have installed:

1. Virtual Box
2. Vagrant tool made by *Hashi Corp*

* Vagrant is a tool for building and managing virtual machine environments in a single workflow. With an easy-to-use workflow and focus on automation, Vagrant lowers development environment setup time, increases production parity, and makes the "works on my machine" excuse a relic of the past. https://www.vagrantup.com/
* VirtualBox is a powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use. https://www.virtualbox.org/




***
**Instalation:**


1. mkdir /*your_path*/prometheus; cd /*your_path*/prometheus 
2. git init
3. git clone https://github.com/ITAndreHoch/Prometheus-federation.git
4. cd Prometheus-federation
5. vagrant up 

Access to Grafana WEB GUI:

| Username | Password | Port |
|----------|----------|------|
| admin    | admin    | 3000 |

Access to individual servers: vagrant ssh "name of machine" eg. *vagrant ss prometheus1 ; sudo su -*

check status: *vagrant status*

All components will automatically deploy like: servers, os, application, and configuration.
Important: Configuration of Grafana - DATASOURCES, DASHBORD will be also implemented.

***
**Target configuration:**

The environment consists of 5 virtual machines:

- 3 servers with installed:  Prometheus, Grafana-Server, Node_exporter
- 2 servers with installed: MySQL server, Mysql_exporter

The assumption of the project is a collection of all metrics from the MYSQL database (for a given datacenter) -
and downloading only selected by global Prometheus.

Infrastructure diagram: 
![alt text](images/prometheus_environment.png)

***
**Components:**

DataCenter1:

* Prometheus1-[192.168.50.21],  Mysql1-[192.168.50.22], Grafana-[192.168.50.21]

DataCenter2:

* Prometheus2-[192.168.50.23],  Mysql2-[192.168.50.24], Grafana-[192.168.50.23]

DataCenter: Global:

* Prometheus3-[192.168.50.25], Grafana-[192.168.50.25]

---
**Data Flow:**

The Prometheus1 and Prometheus2 servers scrapes targets
from Mysql1/2 - in that case ALL MYSQL metrics (exported by msql_exporter - port 9104).

Prometheus3 (Global Datacenter) scrape selected time series (job: mysql_exporter) from Prometheus1/2servers. 
IMPORTANT: Prometheus3 collects only SELECTED METRICS - in this case MYSQL. The rest - like Prometheus, Node are not downloaded). 
This is Hierarchical federation which allows Prometheus to scale to environments with tens of data centers and millions of nodes. In this use case, the federation topology resembles a tree, with higher-level Prometheus servers collecting aggregated time series data from a larger number of subordinated servers.

**Example in practice:**

Below is a drawing showing mysql dashboard (grafan server - data from prometheus1: 192.168.50.3000)

![alt text](images/prometheus1-dashboard.png)

and now - dashboard Global-mysql from prometheus3 (Grtafana: 192.168.50.25:3000) which presents SPECIFIC, SELECTED metrics from both servers - in this case, to compare the size of the ANALIZA table

![alt text](images/prometheus-global.png)



        

          



