package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	r.GET("/hello", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "HelloWorld",
		})
	})
	err := r.Run("0.0.0.0:8899")
	if err != nil {
		panic(err.Error())
	}
}
