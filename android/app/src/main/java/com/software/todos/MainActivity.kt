package com.software.todos

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.navigation.compose.*
import com.software.todos.ui.theme.*
import com.software.todos.ui.screens.*

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            App()
        }
    }
}

@Composable
fun App() {
    val navController = rememberNavController()

    TodosTheme {
        Surface(
            modifier = Modifier.fillMaxSize(),
            color = SecondaryColor
        ) {
            NavHost(
                navController = navController,
                startDestination = "auth"
            ) {
                composable("auth") {
                    Auth(navController)
                }
                composable("home") {
                    Home(navController)
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun AppPreview() {
    App()
}
