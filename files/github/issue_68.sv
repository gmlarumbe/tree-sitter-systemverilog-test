class my_class;

    static function void hello();
        $display("Hello from static method");
    endfunction

    function void test();
        my_class::hello;
    endfunction

endclass
