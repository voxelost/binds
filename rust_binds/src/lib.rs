#[no_mangle]
pub extern "C" fn hello() {
    println!("hello from rust!");
}


#[no_mangle]
pub unsafe extern "C" fn echo(input: *const i8) {
    let input_str: String = std::ffi::CStr::from_ptr(input).to_str().unwrap().into();
    println!("echoing: {}", input_str);
}

