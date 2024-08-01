def sum_to(n: int) -> int:
    t = 0
    for i in range(1, n + 1):
        t += i
    return t


def main():
    print(sum_to(4))


if __name__ == "__main__":
    main()
