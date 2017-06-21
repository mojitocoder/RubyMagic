RSpec.describe 'an array' do
    def build_array(*args)
        [*args]
    end
    
    puts self
    puts self.class
    puts

    describe 'a long array' do
        puts self.ancestors.first(2)
        puts self.class   
        puts
    end
    
    it 'has a length' do
        puts self
        puts self.class
        puts self.object_id
        puts

        raise unless build_array("a").length == 1
    end
    
    it 'has a first element' do
        puts self
        puts self.class
        puts self.object_id
        puts
        
        raise unless build_array("a").first == "a"
    end
    
end
