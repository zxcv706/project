package com.ssadagoo.project.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssadagoo.project.dao.FoodDAO;
import com.ssadagoo.project.domain.FoodVO;

@Service
public class FoodServiceImpI implements FoodService {
	
	@Autowired
	FoodDAO foodDao; 

	@Override
	public String getUrl(String food) {
		
		String[][]urls = {
				{"만두국","https://www.youtube.com/watch?v=At-u3lwsFtk"},
				{"간장조림닭","https://www.youtube.com/watch?v=apJxyK-Xz5k"},
				{"고구마맛탕","https://www.youtube.com/watch?v=Qrl0u3jVwE0"},
				{"갈비찜","https://www.youtube.com/watch?v=PjMWHZ3ubsQ"},
				{"궁중떡뽁이","https://www.youtube.com/watch?v=UB9TRkkUjaY"},
				{"굴떡국","https://www.youtube.com/watch?v=tgrYkoNUhS4"},
				{"김밥","https://www.youtube.com/watch?v=10fl2mebYHs"},
				{"김치찌개","https://www.youtube.com/watch?v=DnQ09ZZCjCs"},
				{"오징어볶음","https://www.youtube.com/watch?v=H4pYFtWMHz4"},
				{"두부간장조림","https://www.youtube.com/watch?v=GKPoSTwxAMk"},
				{"배숙","https://www.youtube.com/watch?v=OG1GL4tXgMQ"},
				{"모듬전","https://www.youtube.com/watch?v=7dB3makavQA"},
				{"버터계란밥","https://www.youtube.com/watch?v=r0MDWz3E9hc"},
				{"육개장","https://www.youtube.com/watch?v=N0EUAo2X2d0"},
				{"부대찌개","https://www.youtube.com/watch?v=Zy3gXkBqi-0"},
				{"비빔라면","https://www.youtube.com/watch?v=NvoCWyO0Vfg"},
				{"소불고기","https://www.youtube.com/watch?v=p3IQTouKyH0"},
				{"소고기장조림","https://www.youtube.com/watch?v=unMfVm5gtyw"},
				{"순두부찌개","https://www.youtube.com/watch?v=nj-DjQFEZb0"},
				{"순두부계란국","https://www.youtube.com/watch?v=QJAn9Q4XpOA"},
				{"얼큰수제비","https://www.youtube.com/watch?v=vSITeU3EH6g"},
				{"어묵국","https://www.youtube.com/watch?v=yjGhA7idCpI"},
				{"짜빠구리","https://www.youtube.com/watch?v=j9v_2oAKQsw"},
				{"잡채","https://www.youtube.com/watch?v=DNj3YiaP42s"},
				{"치즈계란말이","https://www.youtube.com/watch?v=3pqiMLB6-yc"},
				{"메밀전병","https://www.youtube.com/watch?v=m_YtvvzSwz0"},
				{"팥죽","https://www.youtube.com/watch?v=oyCxicLybpM"}

		}; 
		String[] imgs = {
				"2만두국.jpg",
				"2간장닭조림.jpg",
				"2고구마맛탕.jpg",
				"2갈비찜.jpg",
				"2궁중떡뽁이.jpg",
				"2굴떡국.jpg",
				"2김밥.jpg",
				"2김치찌개.jpg",
				"2오징어볶음.jpg",
				"2두부간장조림.jpg",
				"2배숙.jpg",
				"2모듬전.jpg",
				"2버터계란밥.jpg",
				"2육개장.jpg",
				"2부대찌개.jpg",
				"2비빔라면.jpg",
				"2소불고기.jpg",
				"2소고기장조림.jpg",
				"2순두부찌개.jpg",
				"2순두부계란국.jpg",
				"2얼큰수제비.jpg",
				"2어묵국.jpg",
				"2짜빠구리.jpg",
				"2잡채.jpg",
				"2치즈계란말이.jpg",
				"2메밀전병.jpg",
				"2팥죽.jpg"
		};
		List<String> imglist = Arrays.asList(imgs);
		
		String [] foods = {
				"간장닭조림:짭조름한 간장과 닭의 콜라보레이션!!",
				"갈비찜:사랑받는 사위를 위한 장모님의 정성듬뿍 음식!",
				"고구마맛탕:달콤하고 부드러운 영양만점 고구마간식!!",
				"굴떡국:새해가되면 만들어먹는 스페셜한 떡국!!",
				"궁중떡뽁이 : 임금님도 반했다! 고오급떡볶이",
				"김밥:소풍하면 떠오르는 음식의 대명사",
				"김치찌개:비오는날 소주한잔과 함께하면 끝장!",
				"두부간장조림: 고소한 두부를 한층 업그레이드시킨다!",
				"만두국:제대앞둔 말년병장도 벌떡 !",
				"메밀전병: 시장가면 꼭 먹어야하는 베스트오브베스트",
				"모듬전: 막걸리와 단짝친구 술한병 홀딱",
				"배숙:달달한 감기몸살 자연치료제!",
				"버터계란밥:초스피드 간단 식사",
				"부대찌개:햄요리의 끝판왕 밥세공기뚝딱!",
				"비빔라면:더운 여름날 매콤새콤한 비빔라면 후루룩",
				"소고기장조림:뜨끈한 밥에 쓱싹 최고의반찬",
				"소불고기:온가족이 함께 즐거운식사의 지름길",
				"순두부계란국:씹지않고 식도로 바로 토스!!",
				"순두부찌개:칼칼한 국물이 위장을 가격한다!",
				"어묵국:어묵에서 나온 육수가 시너지효과를!",
				"얼큰수제비: 김치 한점 올려서 후루룩!",
				"오징어볶음:바다속 오징어가 내혓속에서 꿈틀!",
				"육개장:호불호 안갈리는 뜨끈한 국물",
				"잡채:생일날 잔치상에 대표주자",
				"짜빠구리:기생충 흥행 일등공신!",
				"치즈계란말이:치즈와 계란이라는 깡패조합!",
				"팥죽:귀신은 물럿거라! 전통있는 우리음식"
		};
		Map<String,String>map = new HashMap<>();
		
		
		for(int i=0; i<foods.length; i++) {
			String f = foods[i].split(":")[0];
			
			for(int j=0; j<urls.length; j++) {
				//System.out.println(food[i].split(":")[0]);
				if(urls[j][0].equals(f))
					map.put(food, urls[j][1]);
			};
		}
		
		return map.get(food);
	}
	
	@Transactional(readOnly=true)
	@Override
	public List<FoodVO> getFoodsByPage(int page, int limit) {
		return foodDao.getFoodsByPage(page, limit);
	}
	
	@Transactional(readOnly=true)
	@Override
	public List<FoodVO> getFoodsByCatePage(String foodCate, int page, int limit) {
		return foodDao.getFoodsByCatePage(foodCate, page, limit);
	}

}
