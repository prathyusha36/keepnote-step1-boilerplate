
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
	<h2>Note Information</h2>
	<form action="saveNote" method="post">
		<table>
			<tr>
				<td>Note Id</td>
				<td><input type="text" id="noteId" name="noteId"></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" id="noteTitle" name="noteTitle"></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><input type="text" id="noteContent" name="noteContent"></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><select id="noteStatus" name="noteStatus">
						<option value="active">Active</option>
						<option value="inactive">Inactive</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
	<c:if test="${not empty error}">
		<p style="color:red">Error</p> : ${error}
	</c:if>
	<h2>Saved notes</h2>
	<table>
	     <tr>
    		     <th>Note Id</th>
    		     <th>Title</th>
    		     <th>Content</th>
    		     <th>Status</th>
    		     <th>Created At</th>
         </tr>
		<c:forEach items="${savedNotes}"  var="note">

			<tr>

				<td>${note.noteId}</td>
				<td>${note.noteTitle}</td>
				<td>${note.noteContent}</td>
				<td>${note.noteStatus}</td>
				<td>${note.createdAt}</td>
				<td>
                	<form action="deleteNote" method="post">
                		<input type="hidden" id="noteId" name="noteId" value="${note.noteId}"/>
                		<button type="submit">Delete</button>
                	</form>
                </td>
			</tr>


			</c:forEach>
		</table>
</body>
</html>