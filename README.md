# 글로벌엄준식

그냥 재미로 만든 로블록스 값 관리자

# API

용어:
ummjunsik - 값
junsik - 값(ummjunsik)의 줄임말

umjunsik(name, value)
새로운 값을 만든다

값 예시:
{foo = true, bar = false}

findjunsik(name)
값을 찾는다

valueObject:subscribe_umjunsik(property, callback)
값이 바뀌면 callback을 실행한다

valueObject:pulljunsik(newValues)
값을 바꾼다.
값 예시: {foo = false}

valueObject:subscribe_before_junsik(property, callback)
값이 바뀌기 전에 callback을 실행한다.

valueObject:set_condition(property, conditionFunc)
값의 대한 조건 함수를 설정한다.

# 마치며
근데 왜 이름이 -가 됐지

업데이트는 많이 못합니다.

챗GPT로 도움을 받았습니다.

by sanghyeog79
