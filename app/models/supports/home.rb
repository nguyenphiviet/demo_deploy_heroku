class Supports::Home
  attr_reader :lastest_dishes, :popular_dishes

  def initialize lastest_dishes, popular_dishes
    @lastest_dishes = lastest_dishes
    @popular_dishes = popular_dishes
  end

  def lastest_dishes
    @lastest_dishes
  end

  def popular_dishes
    @popular_dishes
  end
end
