let reduce t =
  let rec aux input reduced =
    if reduced <> true then
      match input with
      | Poly(lhs,rhs,degree) -> (*do stuff*)
      | MonoPoly(coef,poly) -> (*again, more stuff*)
      | Mono(coef,indet,degree) -> (*treat as mono*)
      | Pnil -> input
    else
      input
  in aux t false

(* when combining there needs to be rules on how to determine
 * parenthetical sameness *)

let combine_mono poly =
  let rec fold_same_degree input =
    (* do the things*)
  in
  match poly with
  | Poly(lhs,rhs,deg) -> Poly((combine_mono lhs),(combine_mono rhs),deg)
  | [x] -> fold_same_degree poly
  | _ -> poly

let return_discriminate poly =
  quad_func_here

let get_degree poly =
  match poly with
  | Poly(_,_,degree) -> degree
  | Mono(_,_,degree) -> degree
  | _ -> 0

let can_get_discriminate poly =
  if get_degree poly < 3 then true else false
