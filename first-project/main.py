
# 가위 바위 보 게임 미니 프로젝트

import random  # 난수 생성을 위한 모듈

# 가위 바위 보 딕셔너리
choice = {
    1: "가위",
    2: "바위",
    3: "보"
}

# 승리 / 패배 횟수
win_count = 0
lose_count = 0

# 타이틀
print("=" * 40)
print(f"{'가위 / 바위 / 보 게임':^36}")
print("=" * 40)
print("1. 가위 / 2. 바위 / 3. 보")

# 메인 가위바위보 반복문
while True:

    user_input = input("번호를 선택하세요. : ")

    # 종료 기능
    if user_input.lower() == "q":
        print("게임을 종료합니다.")
        break

    # 잘못된 입력 방지
    if user_input not in ("1", "2", "3"):
        print("1, 2, 3 중에서 선택해주세요.")
        continue

    # 사용자의 선택
    user_number = int(user_input)

    # 컴퓨터의 랜덤 선택
    computer_number = random.randint(1, 3)

    # 숫자를 가위/바위/보로 변환
    user_choice = choice[user_number]
    computer_choice = choice[computer_number]

    print("\n[게임 결과]")
    print(f"나: {user_choice}  vs  컴퓨터: {computer_choice}")

    # 승패 판단
    if user_number == computer_number:
        print("=> 비김")

    elif (
        (user_number == 1 and computer_number == 3)
        or (user_number == 2 and computer_number == 1)
        or (user_number == 3 and computer_number == 2)
    ):
        print("=> 승리")
        win_count += 1

    else:
        print("=> 패배")
        lose_count += 1

    # 현재 스코어 출력
    print(f"\n현재 스코어  나 {win_count} : {lose_count} 컴퓨터")

    # 재도전
    retry = input("\n다시 도전 (yes/no) : ")

    if retry.lower() != "yes":
        print("게임을 종료합니다.")
        break

    print()
