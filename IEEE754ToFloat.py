def hex_to_binary(hex_number):
    binary_number = ""
    for digit in hex_number:
        binary_number += {
            "0": "0000",
            "1": "0001",
            "2": "0010",
            "3": "0011",
            "4": "0100",
            "5": "0101",
            "6": "0110",
            "7": "0111",
            "8": "1000",
            "9": "1001",
            "A": "1010",
            "B": "1011",
            "C": "1100",
            "D": "1101",
            "E": "1110",
            "F": "1111"
        }[digit.upper()]

    return binary_number


class BinaryToFloatIEEE754:
    @staticmethod
    def convert_to_decimal(hex_representation: str):

        binary_representation = hex_to_binary(hex_representation)

        sign = -1 if binary_representation[0] == "1" else 1
        exponent = int(binary_representation[1:9], 2) - 127
        # print(exponent)
        mantissa = "1," + binary_representation[9:]
        mantissa = mantissa[0] + mantissa[2:(2+exponent)] + "," + mantissa[2+exponent:]
        print(mantissa)

        integer_part, fractional_part = mantissa.split(",")

        decimal_integer = 0
        for i, bit in enumerate(reversed(integer_part)):
            decimal_integer += int(bit) * 2 ** i

        decimal_fractional = 0
        for i, bit in enumerate(fractional_part):
            decimal_fractional += int(bit) * 2 ** -(i + 1)

        return sign * (decimal_integer + decimal_fractional)


print(f"{BinaryToFloatIEEE754.convert_to_decimal('40c40000')}")