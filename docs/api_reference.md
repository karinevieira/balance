
## API Reference

#### Sign up

```
  curl -X POST localhost:3000/signup
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -d '{"user": {"email": "janedoe@email.com", "password": "password", "password_confirmation": "password"}}'
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `name` | `string` | **Not Required** |
| `phone_number` | `string` | **Not Required** |
| `email` | `string` | **Required** |
| `password` | `string` | **Required** |
| `password_confirmation` | `string` | **Required** |

#### Login

```
  curl -X POST localhost:3000/login
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -d '{"user": {"email": "janedoe@email.com", "password": "password"}}'
```
It returns an authentication JWT token in the response header, which will need to be passed in the header of the subsequent routes.

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `email`      | `string` | **Required** |
| `password`      | `string` | **Required** |

#### Logout

```
  curl -X DELETE localhost:3000/logout
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -H 'Authorization: user-token'
```

#### Update profile

```
  curl -X PUT localhost:3000/api/v1/profile
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -H 'Authorization: user-token'
   -d '{"profile": {"weight": 45, "height_in_cm": 153, "workout_in_min": 60, "workout_days_frequency": 3}}'
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `weight` | `integer` | **Required** |
| `height_in_cm` | `integer` | **Required** |
| `workout_in_min` | `integer` | **Required** |
| `workout_days_frequency` | `integer` | **Required** |
| `active_lifestyle` | `boolean` | **Not Required**. By default, it's `false` |
| `gender` | `string` | **Not Required** |
| `physical_activities` | `string` | **Not Required** |

#### Show profile

```
  curl -X GET localhost:3000/api/v1/profile
   -H 'Accept: application/json'
   -H 'Content-Type: application/json'
   -H 'Authorization: user-token'
```
