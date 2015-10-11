; CS161 Hw3: Sokoban
; 
; 
; Bolun Hu UID: 104056403
; *********************
; READ THIS FIRST
; *********************
;
; All functions that you need to modify are marked with 'EXERCISE' in their header comments.
; Do not modify a-star.lsp.
; This file also contains many helper functions. You may call any of them in your functions.
;
; *Warning*: The provided A* code only supports the maximum cost of 4999 for any node.
; That is f(n)=g(n)+h(n) < 5000. So, be careful when you write your heuristic functions.
; Do not make them return anything too large.
;
; For Allegro Common Lisp users: The free version of Allegro puts a limit on memory.
; So, it may crash on some hard sokoban problems and there is no easy fix (unless you buy
; Allegro).
; Of course, other versions of Lisp may also crash if the problem is too hard, but the amount
; of memory available will be relatively more relaxed.
; Improving the quality of the heuristic will mitigate this problem, as it will allow A* to
; solve hard problems with fewer node expansions.
;
; In either case, this limitation should not significantly effect your grade.
;
; Remember that most functions are not graded on efficiency (only correctness).
; Efficiency can only influence your heuristic performance in the competition (which will
; effect your score).
;
;

(defun abs-defined (val)
  (if (< val 0)
      (* val -1)
      val))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; General utility functions
; They are not necessary for this homework.
; Use/modify them for your own convenience.
;

;
; For reloading modified code.
; I found this easier than typing (load "filename") every time.
;
(defun reload()
  (load "hw3.lsp")
  )

;
; For loading a-star.lsp.
;
(defun load-a-star()
  (load "a-star.lsp"))

;
; Reloads hw3.lsp and a-star.lsp
;
(defun reload-all()
  (reload)
  (load-a-star)
  )

;
; A shortcut function.
; goal-test and next-states stay the same throughout the assignment.
; So, you can just call (sokoban <init-state> #'<heuristic-name>).
;
;
(defun sokoban (s h)
  (a* s #'goal-test #'next-states h)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; end general utility functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; We now begin actual Sokoban code
;

; Define some global variables
(setq blank 0)
(setq wall 1)
(setq box 2)
(setq keeper 3)
(setq star 4)
(setq boxstar 5)
(setq keeperstar 6)

; Some helper functions for checking the content of a square
(defun isBlank (v)
  (= v blank)
  )

(defun isWall (v)
  (= v wall)
  )

(defun isBox (v)
  (= v box)
  )

(defun isKeeper (v)
  (= v keeper)
  )

(defun isStar (v)
  (= v star)
  )

(defun isBoxStar (v)
  (= v boxstar)
  )

(defun isKeeperStar (v)
  (= v keeperstar)
  )

;
; Helper function of getKeeperPosition
;
(defun getKeeperColumn (r col)
  (cond ((null r) nil)
        (t (if (or (isKeeper (car r)) (isKeeperStar (car r)))
         col
         (getKeeperColumn (cdr r) (+ col 1))))))
;
; getKeeperPosition (s firstRow)
; Returns a list indicating the position of the keeper (r c).
;
; Assumes that the keeper is in row >= firstRow.
; The top row is the zeroth row.
; The first (right) column is the zeroth column.
;
(defun getKeeperPosition (s row)
  (cond ((null s) nil)
        (t (let ((x (getKeeperColumn (car s) 0)))
         (if x
                 ;keeper is in this row
                 (list row x)
                 ;otherwise move on
                 (getKeeperPosition (cdr s) (+ row 1)))))))

;
; cleanUpList (l)
; returns l with any NIL element removed.
; For example, if l is '(1 2 NIL 3 NIL), returns '(1 2 3).
;
(defun cleanUpList (L)
  (cond ((null L) nil)
        (t (let ((cur (car L))
                 (res (cleanUpList (cdr L)))
                 )
         (if cur
                 (cons cur res)
                 res
                 )
         );end let
         );end t
        );end cond
  );end

; EXERCISE: Modify this function to return true (t)
; if and only if s is a goal state of a Sokoban game.
; (no box is on a non-goal square)
;
; Currently, it always returns NIL. If A* is called with
; this function as the goal testing function, A* will never
; terminate until the whole search space is exhausted.
;
(defun goal-test (s)
  (not (checkBoxExist s 0)))

;
; Helper function of checkBoxExist
;
(defun getBoxColumn (r col)
  (cond ((null r) nil)
        (t (cond ((or (isBox (car r))) col)
                 (t (getBoxColumn (cdr r) (+ col 1)))))))

;
; checkBoxExist (s firstRow)
; Returns the location (r c) of the first box it encounters in s, or nil if there is no non-goal box.

; The top row is the zeroth row.
; The first (right) column is the zeroeth column
;
(defun checkBoxExist (s row)
  (cond ((null s) nil)
        (t (let ((x (getBoxColumn (car s) 0)))
         (cond (x (list row x)) ;keeper is in this row
                 (t (checkBoxExist (cdr s) (+ row 1)))))))) ;otherwise move on

; EXERCISE: Modify this function to return the list of
; sucessor states of s.
;
; This is the top-level next-states (successor) function.
; Some skeleton code is provided below.
; You may delete them totally, depending on your approach.
;
; If you want to use it, you will need to set 'result' to be
; the set of states after moving the keeper in each of the 4 directions.
; A pseudo-code for this is:
;
; ...
; (result (list (try-move s UP) (try-move s DOWN) (try-move s LEFT) (try-move s RIGHT)))
; ...
;
; You will need to define the function try-move and decide how to represent UP,DOWN,LEFT,RIGHT.
; Any NIL result returned from try-move can be removed by cleanUpList.

;=======================================
(defun get-square(S r c)   ;get-square returns the value at given coordinate
   (cond ((null S) nil)
           ((< r 0) 1)
           ((< c 0) 1)
         ((> r (- (length S) 1)) 1)
         ((> c (- (length (car S)) 1)) 1) 
	 (t (car (nthcdr c (car (nthcdr r S)))))
    )
 )

; sets the value of the square at row r and column c in s to new-item
;========================================
(defun set-square(S r c v)  ;my method is to change only small portion of the state, and connect the unchanged portions with the updated portion together 
   (cond ((null S) nil)     ;using append
           ((< r 0) S)
           ((< c 0) S)
         ((< (- (length S) 1) r) S)
         ((< (- (length (car S)) 1) c) S)
	  (t (append (append (getFirstR S (- r 1)) (list (change (car(nthcdr r S)) c v))) (nthcdr (+ r 1) S)))
    )
 )

(defun getFirstR (S r)   ;this function returns the unchanged rows before our target row
    (cond ((null S) nil)
          ((< r 0) nil)
          ((= r 0) (list (car S)))
	  (t (cons (car S) (getFirstR(cdr S) (- r 1))))
     )
)

(defun change (L c v)   ;this function updates the targeted row with given parameters
   (cond ((null L) nil)
         ((> c (length L)) nil)
	 ((= c 0) (append (list v) (cdr L)))
	 (t (cons (car L) (change (cdr L) (- c 1) v)))
    )
)
;============================================
(defun try-move (s dir)                       ;i implement try-move by implementing a helper functions: tryMoveAux which takes in a list of 3 parameters. 
  (let* ((keeperPos (getKeeperPosition s 0))  ;if tryMoveAux returns a valid list that indicates how to update the map, then we update, else the move is invalid 
         (r (car keeperPos))			;and we return nil
         (c (car (cdr keeperPos)))
         (keeperVal (get-square s r c))
         (posToBeUpdated (tryMoveAux
				     (cons keeperVal
					   (cond ((equal dir "S") (list (get-square s (+ r 1) c) (get-square s (+ r 2) c)))
						 ((equal dir "N") (list (get-square s (- r 1) c) (get-square s (- r 2) c)))
						 ((equal dir "W") (list (get-square s r (- c 1)) (get-square s r (- c 2))))
						 ((equal dir "E") (list (get-square s r (+ c 1)) (get-square s r (+ c 2)))))
			              )
			  )
		  )
         )
    (cond ((null posToBeUpdated) nil)  ;if tryMoveAux failed, then we don't move
          (t (updateMap s r c dir posToBeUpdated)))  ;else, we move and do the corresponding update in game map
   )
)



(defun tryMoveAux (posToBeUpdated)         ;posToBeUpdated is a 3 tuple. What is holds is the current value in keeper's position; the value of next position that
  (let ((updatedPos                        ;the keeper, if could, will be going to; and the value of the position, in the same direction as the previous one, 
         (let* ((a (first posToBeUpdated)) ;but with 2 unit distance from keeper's current position
                (b (second posToBeUpdated))
                (c (third posToBeUpdated))
                (updateLastKeeperPos (cond ((equal a 3) 0)
                                 (t 4))))
         (cond ((or (equal wall b) (equal nil b))   ;if next position keeper will go to is wall or outside of map, don't move and return nil
                 nil)
                 ((equal 0 b)   ;if next position is valid as blank, then do the corresponding update
                                (set-square (set-square (list posToBeUpdated) 0 1 3) 0 0 updateLastKeeperPos))
		 ((equal 4 b)   ;if next position is valid as goal, then do the corresponding update
                                (set-square (set-square (list posToBeUpdated) 0 1 6) 0 0 updateLastKeeperPos))
                 ((equal 2 b)   ;if next position is valid as box, then do the corresponding update
				(cond ((equal 0 c) (set-square (set-square (set-square (list posToBeUpdated) 0 1 3) 0 0 updateLastKeeperPos) 0 2 box))
				      ((equal 4 c) (set-square (set-square (set-square (list posToBeUpdated) 0 1 3) 0 0 updateLastKeeperPos) 0 2 5))
                                      (t nil)))
                 ((equal 5 b)   ;if next position is valid as boxstar, then do the corresponding update
				(cond ((equal 0 c) (set-square (set-square (set-square (list posToBeUpdated) 0 1 6) 0 0 updateLastKeeperPos) 0 2 box))
				      ((equal 4 c) (set-square (set-square (set-square (list posToBeUpdated) 0 1 6) 0 0 updateLastKeeperPos) 0 2 5))
				      (t nil)))
                 (t nil))  ;otherwise always return nil
         )
        ))
    (car updatedPos)  ;finally function returns either a valid list of three parameters indicating what to update, or it returns nil and suggests try-move to do nothing
   )
)



(defun updateMap (s r c dir posToBeUpdated)  ;updateMap takes in the list created by tryMoveAux, and do the corresponding update in the game map
  (let* ((firstPos (first posToBeUpdated))
        (secondPos (second posToBeUpdated))
        (thirdPos (third posToBeUpdated))
        (curPosUpdated (set-square s r c firstPos)) ;update the current position
	) 
    (cond ((equal dir "N") (set-square (set-square curPosUpdated (- r 2) c thirdPos) (- r 1) c secondPos)) ;according to the given moving direction,
         ((equal dir "S") (set-square (set-square curPosUpdated (+ r 2) c thirdPos) (+ r 1) c secondPos))  ;do update accordingly
         ((equal dir "W") (set-square (set-square curPosUpdated r (- c 2) thirdPos) r (- c 1) secondPos))
         ((equal dir "E") (set-square (set-square curPosUpdated r (+ c 2) thirdPos) r (+ c 1) secondPos))
     )
   )
)

        
(defun next-states (s)   ;next-states function
  (let* ((rawList (list (try-move s "N") (try-move s "S") (try-move s "W") (try-move s "E"))))
    (cleanUpList rawList)
   )
)
;===================================================================================================================
; EXERCISE: Modify this function to compute the trivial
; admissible heuristic.
;
(defun h0 (s)
  0)

; EXERCISE: Modify this function to compute the
; number of misplaced boxes in s.
;
; Yes, it is admissable. Since number of least moves must be larger than the number of mis-positioned boxes, even when box is only one unit dist from goal.
; We can prove it formally using induction.
(defun h1 (s)
  (h1-helper s 0))

; A helper for h1 to count the number of boxes
(defun h1-helper (s accum)
  (cond ((null s) accum)
        (t (h1-helper (cdr s) (+ accum (count box (car s)))))))

; EXERCISE: Change the name of this function to h<UID> where
; <UID> is your actual student ID number. Then, modify this
; function to compute an admissible heuristic value of s.
;
; This function will be entered in the competition.
; Objective: make A* solve problems as fast as possible.
; The Lisp 'time' function can be used to measure the
; running time of a function call.
;
;==============================================================================
(defun processSingleBox-Aux (box goals minDist curMinGoal remainGoalList) ;this helper function basically compares every goal with the box, and finally gives 
    (cond ((null goals) (cons minDist remainGoalList))			  ;out the min distance and corresponding goal
          (t (let* ((curGoal (car goals))
                    (checkDistance (manhattanDist box curGoal)))
               (cond ((< checkDistance minDist) (processSingleBox-Aux box (cdr goals) checkDistance curGoal (cons curMinGoal remainGoalList))) 
                     (t (processSingleBox-Aux box (cdr goals) minDist curMinGoal (cons curGoal remainGoalList)))
	        )
	      )
	  )
     )
)

(defun processSingleBox (box goals) ; this function returns a list of single box's minimum distance to any of the goals, and a list of remaining goals
  (processSingleBox-Aux box (cdr goals) (manhattanDist box (car goals)) (car goals) '()))

;==============================================================================
(defun processAllBox-Aux (boxes goals totalDist)   ;this helper function adds up all the boxes' min distance to a certain goal 
    (cond ((null boxes) totalDist)		   ;by doing process Single Box on every box
          (t (let* (
	            (L (processSingleBox (car boxes) goals))
                    (curDist (car L))
                    (goalsLeft (cdr L))
		    )
               (processAllBox-Aux (cdr boxes) goalsLeft (+ curDist totalDist))
	      )
	   )
     )
)


(defun processAllBox (boxes goals)    ;this function computes the the total distance of all the box's min distance to a goal. This function should be an admissible
    (processAllBox-Aux boxes goals 0) ;heuristic function since we assume keeper's distance to every box is 0, which is surely less than the real situation
)

;==============================================================================

(defun maxBoxDist-Aux (boxes row col curMax)  ;helper function simply iterates through all the boxes and gives out the box being the farest
       (cond ((null boxes) curMax)
          (t (maxBoxDist-Aux (cdr boxes) row col (max curMax (manhattanDist (car boxes) (cons row col))))
	   )
	)
)

(defun maxBoxDist (boxes row col) ;this function gives the farest box from the given point
    (maxBoxDist-Aux boxes row col 0)
 )

;==============================================================================

(defun manhattanDist (p1 p2) ;simple function that computes the manhattan distance between two points in the map
  (+ (abs-defined (- (car p1) (car p2))) (abs-defined (- (cdr p1) (cdr p2))))
)

;==============================================================================

(defun detectBoxGoal-singleRow (r c thisRow boxes goals)  ;this function scans through a certain row in map, and returns a list of 
  (cond ((null r) (cons boxes goals))			  ;two lists: one storing coordinates of boxes, one storing coordinates of goals
        (t (cond ((isBox (car r)) 
                  (detectBoxGoal-singleRow (cdr r) (+ c 1) thisRow (cons (cons thisRow c) boxes) goals))
                 (t (cond ((or (isStar (car r)) (isKeeperStar (car r)))
                           (detectBoxGoal-singleRow (cdr r) (+ c 1) thisRow boxes (cons (cons thisRow c) goals)))
                          (t 
                             (detectBoxGoal-singleRow (cdr r) (+ c 1) thisRow boxes goals)
			   )
	             )
		  )
	    )
	 )
   )
)


(defun detectBoxGoal-Aux (s row boxes goals)   ;using the above singleRow function to scan through all the rows, 
  (cond ((null s) (cons boxes goals))          ;and gives us the coordinates for all boxes and goals
        (t (let ((detectedItem (detectBoxGoal-singleRow (car s) 0 row boxes goals)))
             (detectBoxGoal-Aux (cdr s) (+ row 1) (car detectedItem) (cdr detectedItem))
	    )
	 )
   )
)


(defun detectAllBoxGoal (S)   ;this function returns a list of two lists: one containing coordinates of all box, one containing coordinates of all goals
  (detectBoxGoal-Aux S 0 '() '())
)


;==============================================================================

(defun detectThemAll-singleRow (s c thisRow boxes goals keeperPos) ;this function scans through a certain row in map, and returns a list of
  (cond ((null s) (cons boxes (cons goals keeperPos)))		   ;three lists: one storing coordinates of boxes, one storing coordinates of goals, one for keeper
        ((isBox (car s)) (detectThemAll-singleRow (cdr s) (+ c 1) thisRow (cons (cons thisRow c) boxes) goals keeperPos))
        ((and (null keeperPos) 
              (or (isKeeper (car s)) 
                  (isKeeperStar (car s))))
         (detectThemAll-singleRow s c thisRow boxes goals (cons thisRow c)))
        (t (cond ((or (isStar (car s)) (isKeeperStar (car s)))
                  (detectThemAll-singleRow (cdr s) (+ c 1) thisRow boxes (cons (cons thisRow c) goals) keeperPos))
                 (t 
                  (detectThemAll-singleRow (cdr s) (+ c 1) thisRow boxes goals keeperPos)
		  )
	    )
	 )
   )
)



(defun detectThemAll-Aux (s row boxes goals keeperPos)  ;using the above singleRow function to scan through all the rows,
  (cond ((null s) (cons boxes (cons goals keeperPos)))  ;and gives us the coordinates for all boxes and goals, and keeper
        (t (let ((L (detectThemAll-singleRow (car s) 0 row boxes goals keeperPos)))
             (detectThemAll-Aux (cdr s) (+ row 1) (car L) (car (cdr L)) (cdr (cdr L)))
	    )
	 )
   )
)



(defun detectThemAll (State) ;this function returns a list of 3 lists: one containing coordinates of all box, one containing coordinates of all goals, one for keeper
  (detectThemAll-Aux State 0 '() '() '())
 )

;==============================================================================

(defun ifAtCorner (s box)  ;this function checks a certain box of whether being stucked in a corner
  (let* ((row (car box))
         (col (cdr box))
	 (North (get-square s (- row 1) col))
	 (East (get-square s row (+ col 1)))
	 (West (get-square s row (- col 1)))
	 (South (get-square s (+ row 1) col))
         (NorthWest (get-square s (- row 1) (- col 1)))
         (NorthEast (get-square s (- row 1) (+ col 1)))         
         (SouthEast (get-square s (+ row 1) (+ col 1)))         
         (SouthWest (get-square s (+ row 1) (- col 1)))
         )
    (or (and (ifBoxOrWall West) (ifBoxOrWall NorthWest) (ifBoxOrWall North))
        (and (ifBoxOrWall North) (ifBoxOrWall NorthEast)  (ifBoxOrWall East))
        (and (ifBoxOrWall East)  (ifBoxOrWall SouthEast) (ifBoxOrWall South))
        (and (ifBoxOrWall South) (ifBoxOrWall SouthWest) (ifBoxOrWall West)))
     ) 
)


(defun ifAnyStuckBox (s boxes)  ;this function, using the above function, iterates through all boxes and checks if anyone of them is stucked. 
  (if (null boxes)		;returns true if so.
      nil
      (or (ifAtCorner s (car boxes)) (ifAnyStuckBox s (cdr boxes)))
   )
)

;================================================================================================

(defun ifBoxOrWall (n)  ;this small helper function checks if a point in map is a box or wall; returns true if so, nil otherwise
    (or (eq 1 n) (eq 5 n) (eq 2 n))
 )

;==============================================================================

(defun h104056403 (s)    ;this heuristic function consists of 3 major components: 1. total distance that sums every box's distance to its closest goal
  (let* (									; 2. distance between the keeper and the farest box from keeper
         (BGKList (detectThemAll s))						; 3. if there is any stucked box, if so, there is no solution,
         (boxList (car BGKList))						;    and we can add a relatively big number to the heuristic, in my case, 300
         (goalList (car (cdr BGKList)))
         (keeperPos (cdr (cdr BGKList)))
	 )
     (+ (processAllBox boxList goalList)                     ;(1)
        (maxBoxDist boxList (car keeperPos) (cdr keeperPos)) ;(2)
        (cond ((ifAnyStuckBox s boxList) 300)                ;(3)
               (t 0)
         )
      )
   )
) 

;================================================================================================


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
| Some predefined problems.
| Each problem can be visualized by calling (printstate <problem>). For example, (printstate p1).
| Problems are ordered roughly by their difficulties.
| For most problems, we also privide 2 additional number per problem:
| 1) # of nodes expanded by A* using our next-states and h0 heuristic.
| 2) the depth of the optimal solution.
| These numbers are located at the comments of the problems. For example, the first problem below
| was solved by 80 nodes expansion of A* and its optimal solution depth is 7.
|
| Your implementation may not result in the same number of nodes expanded, but it should probably
| give something in the same ballpark. As for the solution depth, any admissible heuristic must
| make A* return an optimal solution. So, the depths of the optimal solutions provided could be used
| for checking whether your heuristic is admissible.
|
| Warning: some problems toward the end are quite hard and could be impossible to solve without a good heuristic!
|
|#

;(80,7)
(setq p1 '((1 1 1 1 1 1)
         (1 0 3 0 0 1)
         (1 0 2 0 0 1)
         (1 1 0 1 1 1)
         (1 0 0 0 0 1)
         (1 0 0 0 4 1)
         (1 1 1 1 1 1)))

;(110,10)
(setq p2 '((1 1 1 1 1 1 1)
         (1 0 0 0 0 0 1)
         (1 0 0 0 0 0 1)
         (1 0 0 2 1 4 1)
         (1 3 0 0 1 0 1)
         (1 1 1 1 1 1 1)))

;(211,12)
(setq p3 '((1 1 1 1 1 1 1 1 1)
         (1 0 0 0 1 0 0 0 1)
         (1 0 0 0 2 0 3 4 1)
         (1 0 0 0 1 0 0 0 1)
         (1 0 0 0 1 0 0 0 1)
         (1 1 1 1 1 1 1 1 1)))

;(300,13)
(setq p4 '((1 1 1 1 1 1 1)
         (0 0 0 0 0 1 4)
         (0 0 0 0 0 0 0)
         (0 0 1 1 1 0 0)
         (0 0 1 0 0 0 0)
         (0 2 1 0 0 0 0)
         (0 3 1 0 0 0 0)))

;(551,10)
(setq p5 '((1 1 1 1 1 1)
         (1 1 0 0 1 1)
         (1 0 0 0 0 1)
         (1 4 2 2 4 1)
         (1 0 0 0 0 1)
         (1 1 3 1 1 1)
         (1 1 1 1 1 1)))

;(722,12)
(setq p6 '((1 1 1 1 1 1 1 1)
         (1 0 0 0 0 0 4 1)
         (1 0 0 0 2 2 3 1)
         (1 0 0 1 0 0 4 1)
         (1 1 1 1 1 1 1 1)))

;(1738,50)
(setq p7 '((1 1 1 1 1 1 1 1 1 1)
         (0 0 1 1 1 1 0 0 0 3)
         (0 0 0 0 0 1 0 0 0 0)
         (0 0 0 0 0 1 0 0 1 0)
         (0 0 1 0 0 1 0 0 1 0)
         (0 2 1 0 0 0 0 0 1 0)
         (0 0 1 0 0 0 0 0 1 4)))

;(1763,22)
(setq p8 '((1 1 1 1 1 1)
         (1 4 0 0 4 1)
         (1 0 2 2 0 1)
         (1 2 0 1 0 1)
         (1 3 0 0 4 1)
         (1 1 1 1 1 1)))

;(1806,41)
(setq p9 '((1 1 1 1 1 1 1 1 1)
         (1 1 1 0 0 1 1 1 1)
         (1 0 0 0 0 0 2 0 1)
         (1 0 1 0 0 1 2 0 1)
         (1 0 4 0 4 1 3 0 1)
         (1 1 1 1 1 1 1 1 1)))

;(10082,51)
(setq p10 '((1 1 1 1 1 0 0)
         (1 0 0 0 1 1 0)
         (1 3 2 0 0 1 1)
         (1 1 0 2 0 0 1)
         (0 1 1 0 2 0 1)
         (0 0 1 1 0 0 1)
         (0 0 0 1 1 4 1)
         (0 0 0 0 1 4 1)
         (0 0 0 0 1 4 1)
         (0 0 0 0 1 1 1)))

;(16517,48)
(setq p11 '((1 1 1 1 1 1 1)
         (1 4 0 0 0 4 1)
         (1 0 2 2 1 0 1)
         (1 0 2 0 1 3 1)
         (1 1 2 0 1 0 1)
         (1 4 0 0 4 0 1)
         (1 1 1 1 1 1 1)))

;(22035,38)
(setq p12 '((0 0 0 0 1 1 1 1 1 0 0 0)
         (1 1 1 1 1 0 0 0 1 1 1 1)
         (1 0 0 0 2 0 0 0 0 0 0 1)
         (1 3 0 0 0 0 0 0 0 0 0 1)
         (1 0 0 0 2 1 1 1 0 0 0 1)
         (1 0 0 0 0 1 0 1 4 0 4 1)
         (1 1 1 1 1 1 0 1 1 1 1 1)))

;(26905,28)
(setq p13 '((1 1 1 1 1 1 1 1 1 1)
         (1 4 0 0 0 0 0 2 0 1)
         (1 0 2 0 0 0 0 0 4 1)
         (1 0 3 0 0 0 0 0 2 1)
         (1 0 0 0 0 0 0 0 0 1)
         (1 0 0 0 0 0 0 0 4 1)
         (1 1 1 1 1 1 1 1 1 1)))

;(41715,53)
(setq p14 '((0 0 1 0 0 0 0)
         (0 2 1 4 0 0 0)
         (0 2 0 4 0 0 0)        
         (3 2 1 1 1 0 0)
         (0 0 1 4 0 0 0)))

;(48695,44)
(setq p15 '((1 1 1 1 1 1 1)
         (1 0 0 0 0 0 1)
         (1 0 0 2 2 0 1)
         (1 0 2 0 2 3 1)
         (1 4 4 1 1 1 1)
         (1 4 4 1 0 0 0)
         (1 1 1 1 0 0 0)
         ))

;(91344,111)
(setq p16 '((1 1 1 1 1 0 0 0)
         (1 0 0 0 1 0 0 0)
         (1 2 1 0 1 1 1 1)
         (1 4 0 0 0 0 0 1)
         (1 0 0 5 0 5 0 1)
         (1 0 5 0 1 0 1 1)
         (1 1 1 0 3 0 1 0)
         (0 0 1 1 1 1 1 0)))

;(3301278,76)
(setq p17 '((1 1 1 1 1 1 1 1 1 1)
         (1 3 0 0 1 0 0 0 4 1)
         (1 0 2 0 2 0 0 4 4 1)
         (1 0 2 2 2 1 1 4 4 1)
         (1 0 0 0 0 1 1 4 4 1)
         (1 1 1 1 1 1 0 0 0 0)))

;(??,25)
(setq p18 '((0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0)
         (0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0)
         (1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1)
         (0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0)
         (0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0)
         (0 0 0 0 0 0 0 0 3 0 0 0 0 0 0 0)
         (0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0)
         (0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 0)
         (1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1)
         (0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0)
         (0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0)
         (0 0 0 0 1 0 0 0 0 0 4 1 0 0 0 0)
         (0 0 0 0 1 0 2 0 0 0 0 1 0 0 0 0)        
         (0 0 0 0 1 0 2 0 0 0 4 1 0 0 0 0)
         ))
;(??,21)
(setq p19 '((0 0 0 1 0 0 0 0 1 0 0 0)
         (0 0 0 1 0 0 0 0 1 0 0 0)
         (0 0 0 1 0 0 0 0 1 0 0 0)
         (1 1 1 1 0 0 0 0 1 1 1 1)
         (0 0 0 0 1 0 0 1 0 0 0 0)
         (0 0 0 0 0 0 3 0 0 0 2 0)
         (0 0 0 0 1 0 0 1 0 0 0 4)
         (1 1 1 1 0 0 0 0 1 1 1 1)
         (0 0 0 1 0 0 0 0 1 0 0 0)
         (0 0 0 1 0 0 0 0 1 0 0 0)
         (0 0 0 1 0 2 0 4 1 0 0 0)))

;(??,??)
(setq p20 '((0 0 0 1 1 1 1 0 0)
         (1 1 1 1 0 0 1 1 0)
         (1 0 0 0 2 0 0 1 0)
         (1 0 0 5 5 5 0 1 0)
         (1 0 0 4 0 4 0 1 1)
         (1 1 0 5 0 5 0 0 1)
         (0 1 1 5 5 5 0 0 1)
         (0 0 1 0 2 0 1 1 1)
         (0 0 1 0 3 0 1 0 0)
         (0 0 1 1 1 1 1 0 0)))

;(??,??)
(setq p21 '((0 0 1 1 1 1 1 1 1 0)
         (1 1 1 0 0 1 1 1 1 0)
         (1 0 0 2 0 0 0 1 1 0)
         (1 3 2 0 2 0 0 0 1 0)
         (1 1 0 2 0 2 0 0 1 0)
         (0 1 1 0 2 0 2 0 1 0)
         (0 0 1 1 0 2 0 0 1 0)
         (0 0 0 1 1 1 1 0 1 0)
         (0 0 0 0 1 4 1 0 0 1)
         (0 0 0 0 1 4 4 4 0 1)
         (0 0 0 0 1 0 1 4 0 1)
         (0 0 0 0 1 4 4 4 0 1)
         (0 0 0 0 1 1 1 1 1 1)))

;(??,??)
(setq p22 '((0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0)
         (0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0)
         (0 0 0 0 1 2 0 0 1 0 0 0 0 0 0 0 0 0 0)
         (0 0 1 1 1 0 0 2 1 1 0 0 0 0 0 0 0 0 0)
         (0 0 1 0 0 2 0 2 0 1 0 0 0 0 0 0 0 0 0)
         (1 1 1 0 1 0 1 1 0 1 0 0 0 1 1 1 1 1 1)
         (1 0 0 0 1 0 1 1 0 1 1 1 1 1 0 0 4 4 1)
         (1 0 2 0 0 2 0 0 0 0 0 0 0 0 0 0 4 4 1)
         (1 1 1 1 1 0 1 1 1 0 1 3 1 1 0 0 4 4 1)
         (0 0 0 0 1 0 0 0 0 0 1 1 1 1 1 1 1 1 1)
         (0 0 0 0 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
| Utility functions for printing states and moves.
| You do not need to understand any of the functions below this point.
|#

;
; Helper function of prettyMoves
; from s1 --> s2
;
(defun detectDiff (s1 s2)
  (let* ((k1 (getKeeperPosition s1 0))
         (k2 (getKeeperPosition s2 0))
         (deltaX (- (car k2) (car k1)))
         (deltaY (- (cadr k2) (cadr k1)))
         )
    (cond ((= deltaX 0) (if (> deltaY 0) 'DOWN 'UP))
         (t (if (> deltaX 0) 'RIGHT 'LEFT))
         );end cond
    );end let
  );end defun

;
; Translates a list of states into a list of moves.
; Usage: (prettyMoves (a* <problem> #'goal-test #'next-states #'heuristic))
;
(defun prettyMoves (m)
  (cond ((null m) nil)
        ((= 1 (length m)) (list 'END))
        (t (cons (detectDiff (car m) (cadr m)) (prettyMoves (cdr m))))
        );end cond
  );

;
; Print the content of the square to stdout.
;
(defun printSquare (s)
  (cond ((= s blank) (format t " "))
        ((= s wall) (format t "#"))
        ((= s box) (format t "$"))
        ((= s keeper) (format t "@"))
        ((= s star) (format t "."))
        ((= s boxstar) (format t "*"))
        ((= s keeperstar) (format t "+"))
        (t (format t "|"))
        );end cond
  )

;
; Print a row
;
(defun printRow (r)
  (dolist (cur r)
    (printSquare cur)
    )
  );

;
; Print a state
;
(defun printState (s)
  (progn
    (dolist (cur s)
      (printRow cur)
      (format t "~%")
      )
    );end progn
  )

;
; Print a list of states with delay.
;
(defun printStates (sl delay)
  (dolist (cur sl)
    (printState cur)
    (sleep delay)
    );end dolist
  );end defun
