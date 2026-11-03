"""Tests for the example Python functions."""

import pytest

from project_name import mean


def test_mean() -> None:
    assert mean([1.0, 2.0, 3.0]) == 2.0


def test_mean_rejects_empty_input() -> None:
    with pytest.raises(ValueError, match="at least one"):
        mean([])
