﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FGC_CMS
{
    public class MasterPageChange : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            if (Session["userrole"] != null)
            {//check the user weather user is logged in or not
                if (User.IsInRole("User"))
                {
                    this.MasterPageFile = "~/User1.Master";
                }
                else if (User.IsInRole("Admin"))
                {
                    this.MasterPageFile = "~/Home.Master";
                }
            }
            base.OnPreInit(e);
        }
    }
}