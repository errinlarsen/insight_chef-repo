Description
===========

Provides recipes for installing necessary packages

---
Requirements
============

---
Platform
========
centos

---
Attributes
==========
none

---
Usage
=====

Include early on in a nodes run list:

computron:~/myinfrastructure$ cat roles/base.rb 

name "base"
description "Base role applied to all nodes."
run_list(
  "recipe[packages::phase2]",
)

---
License and Author
==================

Author:: Errin Larsen (<elarsen@insightcards.com>)

Copyright:: 2011, Insight Card Services, LLC
