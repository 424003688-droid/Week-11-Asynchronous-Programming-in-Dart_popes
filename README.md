# PC16 Mobile Development - Week 11 Task

**Course:** PC16 - Mobile Development with Lab  
**Institution:** National Teachers College  
**Topic:** Object-Oriented Programming & Asynchronous Programming in Dart  

## Overview
This repository contains an enhanced Dart OOP console application built across Weeks 9, 10, and 11. It demonstrates core OOP principles along with asynchronous programming using `Future`, `async`, and `await`.

## Project Structure & Rubric Fulfillment

### Week 10: OOP Architecture
* **Base Class:** `Student` serves as the primary base class.
* **Inheritance:** `UndergraduateStudent` and `GraduateStudent` extend `Student`.
* **Polymorphism:** Derived classes override `evaluatePerformance()` and `printRecord()` for specialized outputs.
* **Abstract Class / Interface:** `Evaluatable` defines an interface forcing implementation of `evaluatePerformance()`.
* **Mixin:** `Extracurriculars` adds activity tracking functionality to `UndergraduateStudent` via `with`.

### Week 11: Asynchronous Operations
* **Async Method:** `saveRecordToCloud()` in `Student` returns a `Future<String>`.
* **Simulated Delay:** Uses `Future.delayed(Duration(seconds: 2))` to simulate cloud storage operations.
* **Non-Blocking Execution:** `main()` uses `async`/`await` and outputs status messages immediately before and after the asynchronous delay to demonstrate non-blocking behavior.

## How to Run
Ensure the Dart SDK is installed, then run:

```bash
dart run main.dart
