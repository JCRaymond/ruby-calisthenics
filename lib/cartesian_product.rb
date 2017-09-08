class CartesianProduct
  include Enumerable

  def initialize(a, b)
    @a = a
    @b = b
  end

  def each
    @a.each { |ai| @b.each { |bi| yield [ai, bi] } }
  end
end
