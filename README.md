# gnmi-testing
A repository for GNMI testing

Most of the code is taken on openconfig gnmi testing. This repo is turned for our testing.
This repository will be open-sourced and available to public.

In a nutshell, a developer can define a proto, generate the pb config and load into GNMI
server so clients can connect and get the data as needed.
So far get and poll mode works.

To start the server, run the run.sh script in the fake_server directory. This assumes we have
built the server. A simple go build should build the server.


