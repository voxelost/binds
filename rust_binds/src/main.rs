mod lib;

fn main() {
    unsafe {
        let c_str = std::ffi::CString::new("hello").unwrap();
        let u8_ptr = c_str.as_ptr() as *const i8;

        lib::echo(u8_ptr);
    }
}
