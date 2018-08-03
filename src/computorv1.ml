Open Poly

let compute poly =
  let tree = parse_tree poly in
  let reduced = reduce tree in
  let discriminant = get_disc in
  print_result reduced discriminant

let () =
  match (Array.length Sys.Argv) with
  | 2 -> compute Sys.Argv.(1)
  | _ -> print_endline "usage: computorv1 [\"polynomial\"]"
