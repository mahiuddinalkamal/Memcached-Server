# MemcachedServer
An assignment of automated performance measurement of Memcached Server using Dude benchmark @TU Dresden.

# Systems Engineering I - Assignment #2 #

In order to complete the tasks below, please fill the gaps code wise in the files given in the repository. Note: You can use any favorite editor or IDE to accomplish those tasks.

### Task ###

##### Container #1: #####
* Base image: Ubuntu 16.04 LTS
* SSH Server
* memcached v1.4.33 (build from source)
* Expose ports for SSH Server and memcached (for other container)
* Run container as user Ubuntu (id=1000) instead of root

##### Container #2: #####
* Base image: Ubuntu 16.04 LTS
* SSH Server – expose port to external port 10022
* memcached benchmark client (mcperf)
* Dude & R
* Run container as user Ubuntu (id=1000) instead of root
* Add my ssh public key in addition to yours – see below


##### Docker compose #####
* Use Docker compose to get the communication between the containers running as well as the experiment.

##### The experiment script/work flow #####
* ```dude run```:
* ssh to the memcached server (container #1) to launch memcached
* Launch the benchmark client (locally - container #2)
* Grab the output from the benchmark client using cut etc. magic: "Response rate", "Response time [ms] avg" - Dude dimensions: rate 
* ```dude sum```: summarizes the output - single csv file
* The plot the graphs ```$ Rscript ….R```

Test it using the following command sequence:
```
#!/bin/bash

sudo docker-compose up -d
ssh ubuntu@127.0.0.1 -p 10022 "./run.sh"
scp -P 10022 ubuntu@127.0.0.1:~/graph*.pdf .
evince graph*.pdf
sudo docker-compose down
```

### General Notes ###
* Solutions must be turned in no later than **11:59pm AOE, 23rd of Dec‘19!** No late days or other excuses.
* Commit & PUSH!!! to your bitbucket repository before the deadline. Don't forget the push.
* No team work. We check for plagarism and will let you fail if there is an indication given.
* Ask questions at [auditorium](https://auditorium.inf.tu-dresden.de) if there are any.

My ssh-public-key:
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMMTIri0+9athLz2rqBjz25/IY5NNAZbxqCv4PhQZQsckXhWVzMSwsouryiA+JAgN/lFLaOrJGYQGNB4dzQF+fK8zn9LSspj0HORe2U8fbQNWm0h7MzzDGU0nF8zN1Wy6wCQ9IreSB4tE/C785ApPQnY0YVLJN+y2xA1tQFOXpNOihHH6Mc6Kray48HGvmLKw1u4cmeXpTXUlpDEHjfwcxG4PN16vaO4vvWJEpDLNBv+O2lY/Fn2Qt/JqSBhOeTVSXLkbYqfhCq7q6YyVBEKszNX+Jq/UPIkJoeMiMNNzdJ9zYfDo+2nGzLirBI6JTwo87vsPiljGYnBM47E4bX2Gc8JNbXFXXf9yqKggmlDqKDEHmX0GbPHPhG79OFG5MFXPfjrsJs3k5kZiiIKhaxqRzfNMJ9Ij4Bs1b2m+cU/DNCOCckvypmY6fdN+GMuB03aE1cqxEZOyGk9XW4o9GYN95TwreR4R7feaxlz6OHcMC1JRQzdMotZA3XW67HzftR7kuhe3PXfLmMNQM9P7mRrVvZBJcQnxUYt+nFBhjkWztQtRMvSNlDHU7TgpDxoHSE3gyxetPfbitkRelnK0mhl5uSjZKCppYx1IVXzSTsM/5ZsPNNa7H9crP+7AQ591BO0bIoDkBIPRTSBKY6vAdWk3kCQ5JT23z70yrpFbNyAHzzw== wojciech.ozga@tu-dresden.de
```

