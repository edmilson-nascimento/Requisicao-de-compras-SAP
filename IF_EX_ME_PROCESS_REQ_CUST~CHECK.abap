method if_ex_me_process_req_cust~check.

  data:
    header type mereq_header,
    items  type mmpur_requisition_items,
    item   type mmpur_requisition_item,
    data   type mereq_item .

  if not im_header is initial.

     call method im_header->get_data
       receiving
         re_data = header.

    items = im_header->get_items( ) .

    read table items into item index 1 .

    if sy-subrc eq 0.

      data = item-item->get_data( ) .
      include zmmi0000 if found .

    endif.

  endif .

  free:
    header, items, item, data .
    
endmethod.
