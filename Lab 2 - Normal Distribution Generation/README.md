# Lab 2 - Normal Distribution Generation

Generation of Gaussian signals from uniform distributions using two methods.

## 📌 Objectives
1. Convert uniform distribution to normal distribution using:
   - **Summation Method**: Add 12 uniform signals
   - **Box-Muller Transform**: Analytical transformation
2. Achieve target parameters: μ = 50, σ = 3
3. Compare histogram evolution and final distributions

## 🧮 Theory
### Summation Method
By Central Limit Theorem, summing `n` uniform signals:
```math
X_{\text{norm}} = \left(\sum_{i=1}^{12} U_i - 6\right) \times \sigma + \mu
```

### Box-Muller Transform
```math
X = \sqrt{-2\ln R_1} \cos(2\pi R_2)
```

## 📊 Results
### Histogram Evolution (12 Iterations)
![Summation Process](summation_histograms.png)

### Final Distributions
#### Summation
![Summation Samples](method1_results.png)
#### Box-Muller 
![BM Samples](method2_results.png)
