#!/usr/bin/env python
from autogen.autogen import autogen

project = "KDSoap"
version = "1.5.1"
subprojects = ["KDSoapClient", "KDSoapServer"]
build_steps = ["generate-configure","generate-forward-headers"]
prefixed = False

autogen(project, version, subprojects, prefixed, steps = build_steps, policyVersion = 2)
