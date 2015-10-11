type ('nonterminal, 'terminal) symbol =
  | N of 'nonterminal
  | T of 'terminal

let rec fun_gen rule_list result non_terminal = 
match rule_list with
[] -> result
|(first::rest) -> match first with
(lhs,rhs) -> if lhs == non_terminal then fun_gen rest (result@[rhs]) non_terminal
else fun_gen rest result non_terminal

let convert_grammar gram1 = 
match gram1 with
(a,b) -> (a, fun_gen b [])




let match_nothing frag derivation accept = None

let append_matchers matcher1 rhss matcher2 accept derivation frag =
  matcher1 rhss (fun frag1 -> matcher2 accept frag1) derivation frag

let rec make_appended_matchers onerhs productionf accept derivation frag = 
match onerhs with 
[] -> accept derivation frag (*base case*)
|(T headrhs)::tailrhs -> begin match frag with 
	[]->None
	|firstfrag::restfrag -> if headrhs = firstfrag then make_appended_matchers tailrhs productionf accept derivation restfrag
		else None
	end
|(N headrhs)::tailrhs -> match frag with
	[]->None
	|_->append_matchers (make_or_matchers headrhs productionf) (productionf headrhs) (make_appended_matchers tailrhs productionf) 
						accept derivation frag 		
and make_or_matchers start productionf = function
[] -> match_nothing
|firstrhs::restrhs -> 
	let head_matcher = make_appended_matchers firstrhs productionf 
	and tail_matcher = make_or_matchers start productionf restrhs 
	in fun accept derivation frag ->
		let ormatch = head_matcher accept (derivation@[(start, firstrhs)]) frag 
		in match ormatch with
			None -> tail_matcher accept derivation frag
			|Some (x,y) -> Some (x,y)
			
let parse_prefix (start, prodf) accept frag = make_or_matchers start prodf (prodf start) accept [] frag