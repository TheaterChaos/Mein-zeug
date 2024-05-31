return {
    name="Delete",
    help="Removes the selected object",
    applicable_to={"PED", "VEHICLE", "OBJECT"},
    execute=function(target)
        util.toast("Deleting "..target.name)
        entities.delete(target.handle)
    end
}