﻿using System;
using Unilib.CommunicationServer.Common;

namespace Unilib.CommunicationServer.DataEntities
{
    public class AuthorEntity:IEntity
    {
        public virtual Guid AuthorId { get; set; }
        public virtual string Name { get; set; }
        public virtual string FullName { get; set; }
        public virtual string FirstPart { get; set; }
        public virtual string SufixPart { get; set; }
        public virtual string OtherNames { get; set; }
        public virtual string NameAddition { get; set; }
    }
}
