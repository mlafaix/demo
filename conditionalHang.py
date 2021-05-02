""" This library defines a keyword to throw if the value does not please. For TF2 core tests only. """

import sys

class conditionalHang:
	def __init__(self, targetValue):
		self.__targetValue=targetValue

	def hang_if_not(self, value):
		if self.__targetValue != value:
			raise sys.exit(251)
