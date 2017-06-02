return function (item)
    if item.x and item.y and item.w and item.h and arr2str(item.image.data) then
        disp:drawXBM(item.x, item.y, item.w, item.h, arr2str(item.image.data))
    else
        print("Error, input data is incomplete",item.x, item.y, item.w, item.h, sjson.encode(item.image.data))
    end
end
