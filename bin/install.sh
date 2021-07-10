# download cache and parameters for WaveGlow
docker build -f python/docker/Dockerfile -t python-initialization:latest python/docker/
docker run --name python_init --gpus all -it -v $PWD/python/file/:/work -v $PWD/python/file/cache/:/work/cache/ -v $PWD/python/file/parameters/:/work/parameters/ python-initialization python3 /work/initialize.py
docker restart python_init
docker exec -it python_init cp -r /root/.cache/torch/hub/nvidia_DeepLearningExamples_torchhub/ /work/cache/
docker restart python_init
docker exec -it python_init cp -r /root/.cache/torch/hub/NVIDIA_DeepLearningExamples_torchhub/ /work/cache/
docker stop python_init
docker rm python_init

# initialize database
mkdir db/
mkdir db/mysql/
mkdir php/file/audio/
rm -rf php/file/audio/*
rm -rf db/mysql/*
cp -r bin/mysql_initial/* db/mysql/

# add some examples
docker build -f python/docker/Dockerfile -t python-examples:latest python/docker/

TEXT="This website contains the demo of a text-to-speech conversion system using deeplearning models, including Tacotron2 and WaveGlow."
echo $TEXT
docker run --rm --name python_examples --gpus all -it -v $PWD/python/file/:/work/ \
        -v $PWD/php/file/audio/:/work_php/audio/ \
        -v $PWD/python/file/cache/nvidia_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/nvidia_DeepLearningExamples_torchhub/ \
        -v $PWD/python/file/cache/NVIDIA_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/NVIDIA_DeepLearningExamples_torchhub/ \
        python-examples \
        python3 /work/get_audio.py --text "$TEXT"

TEXT="Please, wash your hands before eating."
echo $TEXT
docker run --rm --name python_examples --gpus all -it -v $PWD/python/file/:/work/ \
        -v $PWD/php/file/audio/:/work_php/audio/ \
        -v $PWD/python/file/cache/nvidia_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/nvidia_DeepLearningExamples_torchhub/ \
        -v $PWD/python/file/cache/NVIDIA_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/NVIDIA_DeepLearningExamples_torchhub/ \
        python-examples \
        python3 /work/get_audio.py --text "$TEXT"

TEXT="Mt. Fuji is the highest mountain in Japan."
echo $TEXT
docker run --rm --name python_examples --gpus all -it -v $PWD/python/file/:/work/ \
        -v $PWD/php/file/audio/:/work_php/audio/ \
        -v $PWD/python/file/cache/nvidia_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/nvidia_DeepLearningExamples_torchhub/ \
        -v $PWD/python/file/cache/NVIDIA_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/NVIDIA_DeepLearningExamples_torchhub/ \
        python-examples \
        python3 /work/get_audio.py --text "$TEXT"

TEXT="Tokyo Skytree is over three hundred taller than Tokyo Tower."
echo $TEXT
docker run --rm --name python_examples --gpus all -it -v $PWD/python/file/:/work/ \
        -v $PWD/php/file/audio/:/work_php/audio/ \
        -v $PWD/python/file/cache/nvidia_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/nvidia_DeepLearningExamples_torchhub/ \
        -v $PWD/python/file/cache/NVIDIA_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/NVIDIA_DeepLearningExamples_torchhub/ \
        python-examples \
        python3 /work/get_audio.py --text "$TEXT"

TEXT="A recent innovation that helps people in the world."
echo $TEXT
docker run --rm --name python_examples --gpus all -it -v $PWD/python/file/:/work/ \
        -v $PWD/php/file/audio/:/work_php/audio/ \
        -v $PWD/python/file/cache/nvidia_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/nvidia_DeepLearningExamples_torchhub/ \
        -v $PWD/python/file/cache/NVIDIA_DeepLearningExamples_torchhub/:/root/.cache/torch/hub/NVIDIA_DeepLearningExamples_torchhub/ \
        python-examples \
        python3 /work/get_audio.py --text "$TEXT"
