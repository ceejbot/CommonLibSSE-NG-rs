use std::env;
use std::path::PathBuf;

fn main() {
    println!("cargo:rustc-link-search=extern/CommonLibSSE-NG");
    println!("cargo:rustc-link-lib=libs/CommonLibSSE.lib");

    println!("cargo:rerun-if-changed=wrapper.h");

    let bindings = bindgen::Builder::default()
        .header("wrapper.h")
        .clang_arg("-Iextern/CommonLibSSE-NG/include")
        .clang_arg("-v")
        .parse_callbacks(Box::new(bindgen::CargoCallbacks::new()))
        .generate()
        .expect("Unable to generate bindings");

    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
    bindings
        .write_to_file(out_path.join("bindings.rs"))
        .expect("Couldn't write bindings!");
}
