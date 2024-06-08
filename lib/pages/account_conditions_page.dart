// import 'package:drugpack/blocs/profile_bloc/edit_profile_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../blocs/profile_bloc/edit_profile_event.dart';
//
// class AccountConditionsPage extends StatelessWidget {
//   const AccountConditionsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ProfileBloc()..add(GetAccountDrugs()), // Отправляем событие для загрузки списка препаратов
//       child: BlocListener<ProfileBloc, ProfileState>(
//         listener: (context, state) {
//           // Добавьте обработку событий Bloc, если это необходимо
//         },
//         child: AccountConditionsPageContent(),
//       ),
//     );
//   }
// }
//
// class AccountConditionsPageContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<ProfileBloc, ProfileState>(
//         builder: (context, state) {
//           if (state is ProfileSuccess) {
//             // Если список препаратов успешно загружен, отобразите их в ListView.builder
//             return ListView.builder(
//               itemCount: state.message.length,
//               itemBuilder: (context, index) {
//                 final medication = state.medications[index];
//                 return MedicationCard(medication: medication);
//               },
//             );
//           } else if (state is ProfileFailure) {
//             return Center(
//               child: Text('Ошибка при загрузке препаратов'),
//             );
//           } else {
//             // Индикатор загрузки или начальное состояние
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class MedicationCard extends StatelessWidget {
//   final Medication medication;
//
//   const MedicationCard({Key key, this.medication}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Здесь можно определить внешний вид карточки для препарата
//     return Card(
//       child: ListTile(
//         title: Text(medication.name),
//         subtitle: Text(medication.description),
//       ),
//     );
//   }
// }
