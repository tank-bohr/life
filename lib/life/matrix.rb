# encoding: utf-8

module Life
  module Matrix
    extend self

    def walk(original_matrix)
      new_matrix = []
      original_matrix.each_index do |i|
        row = []
        original_matrix[i].each_index do |j|
          elem = yield i, j, original_matrix[i][j]
          row.push(elem)
        end
        new_matrix.push(row)
      end
      return new_matrix
    end
  end
end