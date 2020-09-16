<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 풋터 -->
  <footer class="bg-dark">
    <div class="container">
      <p class="m-0 py-4 text-left text-white">
        <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/image/lettering-bright.png"></a><br><br>
        <b>페타그램</b>&nbsp;&nbsp;&nbsp;${sMap.shopVo.shopAddress }<br>
        <b>대표이사</b> : 풀스택A팀&nbsp;&nbsp;&nbsp;<b>사업자등록번호</b> : ${sMap.shopVo.shopAuth }&nbsp;&nbsp;&nbsp;<b>고객센터</b> : ${sMap.shopVo.shopNumber }&nbsp;&nbsp;&nbsp;<b>이메일</b> : ${sMap.shopVo.shopEmail }
      </p>
    </div>
  </footer>
  <!-- /. 풋터 -->