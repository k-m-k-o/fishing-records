json.text @comment.text
json.user @comment.user.nickname
json.id @comment.user.id
json.time @comment.created_at.strftime("%m/%d")