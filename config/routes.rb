Rails.application.routes.draw do
  # index (タスク一覧）、show（詳細ページ）、new（作成ページ）、edit（編集ページ）
  resources :tasks
end
