# new repository

1. $ git init
* $ git remote add <별명> repository 주소

2. $ git remote get-url origin
* 연결 주소확인

3. $ touch README.md
* README.md 생성

4. $ vi README.md
* README.md 수정

5. $ git status
* 프로젝트 확인

6. $ git add README.md
* index로 staging

7. $ git commit
* 설명 commit

8. $ git status
* commit 할 내역확인
	* $ git commit -m "커밋메시지"를 입력하면 바로 Commit message를 입력가능
	* 말머리: feat:, docs:, test:, refactor

9. $ git push origin master
* remote repository로 push
* 첫 commit: $ git push -u origin master


