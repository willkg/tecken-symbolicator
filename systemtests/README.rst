======
README
======

This holds scripts for testing symbolication with Symbolicator using tools we
use for Tecken symbolication API testing.

Contents of this directory::

    bin/         -- directory of scripts
    data/        -- directory for test data


Setting up
==========

Set things up this way::

    $ make systemtests
    app@e62fb7ae586f:/app# cd systemtests
    app@e62fb7ae586f:/app/systemtests# ./setup_tests.sh

That creates files in directories under ``data/``.


Running scripts
===============

To run::

   $ make systemtests
   app@f09b3cdf8570:/app# cd systemtests/
