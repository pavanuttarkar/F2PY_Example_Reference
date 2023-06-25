import numpy as np


def get_delay(ha, 
              loc, 
              dec):
    """Example function for f2py
       
    """
    #Defining constants..
    c_per_mus   = 299.792458
    pi          = 3.14159265359
    deg2rad     = pi/180.0
    X           = np.zeros((len(ha)))
    Y           = np.zeros((len(ha)))
    Z           = np.zeros((len(ha)))
    W_geometric = np.zeros((len(ha)))
    delay_now   = np.zeros((len(ha)))

    for i in range(len(ha)):
        X[i]            = (loc[0] * np.cos(dec*deg2rad)) / c_per_mus
        Y[i]            = (-1.0*loc[1]*np.cos(dec*deg2rad)) / c_per_mus
        Z[i]            = (loc[2]*np.sin(dec*deg2rad))/c_per_mus
        W_geometric[i]  = (X[i]*np.cos(ha[i]*deg2rad) +Y[i]*np.sin(ha[i]*deg2rad) + Z[i])
        delay_now[i]    = X[i]*np.cos(ha[i]*deg2rad)  +Y[i]*np.sin(ha[i]*deg2rad)
    return delay_now, W_geometric
