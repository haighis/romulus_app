defmodule RomulusWeb.BusinessHelper do
    def get_business_id(raw_business_id) do
        {business_id, ""} = Integer.parse(raw_business_id |> List.first)
        business_id
    end
end