# monitoring
Lab for "AOM" Book  
  
## Introducing
We should monitoring data on all our hosts, and additional monitoring for specific use cases, like: databases or application server.  

#### Monitoring tool:  
* Is scalable and high-performing solution. Needs to be lightweight and not interfere with the actual running of hosts and applications.
* Can ship data quickly and avoid queuing important information that we need.
* Has a flexible monitoring interface that can collect a wide variety of data "**out of the box**" but also allow us to collect custom data that is less common or unique to our environment.
* Accommodates push-versus-pull architeture.

Basic set of monitoring will include:
* CPU
* Memory
* Load - The "system load"
* Swap
* Processes - Monitor both specific processes and processes counts, and identify "zombie" processes.
* Disk
* Network
