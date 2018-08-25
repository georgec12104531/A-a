class PolyTreeNode
  attr_accessor :value, :parent, :children
  require "byebug"
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end 
    
  
  def parent=(par)
    #debugger
    # @parent == self.parent
    # if self.parent != nil 
    #   self.parent.children.delete(self)
    # end   
    # 
    # @parent = par
    # unless par.nil? || @parent.children.include?(self)
    # #if @parent.children.include?(self) == false 
    #   @parent.children << self
    #   #if child already exists dont add
    # 
    # end 
    
    old_par = self.parent
    old_par.children.delete(self) unless old_par.nil?
    
    @parent  = par
    
    par.children.push(self) unless par.nil?
  end
  
  def add_child(child)
    # 
    # if self.children.include?(child) == false 
    #   @children << child
    #   child.parent = self
    # end
    child.parent = self
  end 
  
  def remove_child(child)
    raise "error" if child.parent == nil
    
    self.children.delete(child)
    child.parent = nil
    
  end

  
  def dfs(target)
    # debugger
    return self if self.value == target
    
    children.each do |child_node|
      # return child_node if target == child_node.value
      # child_node.dfs(target) 
      search = child_node.dfs(target)
      return search unless search.nil?
    end
    nil
  end
  
  # def inspect
  #   # "Value: #{self.value}, Parent: #{self.parent}"
  #   "#<PolyTreeNode Value = #{value}>"
  # end
  
  
end