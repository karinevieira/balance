
# API Reference

- [Authentication](#authentication)
- [Profiles](#profiles)
- [Exercise Metrics](#exercise-metrics)

## Authentication

### Sign up

POST `/signup`

```
  curl -X POST https://balance-dxhn.onrender.com/signup
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -d '{"user": {"email": "janedoe@email.com", "password": "password", "password_confirmation": "password"}}'
```
  | Parameter | Type     | Description                |
  | :-------- | :------- | :------------------------- |
  | `name` | `string` | **Optional** |
  | `phone_number` | `string` | **Optional** |
  | `email` | `string` | **Required** |
  | `password` | `string` | **Required** |
  | `password_confirmation` | `string` | **Required** |

#### Response

```javascript
  {
    "status": {
      "code": 200,
      "message": "Signed up successfully."
    },
    "data": {
      "id": 1,
      "email": "janedoe@email.com",
      "name": null,
      "phone_number": null,
      "profile": null
    }
  }
```

### Login

POST `/login`

```
  curl -X POST https://balance-dxhn.onrender.com/login
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -d '{"user": {"email": "janedoe@email.com", "password": "password"}}'
```
It returns an authentication JWT token in the response header, which will need to be passed in the header of the subsequent routes.

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `email`      | `string` | **Required** |
| `password`      | `string` | **Required** |

#### Response

```javascript
{
	"status": {
		"code": 200,
		"message": "Logged in successfully.",
		"data": {
			"user": {
				"id": 1,
				"email": "janedoe@email.com",
				"name": null,
				"phone_number": null,
				"profile": null
			}
		}
	}
}
```

### Logout

#### Request
DELETE `/logout`

```
  curl -X DELETE https://balance-dxhn.onrender.com/logout
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -H 'Authorization: user-token'
```
#### Response

```javascript
{
	"status": 200,
	"message": "Logged out successfully."
}
```

## Profiles

### Read
Returns all profiles.

GET `/api/v1/profiles`

```
  curl -X GET https://balance-dxhn.onrender.com/api/v1/profiles
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
```

### Show
Returns profile for given user id.

GET `/api/v1/profiles/:id`

```
  curl -X GET https://balance-dxhn.onrender.com/api/v1/profiles/1
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
```

#### Response

```javascript
{
	"data": {
		"id": "1",
		"type": "user",
		"attributes": {
			"id": 1,
			"email": "janedoe@email.com",
			"name": null,
			"phone_number": null,
			"profile": {
				"user_id": 1,
				"weight": 45,
				"height_in_cm": 153,
				"workout_in_min": 60,
				"workout_days_frequency": 3,
				"active_lifestyle": false,
				"gender": null,
				"physical_activities": null,
				"id": 1,
				"created_at": "2024-01-03T18:29:56.537Z",
				"updated_at": "2024-01-06T17:32:23.731Z"
			}
		}
	}
}
```

### Update
Updates profile for given user id.

PUT `/api/v1/profiles/:id`

```
  curl -X PUT https://balance-dxhn.onrender.com/api/v1/profiles/1
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -H 'Authorization: user-token'
   -d '{"profile": {"weight": 45, "height_in_cm": 153, "workout_in_min": 60, "workout_days_frequency": 3}}'
```
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `weight` | `integer` | **Required** |
| `height_in_cm` | `integer` | **Required** |
| `workout_in_min` | `integer` | **Required** The duration of the workout activity in minutes. |
| `workout_days_frequency` | `integer` | **Required** The frequency of days the user exercises. |
| `active_lifestyle` | `boolean` | **Optional** If the user usually exercises. By default, it's `false`. |
| `gender` | `string` | **Optional** |
| `physical_activities` | `string` | **Optional** The physical activities that the user practices. |

#### Response

```javascript
{
	"data": {
		"id": "1",
		"type": "user",
		"attributes": {
			"id": 1,
			"email": "janedoe@email.com",
			"name": null,
			"phone_number": null,
			"profile": {
				"user_id": 1,
				"weight": 45,
				"height_in_cm": 153,
				"workout_in_min": 60,
				"workout_days_frequency": 3,
				"active_lifestyle": false,
				"gender": null,
				"physical_activities": null,
				"id": 1,
				"created_at": "2024-01-03T18:29:56.537Z",
				"updated_at": "2024-01-06T17:32:23.731Z"
			}
		}
	}
}
```
## Exercise Metrics

### Create

POST `/api/v1/exercise_metrics?user_id={id}`

```
  curl -X POST https://balance-dxhn.onrender.com/api/v1/exercise_metrics/user_id=1
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -d '{"exercise_metric": {"name": "Caminhada", "intensity": "6", "duration_in_min": 60}}'
```
| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `user_id` | `integer` | **Required** |
| `steps` | `integer` | **Optional** |
| `distance_in_m` | `integer` | **Optional** |
| `intensity` | `string` | **Required** |
| `duration_in_min` | `integer` | **Required** |

#### Response

```javascript
{
	"data": {
		"id": "1",
		"type": "exercise_metric",
		"attributes": {
			"user_id": 1,
			"name": "Caminhada",
			"intensity": "low",
			"duration_in_min": 60
		}
	}
}
```

### Read
Returns a list of data for exercises performed by the user.

GET `/api/v1/exercise_metrics?user_id={id}`

```
  curl -X GET https://balance-dxhn.onrender.com/api/v1/exercise_metrics?user_id=1
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
```

### Update
PUT `/api/v1/exercise_metrics/:id?user_id={id}`

```
  curl -X PUT https://balance-dxhn.onrender.com/api/v1/exercise_metrics/1?user_id=1
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -d '{"exercise_metric": {"duration_in_min": 70}}'
```

#### Response

```javascript
{
	"data": {
		"id": "1",
		"type": "exercise_metric",
		"attributes": {
			"user_id": 1,
			"name": "Caminhada",
			"intensity": "low",
			"duration_in_min": 70
		}
	}
}
```
### Delete
DELETE `/api/v1/exercise_metrics/:id?user_id={id}`

```
  curl -X DELETE https://balance-dxhn.onrender.com/api/v1/exercise_metrics/1?user_id=1
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
```
