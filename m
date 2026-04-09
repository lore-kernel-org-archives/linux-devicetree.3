Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8BC2EBBA4;
	Thu,  9 Apr 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775760676; cv=none; b=MLhMB8gY9KHZ6KrOZEJjQPnx9lZYxhc6kIJIVYH9Zj1qqWWup2Z+PdjZYPNxiyk2UgPklJ9YDbPypzicWUZ2v4anAUUmivd9UL0By+ZwWQI3awvB1js1NQ2/Yg4NV4iOPnZjDVwYjCHQlsDz/f+rusol+GOOxN9ZyNzjAXijEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775760676; c=relaxed/simple;
	bh=dq70URP/Krt9M4r9eo801pm+IiIX/boqdHgrYpqLcnA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awg1RfGrLt7CTxgJh82M5fmTXTefZ4cgZp6ii6c6lt8hjlkJpbrNrEheZo8x3i1BSXArFmBaganjXuxL2lT7XSX0zhn1CqcWawOF5JEOdZ7UODh1lvJ3FiwMFuuNBD24p8J6oDndHxQKDH5eOAU03hEWNiR0+5jzTpw+zf04jbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=PgH0hWPb; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="PgH0hWPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1775760675; x=1807296675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HrytP8IlU1zcnz3KNtUwmivDgViJtRjefBb3Lu7mQ2M=;
  b=PgH0hWPbPyAjxGj6gATDqRuURfPvRztoZa8WRES8GYPXaMiOU1Prb3Tl
   /Xe3UXZGjAhTYSb0cPucQ7kyVSFiblxrfzDNaCsJOU7y6fkRDxGlOEOVa
   srj3EwhOfX1XlojxbT0PcWVp6YUEugX++whgoqyh/6XkXj6vPZFmwYOP9
   vf3LiZqXnQiFvtLmPjaOfvEUY//GzHPP7QsoI+barIC1jCMVlGQIijh2L
   91Zd86ivj5e3VWFwCEU8Nfja0NAzCPkZZEnOpZAzmIIC1OjQMJpNKu0vd
   Jvg7tyd3FIbnhMu1pNrVoaby3tcRh//BzhK0lTClOIN7I6xUHh1P3pSxP
   Q==;
X-CSE-ConnectionGUID: /VYPa2h5RAKD6+SZdMGPJg==
X-CSE-MsgGUID: rSvJMwIbSpSENj2cE02f5g==
X-IronPort-AV: E=Sophos;i="6.23,170,1770595200"; 
   d="scan'208";a="16952641"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 18:51:12 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:15277]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.9.233:2525] with esmtp (Farcaster)
 id 79311853-5cd8-4807-beb1-7c2687e50223; Thu, 9 Apr 2026 18:51:11 +0000 (UTC)
X-Farcaster-Flow-ID: 79311853-5cd8-4807-beb1-7c2687e50223
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Thu, 9 Apr 2026 18:51:09 +0000
Received: from dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com
 (10.253.109.105) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Thu, 9 Apr 2026
 18:51:07 +0000
Date: Thu, 9 Apr 2026 18:51:04 +0000
From: Evangelos Petrongonas <epetron@amazon.de>
To: Mike Rapoport <rppt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>, Alexander Graf <graf@amazon.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav
	<pratyush@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>
Subject: Re: [PATCH] of: fdt: skip KHO when booting as crash kernel
Message-ID: <20260409185104.GA74321@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
References: <20260407150639.69923-1-epetron@amazon.de>
 <ade2ExpM8ROXV-vy@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ade2ExpM8ROXV-vy@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-ClientProxiedBy: EX19D042UWA003.ant.amazon.com (10.13.139.44) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

On Thu, Apr 09, 2026 at 05:22:11PM +0300 Mike Rapoport wrote:
> Hi Evangelos,
> 
> On Tue, Apr 07, 2026 at 03:06:33PM +0000, Evangelos Petrongonas wrote:
> What about x86? ;-)
>

Well... I was planning to reply with "we will sort it out in a followup".
I have a suspicion though, that you knew that the kho_fill_kimage()
approach would take care of it. Nice! Thanks for the tip.
I will post soon the v2.

> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 43a0944ca462..77018ec99fc8 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -926,6 +926,9 @@ static void __init early_init_dt_check_kho(void)
> >  	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
> >  		return;
> >  
> > +	if (is_kdump_kernel())
> > +		return;
> > +
> 
> This seems redundant if don't add KHO nodes at the first place.
> 
Indeed it is, it was more of a defense in depth in case there were stale
data somehow, but I will drop it in v2.

> >  	if (!of_flat_dt_get_addr_size(node, "linux,kho-fdt",
> >  				      &fdt_start, &fdt_size))
> >  		return;
> > diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> > index c4cf3552c018..b95f0b386684 100644
> > --- a/drivers/of/kexec.c
> > +++ b/drivers/of/kexec.c
> > @@ -271,7 +271,8 @@ static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node
> >  	if (ret && ret != -FDT_ERR_NOTFOUND)
> >  		return ret;
> >  
> > -	if (!image->kho.fdt || !image->kho.scratch)
> > +	if (!image->kho.fdt || !image->kho.scratch ||
> > +	    image->type == KEXEC_TYPE_CRASH)
> >  		return 0;
> >  
> >  	fdt_mem = image->kho.fdt;
> 
> kho_add_chosen() bails out if there's no KHO buffer in kimage, so if
> kho_fill_kimage won't add KHO buffer to kexec_crash_image it should be
> enough.
> 
Indeed, one guard to rule them all. Much more elegant than the
"let's sprinkle checks everywhere (apart from x86))" approach.

> > -- 
> > 2.43.0
> > 
> > 
> > 
> > 
> > Amazon Web Services Development Center Germany GmbH
> > Tamara-Danz-Str. 13
> > 10243 Berlin
> > Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
> > Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
> > Sitz: Berlin
> > Ust-ID: DE 365 538 597
> > 
> 
> -- 
> Sincerely yours,
> Mike.

Kind Regards,
Evangelos



Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

