import 'package:flutter/material.dart';

import '../../contents/constants/styles.dart';
import '../shared/widgets/spacing.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF8F0009),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacing.bigHeight(),
              Text('ABOUT THE SCHOOL', style: AppStyles.titleText),
              Spacing.smallHeight(),
              Text(
                '\tThe Polytechnic, Ibadan (typically called "Poly Ibadan") is an institution of higher learning in Ibadan in Oyo State, Nigeria. Founded in 1970, Poly Ibadan is similar to other polytechnics in Nigeria. The institution was established to provide an alternative higher education to universities, particularly in technical skill acquisition.The viocational and skills acqusition center is poised to ensure that students master a skill before leaving the institution and also provides skills training to the host community. The Polytechnic Ibadan is also well known for its unique slogan written in Yoruba language as "Ise loogun Ise" which means \'Work (is) the medicine for poverty\', a classical Yoruba adage which stresses that hardwork is the way out of poverty.',
                textAlign: TextAlign.justify,
              ),
              Text('\tThe institution offers a wide range of specialized short courses for the purpose of improving the vocational capabilities of technical and commercial workers. Poly Ibadan awards the National Diploma (ND), Higher National Diploma (HND), Post Graduate Diploma ( PGD) and other professional certificates to its graduates. It also provides opportunities for creative development and research related to the needs of teaching, industry and the business community.\n The polytechnic runs mainly National Diploma (ND) and Higher National Diploma (HND) programmes in the following on full-time, part-time & daily part-time program with five faculties they include Faculty of Science, Faculty of Engineering, Faculty of Business and Communication Science, Faculty of Financial Management Science and Faculty of Business and Communication Science.',
              textAlign: TextAlign.justify,
              ),
              Spacing.bigHeight(),
              Text(
                'FACULTY OF SCIENCE',
                style: AppStyles.titleText,
              ),
              Spacing.smallHeight(),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                textAlign: TextAlign.justify,
              ),
              Spacing.bigHeight(),
              Text(
                'DEPARTMENT OF COMPUTER-SCIENCE',
                style: AppStyles.titleText,
              ),
              Spacing.smallHeight(),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
