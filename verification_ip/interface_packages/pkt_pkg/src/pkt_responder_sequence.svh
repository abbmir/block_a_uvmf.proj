//----------------------------------------------------------------------
// Created with uvmf_gen version 2022.3
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class pkt_responder_sequence #(
      int DATA_WIDTH = 240,
      int STATUS_WIDTH = 230
      )

  extends pkt_sequence_base #(
      .DATA_WIDTH(DATA_WIDTH),
      .STATUS_WIDTH(STATUS_WIDTH)
      )
;

  `uvm_object_param_utils( pkt_responder_sequence #(
                           DATA_WIDTH,
                           STATUS_WIDTH
                           )
)

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "pkt_responder_sequence");
    super.new(name);
  endfunction

  task body();
    req=pkt_transaction#(
                .DATA_WIDTH(DATA_WIDTH),
                .STATUS_WIDTH(STATUS_WIDTH)
                )
::type_id::create("req");
    forever begin
      start_item(req);
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

