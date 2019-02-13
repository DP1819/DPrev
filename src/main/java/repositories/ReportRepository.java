
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Report;

@Repository
public interface ReportRepository extends GenericRepository<Report> {

	@Query("select r from Report r where r.complaint.id = ?1")
	Collection<Report> findByComplaint(Integer complaintId);

	@Query("select min(r.notes.size), max(r.notes.size), avg(r.notes.size),sqrt(sum(r.notes.size*r.notes.size)/count(r.notes.size)-(avg(r.notes.size)*avg(r.notes.size))) from Report r)")
	Double[] refeeReportStats();

	/*
	 * @Query("select min(count(n)), max(count(n)), avg(count(n)),sqrt(sum(count(n)*count(n))/count(n1)-(avg(count(n))*avg(count(n)))) from Note n join n.report r , Note n1 group by r")
	 * Double[] refeeReportStats();
	 */

}
