import sys
from unittest.mock import MagicMock

# mock 所有重型依赖，防止 import 报错
for mod in [
    "sklearn", "sklearn.base", "sklearn.utils",
    "scipy", "scipy.stats", "scipy.sparse",
    "torch", "cv2", "tensorflow",
]:
    sys.modules[mod] = MagicMock()