# Lab 3 - Sampling Theorem Demonstration

Visual verification of Nyquist-Shannon sampling theorem using sinusoidal signals.

## 📌 Objectives
1. Generate a continuous-like 1 kHz sine wave using high sampling rate (1 MHz)
2. Demonstrate proper sampling at 2.5 kHz (> Nyquist rate)
3. Show aliasing effect with undersampling at 1.5 kHz (< Nyquist rate)

## 🧮 Theoretical Background
### Nyquist Criterion
```math
f_s > 2f_{max}
```
- **Proper Sampling**: 2.5 kHz > 2 kHz (Nyquist frequency)
- **Improper Sampling**: 1.5 kHz < 2 kHz → Causes aliasing

### Aliasing Phenomenon
Undersampling makes high frequencies appear as lower frequencies:
```math
f_{alias} = |f_{signal} - n \times f_s|
```
where n is the integer closest to f<sub>signal</sub>/f<sub>s</sub>

## 📊 Results
![Sampling Comparison](results/sampling_comparison.png)

**Key Observations**:
| Sampling Type | Sampling Rate | Status | Visual Characteristics |
|--------------|---------------|--------|------------------------|
| Continuous-like | 1 MHz | Reference | Smooth curve |
| Proper | 2.5 kHz | Valid | Samples capture true waveform |
| Improper | 1.5 kHz | Aliased | Samples suggest wrong frequency |
