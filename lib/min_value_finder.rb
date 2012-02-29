class MinValueFinder

  def merge(sub_solutions)
 	raise NotImplementedError
  end 

  def split(problem)
  	raise NotImplementedError
  end 

  def is_base_case(problem)
  	raise NotImplementedError
  end 

  def solve_base(problem)
        raise NotImplementedError
  end


  def initialize(function, max_num_of_threads=370)
    @function = function
    @max_num_of_threads = max_num_of_threads
  end

  def min_on(range)
  	solve(range)	
  end

  def solve(problem)
	if (is_base_case(problem))
		solve_base(problem)
	else 
		subSolutions = []
		split(problem).each do |subProblem| 
			subSolutions.push(solve(subProblem))
		end    
		merge(subSolutions)
	end 
  end
end
