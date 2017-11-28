using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// UserInfoEnum 的摘要说明
/// </summary>
public class UserInfoEnum
{
	/// <summary>
	/// 性别枚举
	/// </summary>
	public enum SexEnum {
		男 = 0,
		女 = 1
	}

	/// <summary>
	/// 系统用户权限
	/// </summary>
	public enum RoleEnum {
		系统操作员 = 0,
		教师 = 1,
		普通用户 = 2
	}

	/// <summary>
	/// 用户学历
	/// </summary>
	public enum Education {
		学士 = 0,
		硕士 = 1,
		博士 = 2,
		其他 = 3
	}
}