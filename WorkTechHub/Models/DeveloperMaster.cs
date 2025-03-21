//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WorkTechHub.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DeveloperMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DeveloperMaster()
        {
            this.FeedbackMasters = new HashSet<FeedbackMaster>();
            this.RequestMasters = new HashSet<RequestMaster>();
            this.TaskMasters = new HashSet<TaskMaster>();
            this.UploadCodeMasters = new HashSet<UploadCodeMaster>();
            this.WorkReportMasters = new HashSet<WorkReportMaster>();
        }
    
        public string Name { get; set; }
        public string Email_Id { get; set; }
        public string Mobile_No { get; set; }
        public string Qualification { get; set; }
        public string Gender { get; set; }
        public string Address { get; set; }
        public string Designation { get; set; }
        public string ProfilePic { get; set; }
        public Nullable<System.DateTime> Registered_on { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FeedbackMaster> FeedbackMasters { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequestMaster> RequestMasters { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TaskMaster> TaskMasters { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UploadCodeMaster> UploadCodeMasters { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkReportMaster> WorkReportMasters { get; set; }
    }
}
