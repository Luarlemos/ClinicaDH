package br.com.dh.clinicaDH.paciente;

import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import org.assertj.core.api.Assertions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;
import java.time.LocalDate;

import br.com.dh.clinicaDH.entities.Paciente;

@RunWith(SpringRunner.class)
@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class PacienteRepositoryTests {
	
	@Autowired
	private PacienteRepository pacienteRepository;
	@Test
	public void testeCriaPacienteSemNome() {
		Paciente paciente = new Paciente();
		Paciente pacienteSalvo = this.pacienteRepository.save(paciente);
		Assertions.assertThat(pacienteSalvo.getNome()).isNotNull();
	}
	@Test
	public void testeDataNascimento() {
		Paciente paciente = new Paciente();
		assertThrows(DateTimeParseException.class, paciente.setDataNascimento(LocalDate.of(2020, 13, 10)));
	}
	@Test
	public void testeDataPrimeiraConsulta() {
		Paciente paciente = new Paciente();
		assertThrows(DateTimeParseException.class, paciente.setDataPrimeiraConsulta(LocalDate.of(2020, 13, 10)));
	}
}
