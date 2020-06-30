===================
Tecken Symbolicator
===================

**EXPERIMENT** Tecken has two symbolication API endpoints. This experiments
with standing up a separate GetSentry Symbolicator instance to do symbolication
instead.

This dockerizes Symbolicator in a way we can deploy and run locally.

* License: MPLv2
* Community Participation Guidelines: `<https://github.com/willkg/tecken-symbolicator/blob/main/CODE_OF_CONDUCT.md>`_


Usage
=====

1. ``make my.env`` and modify it if you like
1. ``make build`` to build the docker image
2. ``make run`` to run it


Documentation
=============

See Symbolicator docs: https://getsentry.github.io/symbolicator/
