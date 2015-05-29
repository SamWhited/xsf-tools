import os

from setuptools import setup
from xeputils import __version__


setup(
    name='xeputils',
    version=__version__,
    description='Utilities for generating XEPs',
    url='http://xmpp.org',
    packages=['xeputils'],
    tests_require=[
        'pytest >= 3.7.1',
        'tox >= 2.0.1'
    ]
)
