@/*
    select标签中各个参数的说明:
    name : select的名称
    id : select的id
    underline : 是否带分割线
@*/
<div class="form-group">
    <label class="col-xs-3 control-label">${name}:</label>
    <div class="col-xs-7">
        <select class="form-control" id="${id}" name="${id}">
            ${tagBody!}
        </select>
        @if(isNotEmpty(hidden)){
            <input class="form-control" type="hidden" id="${hidden}" value="${hiddenValue!}">
        @}
    </div>
    <div class="col-xs-2">
        @if(isNotEmpty(require)){
        <span class="pull-right">
                 @if(require=="true"){
                 必填
                 @}else{
            <span style="color:red">可无</span>
                 @}
             </span>
        @}
    </div>
</div>
@if(isNotEmpty(underline) && underline == 'true'){
    <div class="hr-line-dashed"></div>
@}


