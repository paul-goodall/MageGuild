

source_encrypted <- function(my_url, my_fname, my_pwd_file, my_path=getwd()){
  com <- "wget -q -O my_path/my_fname.enc my_url;
  openssl aes-256-cbc -in my_path/my_fname.enc -d -pass file:my_pwd_file -out my_path/my_fname.R"
  com <- gsub("my_url", my_url, com)
  com <- gsub("my_path", my_path, com)  
  com <- gsub("my_fname", my_fname, com)
  com <- gsub("my_pwd_file", my_pwd_file, com)
  system(com)
  r_file <- paste0(my_path,"/", my_fname, ".R")
  source(r_file)
}

git_push <- function(my_dir, my_comment="another commit"){
  
  com <- "git -C my_dir add -A;
  git -C my_dir commit -m 'my_comment';
  git -C my_dir push -u origin master;
  "
  com <- gsub("my_dir", my_dir, com)
  com <- gsub("my_comment", my_comment, com)
  cat(com)
  system(com)
}

pull_repo <- function(){
  
}