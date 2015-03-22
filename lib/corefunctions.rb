module Corefunctions

  def findCircle(str)

		m = Mcircle.where(:number => str[0..3]).first

		return m
  end

  def isStd(first, second)

  	m1 = findCircle(first)
  	m2 = findCircle(second)

  	return m1.state != m2.state
  end

  def isSameNetwork(first, second)
  	m1 = findCircle(first)
  	m2 = findCircle(second)

  	return m1.network == m2.network
  end
end