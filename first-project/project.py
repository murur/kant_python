# 가위 바위 보 게임 미니 프로젝트

import random # 랜덤 게임을 위해 난수 발생을 위한 모듈 임포트

# 난수 발생 ( 가위 바위 보 )
choice = {
    1:"가위",
    2:"바위",
    3:"보"
}

# 승 패 카운트
win_count = 0
lose_count = 0

# 타이틀
print("="*30)
print(f"{'가위 바위 보 게임':>16}")
print("="*30)
print("1. 가위 / 2. 바위 / 3. 보")

# 메인 가위 바위 보 루프
while True:
    user_input = input("번호를 선택하세요. : ")

    if user_input == "q":
        print("게임을 종료합니다.")
        break

    # 유저가 선택하는 숫자
    user_number = int(user_input)
    # 컴퓨터가 선택하는 숫자
    computer_number = random.randint(1, 3)

    user_choice = choice[user_number]
    computer_choice = choice[computer_number]

    print("[게임결과]")
    print(f"나: {user_choice} vs 컴퓨터: {computer_choice}")

    if user_input not in ("1", "2", "3"):
        print("1, 2, 3 중에서 선택해주세요")
        continue

    user_number = int(user_input)



    if user_number == computer_number:
        print("=> 비겼습니다")
        continue

    elif user_number == 1 and computer_number == 3:
        print("=> 승리했습니다")
        win_count += 1
    elif user_number == 2 and computer_number == 1:
        print("=> 승리했습니다")
        win_count += 1
    elif user_number == 3 and computer_number == 2:
        print("=> 승리했습니다")
        win_count += 1
    elif user_number == 3 and computer_number == 1:
        print("=> 패배했습니다")
        lose_count += 1
    elif user_number == 1 and computer_number == 2:
        print("=> 패배했습니다")
        lose_count += 1
    elif user_number == 2 and computer_number == 3:
        print("=> 패배했습니다")
        lose_count += 1

    else:
        print(f"현재 스코어 나 {win_count} : {lose_count} 컴퓨터")
        break

   # 현재 스코어
    print(f"\n현재 스코어 나 {win_count} : {lose_count} 컴퓨터")
    print("다시 도전 (yes/no) : ")
    print()