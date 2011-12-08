class GameStatus
  @@CLOSED   = {:id => 1, :name => 'Aberto'}.freeze
  @@OPEN     = {:id => 2, :nome => 'Fechado'}.freeze
  @@EMPTY     = {:id => 0, :nome => 'Não foi selecionado'}.freeze

  def self.all
    [@@CLOSED, @@OPEN]
  end

  def self.find_by_id(id)
    case id
    when @@CLOSED[:id] then
      return @@CLOSED
    when @@OPEN[:id] then
      return @@OPEN
    else
      return @@EMPTY # caso seja informado algum valor inexistente
    end
  end

  def self.closed
    @@CLOSED
  end
  
  def self.open
    @@OPEN
  end
end