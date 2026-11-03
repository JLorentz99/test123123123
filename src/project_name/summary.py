"""Small example functions; replace these with project logic."""

from collections.abc import Iterable


def mean(values: Iterable[float]) -> float:
    """Return the arithmetic mean of one or more values."""
    observed = list(values)
    if not observed:
        raise ValueError("mean requires at least one value")
    return sum(observed) / len(observed)
