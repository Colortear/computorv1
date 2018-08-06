(* when combining there needs to be rules on how to determine
 * parenthetical sameness *)

let rec combine_mono poly =
  let rec fold_same_degree input =
    match input with
    | _ -> input
    | [x] -> [x]
    | Mono(coef,indet,deg)::(Mono(coef2,indet2,deg2)::tail as tl) ->
      (*either add to coef and use the next part of the list as tl or use the next as tail. figure this out *)
      if deg = deg2 then
        Mono((coef2 + coef),indet2,deg2)::(combine_mono tail)
      else
        Mono(coef,indet,deg)::(combine_mon_poly tl)
  in
  match poly with
  | hd::tl -> fold_same_degree poly
  | _ -> poly

let return_discriminate poly =
  quad_func_here

let get_degree poly =
  match poly with
  | Poly(_,_,degree) -> degree
  | Mono(_,_,degree) -> degree
  | _ -> 0

let print_outcome poly disc =
  print_string "Reduced form: ";
  match poly with
  | _ -> print_endline "Error."
  | Poly(lhs,rhs,deg) ->
    let rec aux input =
      match input with
      | [] -> ""
      | Mono(coef,indet,degree)::tl ->
        (*break apart *)

let reduce t =
  match input with
  | MonoPoly(coef,poly) -> input
  | Mono(coef,indet,degree) -> input
  | Pnil -> input
  | Poly(lhs,rhs,degree) -> 
    let new_left = fold_same_degree lhs in
    let new_right = fold_same_degree rhs in
    let new_poly = balance_sides Poly(new_left,new_right,degree) in
    let discriminate = if (get_degree new_poly) < 3 then
        return_discriminate new_poly
      else
        "Cannot solve for discriminate."
    in
    print_outcome new_poly discriminate
