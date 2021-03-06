defmodule Brex.Rule.FunctionSpec do
  use ESpec, async: true

  let rule_type: Brex.Rule.Evaluable.Function

  it_behaves_like Shared.IsRuleSpec,
    valid_rules: [
      &is_list/1,
      fn _ -> true end
    ],
    invalid_rules: [
      :a,
      1,
      Support.SomeModuleRule,
      Brex.all([])
    ]

  it_behaves_like Shared.EvaluateSpec,
    rule: &is_list/1,
    valid_values: [
      [],
      [1, 2, 3],
      [a: 1, b: 2]
    ],
    invalid_values: [
      %{},
      :a,
      MapSet.new()
    ]
end
