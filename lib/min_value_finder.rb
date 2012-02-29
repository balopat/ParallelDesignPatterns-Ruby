class MinValueFinder

  def merge(sub_solutions)
	sub_solutions.min
  end 

  def split(problem)
  	problem.each_slice(problem.to_a.length/2)
  end 

  def is_base_case(problem)
  	problem.to_a.length == 1

  end 

  def solve_base(problem)
       @function.call(problem.to_a[0]) 
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
