Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B103E0C50
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430244; cv=none; b=hFqrmrRqwBodlQ+t+xfDDK2b7LXFxU0J+i8ZlIlQMlcP8VesfjZUeVA9xea4pyPP/fXwLmmFB/0UxIQ2bVbZ/lZeWpYXO+e1z3GMK2IeGI2gC7q5Xji7TtAGjsddjlEMM1VObfu59JSJV8mHIIGLu1qzcs+oMMKTe9LQItuBWEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430244; c=relaxed/simple;
	bh=9ctY17ROWC1UecrpN6Iri7rIFXCRd3ly8uwOYRSqsgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9s4+R6Lt3Nj1LeQB7wcFsyz9X5yvgYk1lazKH4+W2kMp6iNhOfU68kd5r0dvIGSt4i5/xQqTPQNb80jUi2jC8f9thEJ6cIMN3korLCIp5UPAL3lECkQCCEqSvbrrPCvGl+ZH8XNNoIOBMBcApplhLOUNmanFEcePTDkZjn85U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z9UAe2XM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z9UAe2XM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so979335e9.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 03:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788430241; x=1789035041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=;
        b=Z9UAe2XMOt5QmC6myRDdUG7rGhDoTyVcLg4qWDRC9zqDoVOJpNoCLhrdtbX1sfwBKb
         jRFH6sfWFa6/heCP76q4qNsIlttFKpItnCIsET4QcpOXWbgRYB2BaMtlep+084C6p75a
         dSxAfYQlNrZXTBVyYiXl2S4yuIzUKgpQ8clmLAsTnERgFy3Oznj9uAcrz5YSC4C87q8Q
         +KirPLVXhTZOXTNA9MkaGu0foCxRBSV7J3l5kD1LaoDWTtrwmV3bjfrpSVe88LWIFLVd
         fxbnN4Hcb84Cr8P2/06cirjXrN9fF+HXKdGb/EswIztDbOahnnEtGUUvvUV3O5WbSfA1
         R9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430241; x=1789035041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+pGX1kR1YWXhGrmpKIk1Ega27SLYogpSDSn/oUaopE=;
        b=X5ucTqOiFA+D6Z5Yv5/7YGS4C4mua8+ZUGVNUjNW+iohp0Hut9avgYCbg/4BrhoQKx
         7kuQc5jg9VR2IGiVUJDt0SUGRXjJxa6XiCkS+aJGtD0tnHPLSzSE2Aa/TOIc8FGAd9lU
         qBeXYIjUxBXWEmPlLtP34tMFjV9C3iotUh5YOtGOqpo/EBp6V40Rr/1JDrH3PzzabOV2
         FZcXFBQNp+GAhQke8dXMjuAplsOOCF3PXKguIfvThYMIml8HhzUtRojZn3KdTlI2Qef2
         RQKpVfBvfjUOMdujaLoOX/DKk+LqpBuXlMyQP3BFSBxCxVb9XNl15dg7hPhjpzjqxh8u
         UCtw==
X-Forwarded-Encrypted: i=1; AKwUvBzvaD05CLN5Q0jZaWRt6mE3DySgDcU19ttYLU7FstL9SNyCu4G9by7kz6NA8nEBkRt7pttqcLwG4qYO@vger.kernel.org
X-Gm-Message-State: AFuF++kCc03Rwuaclo+Tzu1ykhFiVqEd6yxNp8tvlnrmNcCDp/KheWjg
	jQARKZCD3os+UgqC+rnkHOOCUXM1g/TCsghNfkfI5iWPH7HOnTWBCy9jtY5kE3rbSg==
X-Gm-Gg: AYBFou3eLsMXhzDUs37LufGdhPAOfGO9Md5cWQAsQmLJhgHl2XMJ1Nd+Nw9eRZ+x0jW
	bDOBtjy8pyGZg2eiEwrLJIB1a9XkAozb8MMsbFduFVxHEcrstz58gmUNuXcWD2MSUKin8rNFPNt
	zsjzd5OMl7SCdSZ2zqHnwgCBTmC2M6ZFOMJWf0lbhAddfv/KgjupDrM/yeWYYOYTkFwhFgIfP7v
	yYrxtXf6IyMfOCqy8YSDMLmhuiUuEHp51Y1scjT0H1K1K6EmUwyYpmk/5lU8XcIi4sF4IDDw2Vz
	hQ91C3L/c30IQvWforDrmcrGdZ9w/9FIa2Bx7FntPMC+8doFgjCiMfwYGad1uKtTNIP6fRhWFwn
	cfC0yPG6vDIb0V3e66GNHxBMnbljzyVTSyS9I1H9wPkTaWQOX+6+Qq6TZdETbJzGHOocoX6lCIN
	b8BXU9/3Spa5jH8hFeQ55LnFcnGuJGzdoASSHyamsKNqdrvTWNpQ48kl4BrnyxgPedsTw66XsM2
	eZ4rbqjYoo7Z8LUXAG9y9S+z5Z0enjNl1Z99sUDeoxuJQ==
X-Received: by 2002:a05:600c:1906:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49ce57e7a9dmr190171115e9.4.1788430240105;
        Thu, 03 Sep 2026 03:10:40 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf2531232sm33980375e9.7.2026.09.03.03.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:10:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:10:36 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 09/10] firmware: arm_ffa: Introduce ffa-lend-pool
Message-ID: <aplHnDS2e-Cd5yPC@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-10-vdonnefort@google.com>
 <20260902173826.GC1440252-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902173826.GC1440252-robh@kernel.org>

On Wed, Sep 02, 2026 at 12:38:26PM -0500, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 11:47:11AM +0100, Vincent Donnefort wrote:
> > When memory is lent to the Secure world via FF-A, fatal CPU speculative
> > reads from Non-Secure can still occur as long as it retains a cacheable
> > mapping to that memory. Introduce the "arm,ffa-lend-pool"
> > reserved-memory CMA driver to unmap pages before lending
> > (ffa_prepare_lend()) and restore them upon reclaim
> > (ffa_lend_reclaimed()). Devices bind to the pool via the "memory-region"
> > DT property or via ffa_lend_pool_attach().
> > 
> >   reserved-memory {
> >       #address-cells = <0x2>;
> >       #size-cells = <0x2>;
> >       ranges;
> > 
> >       ffa_lend: ffa-lend-pool {
> >           compatible = "arm,ffa-lend-pool";
> 
> Needs a binding schema...

Ack

> 
> >           reusable;
> >           ll-map;
> >           size = <0x0 0x4000000>;
> >       };
> >   };
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> [...]
> 
> > +static int __init ffa_lend_pool_setup(unsigned long node, struct reserved_mem *rmem)
> > +{
> > +	struct cma *cma;
> > +	int ret;
> > +
> > +	if (!of_get_flat_dt_prop(node, "reusable", NULL) ||
> > +	    of_get_flat_dt_prop(node, "no-map", NULL)) {
> > +		pr_err("FF-A lend pool: node must be 'reusable' and not 'no-map'\n");
> > +		return -EINVAL;
> 
> Your schema should enforce/check this.
> 
> [...]
> 
> > +static const struct reserved_mem_ops ffa_lend_pool_ops = {
> > +	.node_init	= ffa_lend_pool_setup,
> > +	.device_init	= ffa_lend_pool_device_init,
> > +	.device_release = ffa_lend_pool_device_release,
> > +};
> > +RESERVEDMEM_OF_DECLARE(ffa_lend_pool, "arm,ffa-lend-pool", &ffa_lend_pool_ops);
> 
> Do you need this early? If not, you can create a platform driver for 
> "arm,ffa-lend-pool". ramoops is implemented that way for example.
> 
> Rob

Only memblock_mark_llmap() must be called very early.

The rest just need to be in place before the TEE driver probed. So a platform
driver should work.

Thanks!

-- 
Vincent
