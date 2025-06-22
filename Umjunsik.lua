local module = {}

-- 엄준식을 저장할 테이블
local umjunsiks = {}

-- 새로운 엄준식 생성 함수
function module.umjunsik(name, value)
	-- 엄준식 객체 생성 및 초기화
	local valueObject = {}

	-- 값 설정 (초기 값)
	for key, val in pairs(value) do
		valueObject[key] = val
	end

	-- 구독 관리 테이블
	valueObject._subscriptions = {}

	-- 속성 변경 감지 및 구독 처리
	function valueObject:subscribe_umjunsik(property, callback)
		-- 속성에 대한 구독 목록이 없으면 초기화
		self._subscriptions[property] = self._subscriptions[property] or {}
		-- 구독 함수 저장
		table.insert(self._subscriptions[property], callback)
	end

	-- 속성 값 변경 메서드
	function valueObject:pulljunsik(newValues)
		for key, value in pairs(newValues) do
			-- 속성 값이 변경될 때마다 감지
			if self[key] ~= value then
				self[key] = value  -- 속성 값 변경

				-- 구독된 콜백이 있다면 실행
				if self._subscriptions[key] then
					for _, callback in ipairs(self._subscriptions[key]) do
						callback(value)  -- 변경된 값을 콜백에 전달
					end
				end
			end
		end
	end
	
	-- 속성이 변경되기 전에 콜백을 실행함.
	function valueObject:subscribe_before_junsik(property, callback)
		self._subscriptions["before_" .. property] = self._subscriptions["before_" .. property] or {}
		table.insert(self._subscriptions["before_" .. property], callback)
	end
	
	-- 특정 속성에 대한 조건 함수 설정
	function valueObject:set_condition(property, conditionFunc)
		-- 특정 속성에 대한 조건 함수 설정
		self._conditions = self._conditions or {}
		self._conditions[property] = conditionFunc
	end

	-- 엄준식 객체 저장
	umjunsiks[name] = valueObject
	return valueObject
end

-- 엄준식 찾기 함수
function module.findjunsik(name)
	return umjunsiks[name]
end

return module
