# Code book for Coursera *Getting and Cleaning Data* course project

The data set that this code book pertains to is located in the `tidy_data.txt` file of this repository.

See the `README.md` file of this repository for background information on this data set.

The structure of the data set is described in the [Data](#data) section, its variables are listed in the [Variables](#variables) section, and the transformations that were carried out to obtain the data set based on the source data are presented in the [Transformations](#transformations) section.

## Data <a name="data"></a>

The `tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the [Variables](#variables) section, and the following rows contain the values of these variables. 

## Variables <a name="variables"></a>

Each row contains, for a given subject and activity, 79 averaged signal measurements.

### Identifiers <a name="identifiers"></a>

- `SubjectId`

	Subject identifier, integer, ranges from 1 to 30.

- `ActivityId`

	Activity identifier, string with 6 possible values in `ActivityName`: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Average of measurements <a name="average-measurements"></a>

All measurements are floating-point values, normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing `Accelerometer`) were made in *g*'s (9.81 m.s⁻²) and gyroscope measurements (variables containing `Gyroscope`) were made in radians per second (rad.s⁻¹).

Magnitudes of three-dimensional signals (variables containing `Magnitude`) were calculated using the Euclidean norm.

The measurements are classified in two domains:

- Time-domain signals (variables prefixed by `timeDomain`), resulting from the capture of accelerometer and gyroscope raw signals.

- Frequency-domain signals (variables prefixed by `frequencyDomain`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

#### Time-domain signals

- Average time-domain body acceleration in the X, Y and Z directions:

	- `Time.BodyAccelerometer.STD. X`
	- `Time.BodyAccelerometer.STD. Y`
	- `Time.BodyAccelerometer.STD. Z`

- Standard deviation of the time-domain body acceleration in the X, Y and Z directions:

	- `Time.BodyAccelerometer.STD. X`
	- `Time.BodyAccelerometer.STD. Y
	- `Time.BodyAccelerometer.STD. Z`

- Average time-domain gravity acceleration in the X, Y and Z directions:

	- `Time.GravityAccelerometer.Mean. X`
	- `Time.GravityAccelerometer.Mean. Y`
	- `Time.GravityAccelerometer.Mean. Z`

- Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:

	- `Time.GravityAccelerometer.STD. X`
	- `Time.GravityAccelerometer.STD. Y`
	- `Time.GravityAccelerometer.STD. Z`

- Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `Time.BodyAccelerometer.Jerk.Mean. X`
	- `Time.BodyAccelerometer.Jerk.Mean. Y`
	- `Time.BodyAccelerometer.Jerk.Mean. Z`

- Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `Time.BodyAccelerometer.Jerk.STD. X`
	- `Time.BodyAccelerometer.Jerk.STD. Y `
	- `Time.BodyAccelerometer.Jerk.STD. Z`

- Average time-domain body angular velocity in the X, Y and Z directions:

	- `Time.BodyGyroscope.Mean. X`
	- `Time.BodyGyroscope.Mean. Y`
	- `Time.BodyGyroscope.Mean. Z`

- Standard deviation of the time-domain body angular velocity in the X, Y and Z directions:

	- `Time.BodyGyroscope.STD. X`
	- `Time.BodyGyroscope.STD. Y`
	- `Time.BodyGyroscope.STD. Z`

- Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

	- `Time.BodyGyroscope.Jerk.Mean. X`
	- `Time.BodyGyroscope.Jerk.Mean. Y`
	- `Time.BodyGyroscope.Jerk.Mean. Z`

- Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:

	- `Time.BodyGyroscope.Jerk.STD. X`
	- `Time.BodyGyroscope.Jerk.STD. Y`
	- `Time.BodyGyroscope.Jerk.STD. Z`

- Average and standard deviation of the time-domain magnitude of body acceleration:

	- `Time.BodyAccelerometer.Magnitude.Mean`
	- `Time.BodyAccelerometer.Magnitude.STD

- Average and standard deviation of the time-domain magnitude of gravity acceleration:

	- `Time.GravityAccelerometer.Magnitude.Mean`
	- `Time.GravityAccelerometer.Magnitude.STD`

- Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

	- `Time.BodyAccelerometer.JerkMagnitude.Mean`
	- `Time.BodyAccelerometer.JerkMagnitude.STD`

- Average and standard deviation of the time-domain magnitude of body angular velocity:

	- `Time.BodyGyroscope.Magnitude.Mean`
	- `Time.BodyGyroscope.Magnitude.STD`

- Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

	- `Time.BodyGyroscope.JerkMagnitude.Mean`
	- `Time.BodyGyroscope.JerkMagnitude.STD`

#### Frequency-domain signals

- Average frequency-domain body acceleration in the X, Y and Z directions:

	- `Freq.BodyAccelerometer.Mean. X`
	- `Freq.BodyAccelerometer.Mean. Y`
	- `Freq.BodyAccelerometer.Mean. Z`

- Standard deviation of the frequency-domain body acceleration in the X, Y and Z directions:

	- `Freq.BodyAccelerometer.STD. X`
	- `Freq.BodyAccelerometer.STD. Y`
	- `Freq.BodyAccelerometer.STD. Z`

- Weighted average of the frequency components of the frequency-domain body acceleration in the X, Y and Z directions:

	- `Freq.BodyAccelerometer.Mean.Freq. X`
	- `Freq.BodyAccelerometer.Mean.Freq. Y`
	- `Freq.BodyAccelerometer.Mean.Freq. Z`

- Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `Freq.BodyAccelerometer.Jerk.Mean. X`
	- `Freq.BodyAccelerometer.Jerk.Mean. Y`
	- `Freq.BodyAccelerometer.Jerk.Mean. Z

- Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `Freq.BodyAccelerometer.Jerk.STD. X`
	- `Freq.BodyAccelerometer.Jerk.STD. Y`
	- `Freq.BodyAccelerometer.Jerk.STD. Z`

- Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:

	- `Freq.BodyAccelerometer.Jerk.Mean.Freq. X`
	- `Freq.BodyAccelerometer.Jerk.Mean.Freq. Y`
	- `Freq.BodyAccelerometer.Jerk.Mean.Freq. Z`

- Average frequency-domain body angular velocity in the X, Y and Z directions:

	- `Freq.BodyGyroscope.Mean. X`
	- `Freq.BodyGyroscope.Mean. Y`
	- `Freq.BodyGyroscope.Mean. Z`

- Standard deviation of the frequency-domain body angular velocity in the X, Y and Z directions:

	- `Freq.BodyGyroscope.STD. X`
	- `Freq.BodyGyroscope.STD. Y`
	- `Freq.BodyGyroscope.STD. Z`

- Weighted average of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions:

	- `Freq.BodyGyroscope.Mean.Freq. X`
	- `Freq.BodyGyroscope.Mean.Freq. Y`
	- `Freq.BodyGyroscope.Mean.Freq. Z`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration:

	- `Freq.BodyAccelerometer.Magnitude.Mean`
	- `Freq.BodyAccelerometer.Magnitude.STD`
	- `Freq.BodyAccelerometer.Magnitude.Mean.Freq`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time):

	- `Freq.BodyBodyAccelerometer.JerkMagnitude.Mean`
	- `Freq.BodyBodyAccelerometer.JerkMagnitude.STD`
	- `Freq.BodyBodyAccelerometer.JerkMagnitude.Mean.Freq`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity:

	- `Freq.BodyBodyGyroscope.Magnitude.Mean`
	- `Freq.BodyBodyGyroscope.Magnitude.STD`
	- `Freq.BodyBodyGyroscope.Magnitude.Mean.Freq`

- Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):

	- `Freq.BodyBodyGyroscope.JerkMagnitude.Mean`
	- `Freq.BodyBodyGyroscope.JerkMagnitude.STD`
	- `Freq.BodyBodyGyroscope.JerkMagnitude.Mean.Freq`
