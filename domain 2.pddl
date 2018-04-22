;;Domain template 2 for cleaning floor regions
;; A domain file for CMP2020M assignment 2017/2018

;; Define the name for this domain (needs to match the domain definition
;; in the problem files)

(define (domain domain-template2)

	;; We only require some typing to make this plan faster. We can do without!
	(:requirements :typing)

	;; We have two types: cleaners and the regions, both are objects
	(:types cleaner region - object)

	;; define all the predicates as they are used in the problem files
	(:predicates  

    ;; described what region a cleaner is at
    (cleaner-at ?c - cleaner ?x - region)

    ;; described a region ?x is clear (no cleaner is at that region)
    (region_clear ?x - region)

    ;; indicates that region ?x is above region ?y
    (above ?x - region ?y - region)

    ;; indicates that region ?x is below region ?y
    (below ?x - region ?y - region)

    ;; indicates that region ?x is right of region ?y
    (right ?x - region ?y - region)

    ;; indicates that region ?x is left of region ?y
    (left ?x - region ?y - region)
    
    ;; indicates that a region is cleaned
    (cleaned ?x - region)

;; indicates that a region is dirty
    (dirty ?x - region)

 	)

;; ACTIONS that need to be defined:
;;this operation allows for rooms to be cleaned
 (:action suck
          ;;to clean you need the region object and cleaner
          ;;to perform the action and use it's reletive position
         :parameters (?cleaner - cleaner ?region - region)
          ;;check whether the coordinate that cleaner is at
          ;;is dirty (our main goal is to clean)
         :precondition (and (dirty ?region)
                            (cleaner-at ?cleaner ?region)
                            )
          ;;clean that that tile if it's dirty
         :effect (
                  cleaned ?region
                  )
 )

 ;;Movement operaitons are essential for getting to goal state
;;Move Up: provides logic for moving cleaners up
(:action move_up
         ;;requires cleaner, its current tile (ct) and target position (tt)
         ;;to able to compare their relative positions and move
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;to allow this action, target tile (tt) must be above (ct)
         ;;and cleaner must be standing on current tile (ct)
         ;;and there cannot be any other cleaner at target tile
         :precondition (and
                        (above ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        (region_clear ?tt)
                        )
         ;;cleaner then moves to its target positiong (tt)
         ;;the previous tile that cleaner was on(ct) is no longer clear
         ;;notify that cleaner is no longer at previous (ct) position
         ;;The new target position is now not clear because cleaner moved to it
         :effect (and
                  (cleaner-at ?x ?tt)
                  (region_clear ?ct)
                  (not(cleaner-at ?x ?ct))
                  (not(region_clear ?tt))
                  )
)

;;Move down: provides logic for moving cleaners down
(:action move_down
         ;;requires cleaner, its current tile (ct) and target position (tt)
         ;;to able to compare their relative positions and move
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;to allow this action, target tile (tt) must be below (ct)
         ;;and cleaner must be standing on current tile (ct)
         ;;and there cannot be any other cleaner at target tile
         :precondition (and
                        (below ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        (region_clear ?tt)
                        )
         ;;cleaner then moves to its target positiong (tt)
         ;;the previous tile that cleaner was on(ct) is no longer clear
         ;;notify that cleaner is no longer at previous (ct) position
         ;;The new target position is now not clear because cleaner moved to it
         :effect (and
                  (cleaner-at ?x ?tt)
                  (region_clear ?ct)
                  (not(cleaner-at ?x ?ct))
                  (not(region_clear ?ct))
                  )
)
;;Move down: provides logic for moving cleaners down
(:action move_left
         ;;requires cleaner, its current tile (ct) and target position (tt)
         ;;to able to compare their relative positions and move
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;to allow this action, target tile (tt) must be to left (ct)
         ;;and cleaner must be standing on current tile (ct)
         ;;and there cannot be any other cleaner at target tile
         :precondition (and
                        (left ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        (region_clear ?tt)
                        )
         ;;cleaner then moves to its target positiong (tt)
         ;;the previous tile that cleaner was on(ct) is no longer clear
         ;;notify that cleaner is no longer at previous (ct) position
         ;;The new target position is now not clear because cleaner moved to it
         :effect (and
                  (cleaner-at ?x ?tt)
                  (region_clear ?ct)
                  (not(cleaner-at ?x ?ct))
                  (not(region_clear ?ct))
                  )
)
;;Move right: provides logic for moving cleaners right
(:action move_right
         ;;requires cleaner, its current tile (ct) and target position (tt)
         ;;to able to compare their relative positions and move
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;to allow this action, target tile (tt) must be to right (ct)
         ;;and cleaner must be standing on current tile (ct)
         ;;and there cannot be any other cleaner at target tile
         :precondition (and
                        (right ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        (region_clear ?tt)
                        )
         ;;cleaner then moves to its target positiong (tt)
         ;;the previous tile that cleaner was on(ct) is no longer clear
         ;;notify that cleaner is no longer at previous (ct) position
         ;;The new target position is now not clear because cleaner moved to it
         :effect (and
                  (cleaner-at ?x ?tt)
                  (region_clear ?ct)
                  (not(cleaner-at ?x ?ct))
                  (not(region_clear ?ct))
                  )
)




)

;;Resources used: 
;;Russell, S. Norving, P. (2010). Artificial Intelligence: A Modern Approach. Prentice Hall. pp.70-72
