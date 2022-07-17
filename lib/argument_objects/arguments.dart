class RoleScreenArguments {
  final String roleName;
  RoleScreenArguments({required this.roleName});
}

class IndividualRoleScreenArguments {
  final String roleName;
  IndividualRoleScreenArguments({required this.roleName});
}

class RoleFormScreenArguments {
  final String roleName;
  Function()? callback;
  RoleFormScreenArguments({required this.roleName, this.callback});
}
