usage: `git [--version] [--help] [-C <path>] [-c <name>=<value>]`
           `[--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]`
           `[-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]`
           `[--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]`       
           `[--super-prefix=<path>] [--config-env=<name>=<envvar>]`
           `<command> [<args>]`

# Инструкции по работе с GIT .
  * git init .
        - инициализация репозитория .
  * git add <file> .
        - добавить файл к отслеживанию .
  * git commit .
        - добавить изменения в репозиторий .
        |-m "информация о содержании комита"|
  * git log .
        - посмотреть информацию о коммитах (*выход - Q*) .
        |-graph| - ключ добавляет визуализацию комитов и слияния веток
  * git checkout <commit_number|branch_name> .
        - перейти к коммиту( *нужно указать 4+ символа номера комита*) .
        - перейти к ветке branch_name .
  * git checkpout master .
        - возврат к текущей версии репозитория .
  * git status .
        - отображает информацию о состоянии репозитория .
  * git version .
        - показать текущую версию git .
  * git diff .
        - показать разницу между текущим и сохраненным состоянием .
  * git branch <branch_name> .
        - выводит информацию о ветках репозитория или создает ветку branch_name .
          |-d <branch_name>|удаляет ветку|branch_name| 
  * git merge <branch_name> .
        - объединяет ветку branch_name с текущей веткой .
        в случае конфликта в ветках требуется вручную внести 
        изменения и провести коммит
  * git .
        - .
  * git .
        - .
          




   * `clone`     Clone a repository into a new directory
   * `init`      Create an empty Git repository or reinitialize an existing one


   * `add`       Add file contents to the index
   * `mv`        Move or rename a file, a directory, or a symlink
   * `restore`   Restore working tree files
   * `rm`        Remove files from the working tree and from the index


   * `bisect`    Use binary search to find the commit that introduced a bug
   * `diff`      Show changes between commits, commit and working tree, etc
   * `grep`      Print lines matching a pattern
   * `log`       Show commit logs
   * `show`      Show various types of objects
   * `status`    Show the working tree status


   * `branch`    List, create, or delete branches
   * `commit`    Record changes to the repository
   * `merge`     Join two or more development histories together
   * `rebase`    Reapply commits on top of another base tip
   * `reset`     Reset current HEAD to the specified state
   * `switch`    Switch branches  


о гите [https://git-scm.com/book/ru/v2/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Git]
статья на хабре про гит для новичков:
1 часть [https://habr.com/ru/post/541258/]
2 часть [https://habr.com/ru/post/542616/]