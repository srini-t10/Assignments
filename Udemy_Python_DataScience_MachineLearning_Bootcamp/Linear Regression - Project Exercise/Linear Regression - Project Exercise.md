
___

<a href='http://www.pieriandata.com'> <img src='../Pierian_Data_Logo.png' /></a>
___
# Linear Regression - Project Exercise

Congratulations! You just got some contract work with an Ecommerce company based in New York City that sells clothing online but they also have in-store style and clothing advice sessions. Customers come in to the store, have sessions/meetings with a personal stylist, then they can go home and order either on a mobile app or website for the clothes they want.

The company is trying to decide whether to focus their efforts on their mobile app experience or their website. They've hired you on contract to help them figure it out! Let's get started!

Just follow the steps below to analyze the customer data (it's fake, don't worry I didn't give you real credit card numbers or emails).

## Imports
** Import pandas, numpy, matplotlib,and seaborn. Then set %matplotlib inline 
(You'll import sklearn as you need it.)**


```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
%matplotlib inline
```

## Get the Data

We'll work with the Ecommerce Customers csv file from the company. It has Customer info, suchas Email, Address, and their color Avatar. Then it also has numerical value columns:

* Avg. Session Length: Average session of in-store style advice sessions.
* Time on App: Average time spent on App in minutes
* Time on Website: Average time spent on Website in minutes
* Length of Membership: How many years the customer has been a member. 

** Read in the Ecommerce Customers csv file as a DataFrame called customers.**


```python
customers = pd.read_csv('Ecommerce Customers')
```

**Check the head of customers, and check out its info() and describe() methods.**


```python
customers.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Email</th>
      <th>Address</th>
      <th>Avatar</th>
      <th>Avg. Session Length</th>
      <th>Time on App</th>
      <th>Time on Website</th>
      <th>Length of Membership</th>
      <th>Yearly Amount Spent</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>mstephenson@fernandez.com</td>
      <td>835 Frank Tunnel\nWrightmouth, MI 82180-9605</td>
      <td>Violet</td>
      <td>34.497268</td>
      <td>12.655651</td>
      <td>39.577668</td>
      <td>4.082621</td>
      <td>587.951054</td>
    </tr>
    <tr>
      <th>1</th>
      <td>hduke@hotmail.com</td>
      <td>4547 Archer Common\nDiazchester, CA 06566-8576</td>
      <td>DarkGreen</td>
      <td>31.926272</td>
      <td>11.109461</td>
      <td>37.268959</td>
      <td>2.664034</td>
      <td>392.204933</td>
    </tr>
    <tr>
      <th>2</th>
      <td>pallen@yahoo.com</td>
      <td>24645 Valerie Unions Suite 582\nCobbborough, D...</td>
      <td>Bisque</td>
      <td>33.000915</td>
      <td>11.330278</td>
      <td>37.110597</td>
      <td>4.104543</td>
      <td>487.547505</td>
    </tr>
    <tr>
      <th>3</th>
      <td>riverarebecca@gmail.com</td>
      <td>1414 David Throughway\nPort Jason, OH 22070-1220</td>
      <td>SaddleBrown</td>
      <td>34.305557</td>
      <td>13.717514</td>
      <td>36.721283</td>
      <td>3.120179</td>
      <td>581.852344</td>
    </tr>
    <tr>
      <th>4</th>
      <td>mstephens@davidson-herman.com</td>
      <td>14023 Rodriguez Passage\nPort Jacobville, PR 3...</td>
      <td>MediumAquaMarine</td>
      <td>33.330673</td>
      <td>12.795189</td>
      <td>37.536653</td>
      <td>4.446308</td>
      <td>599.406092</td>
    </tr>
  </tbody>
</table>
</div>




```python
customers.describe()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Avg. Session Length</th>
      <th>Time on App</th>
      <th>Time on Website</th>
      <th>Length of Membership</th>
      <th>Yearly Amount Spent</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>count</th>
      <td>500.000000</td>
      <td>500.000000</td>
      <td>500.000000</td>
      <td>500.000000</td>
      <td>500.000000</td>
    </tr>
    <tr>
      <th>mean</th>
      <td>33.053194</td>
      <td>12.052488</td>
      <td>37.060445</td>
      <td>3.533462</td>
      <td>499.314038</td>
    </tr>
    <tr>
      <th>std</th>
      <td>0.992563</td>
      <td>0.994216</td>
      <td>1.010489</td>
      <td>0.999278</td>
      <td>79.314782</td>
    </tr>
    <tr>
      <th>min</th>
      <td>29.532429</td>
      <td>8.508152</td>
      <td>33.913847</td>
      <td>0.269901</td>
      <td>256.670582</td>
    </tr>
    <tr>
      <th>25%</th>
      <td>32.341822</td>
      <td>11.388153</td>
      <td>36.349257</td>
      <td>2.930450</td>
      <td>445.038277</td>
    </tr>
    <tr>
      <th>50%</th>
      <td>33.082008</td>
      <td>11.983231</td>
      <td>37.069367</td>
      <td>3.533975</td>
      <td>498.887875</td>
    </tr>
    <tr>
      <th>75%</th>
      <td>33.711985</td>
      <td>12.753850</td>
      <td>37.716432</td>
      <td>4.126502</td>
      <td>549.313828</td>
    </tr>
    <tr>
      <th>max</th>
      <td>36.139662</td>
      <td>15.126994</td>
      <td>40.005182</td>
      <td>6.922689</td>
      <td>765.518462</td>
    </tr>
  </tbody>
</table>
</div>




```python
customers.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 500 entries, 0 to 499
    Data columns (total 8 columns):
    Email                   500 non-null object
    Address                 500 non-null object
    Avatar                  500 non-null object
    Avg. Session Length     500 non-null float64
    Time on App             500 non-null float64
    Time on Website         500 non-null float64
    Length of Membership    500 non-null float64
    Yearly Amount Spent     500 non-null float64
    dtypes: float64(5), object(3)
    memory usage: 31.3+ KB


## Exploratory Data Analysis

**Let's explore the data!**

For the rest of the exercise we'll only be using the numerical data of the csv file.
___
**Use seaborn to create a jointplot to compare the Time on Website and Yearly Amount Spent columns. Does the correlation make sense?**


```python
sns.set_style('whitegrid')
sns.set_palette('GnBu_d')

sns.jointplot(data=customers, 
              x='Time on Website', 
              y='Yearly Amount Spent',
              size=6
             )
```




    <seaborn.axisgrid.JointGrid at 0x7f502affc4e0>




![png](output_10_1.png)


** Do the same but with the Time on App column instead. **


```python
sns.jointplot(data=customers, 
              x='Time on App', 
              y='Yearly Amount Spent',
              size=6
             )
```




    <seaborn.axisgrid.JointGrid at 0x7f502ac25550>




![png](output_12_1.png)


** Use jointplot to create a 2D hex bin plot comparing Time on App and Length of Membership.**


```python
sns.jointplot(data=customers, 
              x='Time on App', 
              y='Length of Membership',
              kind='hex',
              size=6
             )
```




    <seaborn.axisgrid.JointGrid at 0x7f503016b828>




![png](output_14_1.png)


**Let's explore these types of relationships across the entire data set. Use [pairplot](https://stanford.edu/~mwaskom/software/seaborn/tutorial/axis_grids.html#plotting-pairwise-relationships-with-pairgrid-and-pairplot) to recreate the plot below.(Don't worry about the the colors)**


```python
sns.pairplot(data=customers)
```




    <seaborn.axisgrid.PairGrid at 0x7f502bc99d68>




![png](output_16_1.png)


**Based off this plot what looks to be the most correlated feature with Yearly Amount Spent?**


```python
# Yearly Amount Spent and Lenght of Membership looks to be most correlated
```

**Create a linear model plot (using seaborn's lmplot) of  Yearly Amount Spent vs. Length of Membership. **


```python
sns.lmplot(data=customers,x='Length of Membership',y='Yearly Amount Spent')
```




    <seaborn.axisgrid.FacetGrid at 0x7f5029cb5c88>




![png](output_20_1.png)


## Training and Testing Data

Now that we've explored the data a bit, let's go ahead and split the data into training and testing sets.
** Set a variable X equal to the numerical features of the customers and a variable y equal to the "Yearly Amount Spent" column. **


```python
customers.info()
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 500 entries, 0 to 499
    Data columns (total 8 columns):
    Email                   500 non-null object
    Address                 500 non-null object
    Avatar                  500 non-null object
    Avg. Session Length     500 non-null float64
    Time on App             500 non-null float64
    Time on Website         500 non-null float64
    Length of Membership    500 non-null float64
    Yearly Amount Spent     500 non-null float64
    dtypes: float64(5), object(3)
    memory usage: 31.3+ KB



```python
customers.columns
```




    Index(['Email', 'Address', 'Avatar', 'Avg. Session Length', 'Time on App',
           'Time on Website', 'Length of Membership', 'Yearly Amount Spent'],
          dtype='object')




```python
X=customers[['Avg. Session Length', 'Time on App',
       'Time on Website', 'Length of Membership']]
y=customers['Yearly Amount Spent']
```

** Use model_selection.train_test_split from sklearn to split the data into training and testing sets. Set test_size=0.3 and random_state=101**


```python
from sklearn.model_selection import train_test_split 
```


```python
X_train,X_test,y_train,y_test=train_test_split(X,y,test_size=0.3,random_state=101)
```

## Training the Model

Now its time to train our model on our training data!

** Import LinearRegression from sklearn.linear_model **


```python
from sklearn.linear_model import LinearRegression
```

**Create an instance of a LinearRegression() model named lm.**


```python
lm = LinearRegression()
```

** Train/fit lm on the training data.**


```python
lm.fit(X_train,y_train)
```




    LinearRegression(copy_X=True, fit_intercept=True, n_jobs=1, normalize=False)



**Print out the coefficients of the model**


```python
lm.coef_
```




    array([ 25.98154972,  38.59015875,   0.19040528,  61.27909654])



## Predicting Test Data
Now that we have fit our model, let's evaluate its performance by predicting off the test values!

** Use lm.predict() to predict off the X_test set of the data.**


```python
y_pred = lm.predict(X_test)
```


```python
y_pred[0:10]
```




    array([ 456.44186104,  402.72005312,  409.2531539 ,  591.4310343 ,
            590.01437275,  548.82396607,  577.59737969,  715.44428115,
            473.7893446 ,  545.9211364 ])



** Create a scatterplot of the real test values versus the predicted values. **


```python
sns.jointplot(x=y_test,y=y_pred).set_axis_labels('Y Test','Predicted Y')
```




    <seaborn.axisgrid.JointGrid at 0x7f502a7a3b70>




![png](output_40_1.png)


## Evaluating the Model

Let's evaluate our model performance by calculating the residual sum of squares and the explained variance score (R^2).

** Calculate the Mean Absolute Error, Mean Squared Error, and the Root Mean Squared Error. Refer to the lecture or to Wikipedia for the formulas**


```python
from sklearn import metrics
```


```python
print('MAE:',metrics.mean_absolute_error(y_test,y_pred))
print('MSE:',metrics.mean_squared_error(y_test,y_pred))
print('RMSE:',np.sqrt(metrics.mean_squared_error(y_test,y_pred)))
```

    MAE: 7.22814865343
    MSE: 79.813051651
    RMSE: 8.93381506698


## Residuals

You should have gotten a very good model with a good fit. Let's quickly explore the residuals to make sure everything was okay with our data. 

**Plot a histogram of the residuals and make sure it looks normally distributed. Use either seaborn distplot, or just plt.hist().**


```python
sns.distplot(y_test-y_pred,rug=True,bins=50)
```




    <matplotlib.axes._subplots.AxesSubplot at 0x7f50250bdfd0>




![png](output_45_1.png)


## Conclusion
We still want to figure out the answer to the original question, do we focus our efforst on mobile app or website development? Or maybe that doesn't even really matter, and Membership Time is what is really important.  Let's see if we can interpret the coefficients at all to get an idea.

** Recreate the dataframe below. **


```python
pd.DataFrame(data=lm.coef_, index=X.columns, columns=['Coefficient'])
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Coefficient</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Avg. Session Length</th>
      <td>25.981550</td>
    </tr>
    <tr>
      <th>Time on App</th>
      <td>38.590159</td>
    </tr>
    <tr>
      <th>Time on Website</th>
      <td>0.190405</td>
    </tr>
    <tr>
      <th>Length of Membership</th>
      <td>61.279097</td>
    </tr>
  </tbody>
</table>
</div>



** How can you interpret these coefficients? **

Holding all other features fixed,
* 1 unit increase in Avg. Session Length is associated with an increase of 25.98 total dollars spent.
* 1 unit increase in Time on App is associated with an increase of 38.59 total dollars spent.
* 1 unit increase in Time on Website is associated with an increase of 0.19 total dollars spent.
* 1 unit increase in Length of Membership is associated with an increase of 61.27 total dollars spent.

**Do you think the company should focus more on their mobile app or on their website?**

By looking at above coeficient for Time on App to Amount Spent, we will not be able to conclude that the focus needs to be on Mobile App. 
From the exploratory analysis, it shows that the Average Time spent on website is longer than App. In addition, looking at the number of users using app vs website also help making a decision.
A suggestion would be the company to support the app, but at the same time should look to improve the website performance. 

## Great Job!

Congrats on your contract work! The company loved the insights! Let's move on.
