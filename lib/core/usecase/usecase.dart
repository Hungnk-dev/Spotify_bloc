// Type và Params là generic types, nghĩa là kiểu dữ liệu mà lớp này có thể làm việc với sẽ được xác định khi lớp được kế thừa hoặc sử dụng.
//Type: Loại dữ liệu trả về (chẳng hạn như String, int, hoặc một đối tượng phức tạp).
// Params: Loại dữ liệu mà phương thức call() nhận vào, có thể là bất kỳ đối tượng nào mà bạn muốn truyền vào khi thực thi "use case".
abstract class UseCase<Type, Params> {
  Future<Type> call({Params? params});
}
