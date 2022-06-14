using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RealProjectB1.auth
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divMsg.Visible = false;
                RememberCookie();
            }
           
        }

        private void RememberCookie()
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                txtUsername.Text = Request.Cookies["UserName"].Value;
                txtPassword.Attributes["Value"] = Request.Cookies["Password"].Value;
            }
        }
        /// <summary>
        /// Login Info Check
        /// </summary>
        /// <param name="UserName"> string field</param>
        /// <param name="UPass"> string field</param>
        /// <returns>data table</returns>
        private DataTable CheckLogin(string UserName,string UPass)
        {
            DataTable dt = new DataTable();
            string connectionStr = @"Data Source = DESKTOP-M0T69MU\TARIKUL; Initial Catalog=DotNetB2; User ID =sa; Password=123";
            SqlConnection cnn;
            cnn = new SqlConnection(connectionStr);
            SqlCommand cmd;
            string Sqlstring = @"select User_Auth.UserId,
            (studentreg.FirstName+' ' +isnull (studentreg.MiddleName,'')+' '+studentreg.LastName) AS FullName,UserImage

            from User_Auth INNER JOIN
            studentreg ON User_Auth.UserId=studentreg.UserId

            where IsActive=1 and User_Auth.UserName='"+UserName+"' and UserPassword='"+UPass+"'";
            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet();
            try
            {
                cnn.Open();
                cmd = new SqlCommand(Sqlstring, cnn);
                sda.SelectCommand = cmd;
                sda.Fill(ds);
                dt = ds.Tables[0];
                cnn.Close();
            }
            catch (Exception)
            {

            }
            return dt;
        }
        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            if (CheckFieldValue()==false)
            {
                DataTable dtUserInfo = CheckLogin(txtUsername.Text.Trim(),txtPassword.Text);
                if (dtUserInfo.Rows.Count>0)
                {
                    Session["UserId"] = dtUserInfo.Rows[0]["UserId"].ToString();
                    Session["UserName"] = dtUserInfo.Rows[0]["FullName"].ToString();
                    Session["UserImage"] = dtUserInfo.Rows[0]["UserImage"].ToString();
                    SetCookie();

                    Response.Redirect("~/AdminHome.aspx");
                }
                else
                {
                    lblMsg.Text = "Incorrect Username or Password";
                    divMsg.Visible = true;
                }
   
            }
            
        }

        private void SetCookie()
        {
            HttpCookie mycookie = new HttpCookie("mycookie");
            //mycookie["UserName"] = txtUsername.Text.Trim();
            //mycookie["Password"] = txtPassword.Text.Trim();
            mycookie["UserName"] ="";
            mycookie["Password"] = "";

            Response.Cookies.Add(mycookie);

            if (chkRememberMe.Checked)
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(3);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(3);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Cookies["UserName"].Value = txtUsername.Text.Trim();
            Response.Cookies["Password"].Value = txtPassword.Text.Trim();

        }

        private bool CheckFieldValue()
        {
            bool IsReq = false;

            if (txtUsername.Text=="")
            {
                IsReq = true;
                lblMsg.Text = "Username can't be empty";

            }
            else if (txtPassword.Text =="")
            {
                IsReq = true;
                lblMsg.Text = "Password can't be empty";
            }

            if (IsReq==true)
            {
                divMsg.Visible = true;
            }
            else
            {
                divMsg.Visible = false;
            }

            return IsReq;
        }


    }
}