Dog := Object clone
Dog bark := method(writeln("woof!"))

fido := Dog clone
fido bark := method(
    writeln("ruf!")
    super(bark)
)
