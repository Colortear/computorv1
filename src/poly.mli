module type POLY =
  sig
    type coef = int
    type indeterminates = string
    type degree = int
    type poly =
      | Poly of poly list * poly list * int
                (* never let Poly be a member of Poly recursively. Could pose problems. *)
      | MonoPoly of coef * poly
      | Mono of coef * indeterminates * degree
      | Pnil
    val reduce : poly -> poly
    val combine_mono : poly -> poly
    val return_discriminate : poly -> int * int
    val get_degree : poly -> int
    val can_get_discriminate : poly -> bool
  end
