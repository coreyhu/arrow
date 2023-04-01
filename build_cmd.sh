rm -r cpp/build
mkdir cpp/build
pushd cpp/build
cmake -DCMAKE_INSTALL_PREFIX=$ARROW_HOME \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Debug \
        -DARROW_BUILD_TESTS=ON \
        -DARROW_COMPUTE=ON \
        -DARROW_CSV=ON \
        -DARROW_DATASET=ON \
        -DARROW_FILESYSTEM=ON \
        -DARROW_HDFS=ON \
        -DARROW_JSON=ON \
        -DARROW_PARQUET=ON \
        -DARROW_WITH_BROTLI=ON \
        -DARROW_WITH_BZ2=ON \
        -DARROW_WITH_LZ4=ON \
        -DARROW_WITH_SNAPPY=ON \
        -DARROW_WITH_ZLIB=ON \
        -DARROW_WITH_ZSTD=ON \
        -DPARQUET_REQUIRE_ENCRYPTION=ON \
        -DARROW_FLIGHT=ON \
        -DARROW_GANDIVA=ON \
        -DARROW_ORC=ON \
        ..
make -j4
make install
popd

pushd python
python3 setup.py build_ext --inplace --with-parquet --with-dataset --with-flight --with-orc --with-gandiva --bundle-cython-cpp --bundle-arrow-cpp
pip3 install .
popd