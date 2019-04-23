using BinaryBuilder

version = v"2.9.9"

sources = [
    "https://github.com/GNOME/libxml2/archive/v$(version).tar.gz" =>
        "d673f0284cec867ee00872a8152e0c3c09852f17fd9aa93f07579a37534f0bfe",
]

script = raw"""
cd ${WORKSPACE}/srcdir/libxml2-*
./autogen.sh
./configure --prefix=${prefix} --host=${target} --without-python --with-zlib=${prefix}
make -j${nproc} install
"""

products(prefix) = [
    LibraryProduct(prefix, "libxml2", :libxml2)
]

platforms = supported_platforms()

dependencies = [
    "https://github.com/bicycle1885/ZlibBuilder/releases/download/v1.0.3/build_Zlib.v1.2.11.jl",
]

build_tarballs(ARGS, "XML2Builder", version, sources, script, platforms, products, dependencies)
