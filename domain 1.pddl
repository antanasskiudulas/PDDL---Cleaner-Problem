;;Domain template 1 for cleaning floor regions
;; A domain file for CMP2020M assignment 2017/2018

;; Define the name for this domain (needs to match the domain definition
;; in the problem files)

(define (domain domain-template1)

    ;; We only require some typing to make this plan faster. We can do without!
    (:requirements :typing)

    ;; We have two types: cleaners and the regions, both are objects
    (:types cleaner region - object)

    ;; define all the predicates as they are used in the problem files
    (:predicates  

    ;; described what region a cleaner is at
    (cleaner-at ?c - cleaner ?x - region)


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
;;Operation required to undo dirty tiles
(:action suck
         ;;requires cleaner and region information to perform action
         :parameters (?x - cleaner ?r - region)
         ;;triggers the effect when the tile that cleaner is standing
         ;;on is dirty
         :precondition (and (dirty ?r)
                            (cleaner-at ?x ?r))
         ;;this action causes the tile to be cleaned
         :effect (
                  cleaned ?r
                  )
)
;;movement operation: up
(:action move_up
         ;;requires cleaner, its current tile (ct) and target position (tt)
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;the target tile 'up' has to be above current tile
         ;;the cleaner must be at the current tile
         ;;checks relative position from cleaner to detect boundries
         :precondition (and
                        (above ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        )
         ;;cleaner has now changed his position to target tile (up)
         ;;cleaner is no longer at his previous current tile
         :effect (and
                  (cleaner-at ?x ?tt)
                  (not(cleaner-at ?c ?ct))
                  )
)
;;movement operation: down
(:action move_down
         ;;requires cleaner, its current tile (ct) and target position (tt)
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;the target tile 'down' has to be below current tile
         ;;the cleaner must be at the current tile
         ;;checks relative position from cleaner to detect boundries
         :precondition (and
                        (below ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        )
         ;;cleaner has now changed his position to target tile (down)
         ;;cleaner is no longer at his previous current tile
         :effect (and
                  (cleaner-at ?x ?tt)
                  (not(cleaner-at ?c ?ct))
                  )
)

(:action move_left
         ;;requires cleaner, its current tile (ct) and target position (tt)
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;the target tile 'left' has to be to the left current tile
         ;;the cleaner must be at the current tile
         ;;checks relative position from cleaner to detect boundries
         :precondition (and
                        (left ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        )
         ;;cleaner has now changed his position to target tile (left)
         ;;cleaner is no longer at his previous current tile
         :effect (and
                  (cleaner-at ?x ?tt)
                  (not(cleaner-at ?c ?ct))
                  )
)

(:action move_right
         ;;requires cleaner, its current tile (ct) and target position (tt)
         :parameters (?x - cleaner ?ct - region ?tt - region)
         ;;the target tile 'right' has to be to the right current tile
         ;;the cleaner must be at the current tile
         ;;checks relative position from cleaner to detect boundries
         :precondition (and
                        (right ?tt ?ct)
                        (cleaner-at ?x ?ct)
                        )
         ;;cleaner has now changed his position to target tile (right)
         ;;cleaner is no longer at his previous current tile
         :effect (and
                  (cleaner-at ?x ?tt)
                  (not(cleaner-at ?c ?ct))
                  )
)



)

