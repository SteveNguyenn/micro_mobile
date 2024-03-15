package com.example.yody_micro_android

import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.activity.result.contract.ActivityResultContracts
import androidx.fragment.app.Fragment
import com.example.yody_micro_android.databinding.FragmentFirstBinding

/**
 * A simple [Fragment] subclass as the default destination in the navigation.
 */
class FirstFragment : Fragment() {

    private var _binding: FragmentFirstBinding? = null
    private val binding get() = _binding!!

    private var resultLauncher =
        this.registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
            if (result.resultCode == 100) {
                // There are no request codes
                val data: Intent? = result.data
                binding.loginResult.text = "${data?.getIntExtra("result", 0)}"
            }
        }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {

        _binding = FragmentFirstBinding.inflate(inflater, container, false)
        return binding.root

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        binding.loginButton.setOnClickListener {
            resultLauncher.launch(
                LoginActivity
                    .withNewEngine()
                    .initialRoute("/yody_login")
                    .build(view.context)
            )
        }
        binding.profileButton.setOnClickListener {
            resultLauncher.launch(
                ProfileActivity
                    .withNewEngine()
                    .initialRoute("/yody_profile")
                    .build(view.context)
            )
        }
        binding.foodButton.setOnClickListener {
            resultLauncher.launch(Intent(view.context, FoodActivity::class.java))
        }
        binding.employeeButton.setOnClickListener {
            resultLauncher.launch(
                Intent(view.context, EmployeeActivity::class.java)
            )
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}