﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using NServiceBus;
using NServiceBus.ObjectBuilder;

namespace Unilib.Frontend.Injection
{
    public class NServiceBusDependencyResolverAdapter : IDependencyResolver
    {
        readonly IBuilder builder;
 
        public NServiceBusDependencyResolverAdapter(IBuilder builder)
        {
            this.builder = builder;
        }
        
        public object GetService(Type serviceType)
        {
            if (Configure.Instance.Configurer.HasComponent(serviceType))
                return builder.Build(serviceType);
            else
                return null;
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            return builder.BuildAll(serviceType); 
        }
    }
}