@module "CRUD", ->

  params = (data) ->
    $.extend data, authenticity_token: $("meta[name=\"csrf-token\"]").attr("content")

  url = (path) ->
    if path == "users"
      "/#{path}"
    else
      "/api/#{path}"

  ajax = (path, method, data) ->
    {url: url(path), method: method, data: params(data)}

  @create = (path, data, success) ->
    $.ajax(ajax(path, "POST", data)).done(success)

  @index = (path, data, success) ->
    $.ajax(ajax(path, "GET", data)).done(success)

  @update = (path, data, success) ->
    $.ajax(ajax(path, "PATCH", data)).done(success)

  @remove = (path, id, success) ->
    $.ajax(ajax("#{path}/#{id}", "DELETE", "")).done(success)

  @show = (path, id, success) ->
    $.ajax(ajax("#{path}/#{id}", "GET", "")).done(success)

