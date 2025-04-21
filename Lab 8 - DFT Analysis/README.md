# Lab 8 - DFT Analysis

Time-frequency analysis of multi-tone signals using Discrete Fourier Transform.

## 📌 Objectives
1. Generate signal: x(t) = sin(2π·50t) + 0.5sin(2π·150t)
2. Analyze clean vs noisy signals in:
   - Time domain
   - Frequency domain (using FFT)
3. Verify Nyquist sampling compliance
4. Compare built-in FFT with manual DFT implementation

## 🧮 Theoretical Background
### DFT Formula
```math
X[k] = \sum_{n=0}^{N-1} x[n] \cdot e^{-j2\pi kn/N}
```

### Key Parameters
| Parameter | Value | Description |
|-----------|-------|-------------|
| f₁ | 50 Hz | First tone |
| f₂ | 150 Hz | Second tone |
| fₛ | 750 Hz | Sampling rate (5×fₘₐₓ) |
| N | 1024 | FFT points |

## 📊 Results
### Time Domain
![Time Domain](time_domain.png)

### Frequency Domain
![Frequency Domain](frequency_domain.png)
