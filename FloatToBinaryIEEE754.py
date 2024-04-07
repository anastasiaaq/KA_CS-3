def decimal_to_binary(number):
    if number == 0:
        return "0"

    binary = ""
    while number > 0:
        binary = str(int(number % 2)) + binary
        number //= 2

    return binary


class FloatToBinaryIEEE754:
    @staticmethod
    def convert_to_ieee754(number: float):
        sign = "1" if number < 0 else "0"
        positive_decimal_num = abs(number)
        integer_part = int(positive_decimal_num)
        fractional_part = positive_decimal_num - integer_part

        binary_integer = decimal_to_binary(integer_part)
        binary_fractional = ""
        while fractional_part > 0 and len(binary_fractional) < 23:
            fractional_part *= 2
            binary_fractional += str(int(fractional_part))
            fractional_part -= int(fractional_part)

        mantissa = binary_integer[0] + "," + binary_integer[1:] + binary_fractional
        full_mantissa = mantissa
        while len(full_mantissa) <= 24:
            full_mantissa += "0"

        exponent = len(binary_integer) - 1
        exponent += 127
        binary_exponent = decimal_to_binary(exponent)
        mantissa_remainder = full_mantissa[2:]

        binary_result = sign + binary_exponent + mantissa_remainder
        hex_result = hex(int(binary_result, 2))[2:]

        # print(sign, mantissa, exponent, full_mantissa, mantissa_remainder, binary_result, )
        print(f"{hex_result =}")
        print(f"{binary_result =}")
        # print(binary_result)


print(FloatToBinaryIEEE754.convert_to_ieee754(-10.125))
