#module Plugin
  #def run
    #results = {}
    #load_methods.each do |meth|
      #results[meth] = self.public_send(meth)
    #end
    #results
  #end  

  #private
  #def load_methods
    ##(methods.sort - Object.methods).delete_if { |x| x == :run }
    #self.class.instance_methods(false)
  #end
#end
