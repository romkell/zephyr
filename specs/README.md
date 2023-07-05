Quick sandbox intro
===================

This is a quick sandbox for evaluating and using sphinx-needs as the Zephyr OS requirements tool.

A similar approach can be taken for StrictDoc.

The Sandbox shall show the features and limitations of the tool and how
well it fit into the Zephyr OS environment and workflow.

devcontainer.json
-----------------

Use the latest docker image:

	"image": "danwos/sphinxneeds-latexpdf:latest",

The remote user is:

	"remoteUser": "dockeruser",

Use bash:

	"remoteEnv": {"SHELL":"/bin/bash"},

The workspace mount point and the workspace folder depend on where you place local copy of the github repo or if you fork your own very likely at least replace `romkell` with your own.

	"workspaceMount": "source=${localWorkspaceFolder}/..,target=/home/user/workspace/zephyr-safety/romkell,type=bind,consistency=delegated",
	"workspaceFolder": "/home/user/workspace/zephyr-safety/romkell/zephyr"


settings.json
-------------

Settings requried for sphinx-needs. The very same settings are available in vscodes preferences under sphinx-needs.
Not so sure at the moment, which actually rule.

    "sphinx-needs.needsJson": "${workspaceFolder}/specs/build/needs.json",
    "sphinx-needs.srcDir": "${workspaceFolder}/specs"

docker image
------------

The sphinx-needs docker image does not contain git or any zephyr development relevant tools.
In order to get git in the image:

    sudo apt-get update
    sudo apt-get install git

A productive environment solution for Zephyr would very likely use the existing zephyr docker image augmented with the requirements tools installed.


Build the needs json
--------------------

    sphinx-build -b needs ./specs ./specs/build

Build the html
--------------

    sphinx-build -M html ./specs ./specs/build
