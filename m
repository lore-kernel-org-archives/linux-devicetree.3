Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8EB1B4138
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055015; cv=none; b=udk2IjcAQmBfhZHeLGIMq5MYm+mqyNxxLb3KiseW9OQF3dajpgtz6uAspOi/YAGEtypW48bhido+EhT3oVlnh+PNjbOq7FctWSyJVxHNIuXNXGOzYSb4jEBEKfdI8s96/S/sbY6VJpv4oF7q/ZGZBHzWgKOqTgwG99OvrOSTlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055015; c=relaxed/simple;
	bh=UdeR4k+OIEWzRfcj2vsrG7FM4TjcNSgKCI10q+XC2l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QshWqV+MYiI8c99oZNNfEkwLTIPzwW1uhodW7t9Vp9WYs/AXGtHgNU88lDdKrjeA+ra2mTKG9AzWx/90pSOsz0lci5NQafQtqRos4VgILz+mkllDeiStbOptaCs/Hagx+AtQ1FDYRshEP7EuwAz8ZORkffZjcXQhnL7qp3JNTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqcQ3Ugv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqcQ3Ugv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1866430b3a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792055013; x=1792659813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=UqcQ3Ugv8mgmwWMyroq6I9Mdp2gjn9EZprdilYupFEtVyFWfipCv97EOyDulToDYOD
         0xR7uTjDx7tSJ0SxUccMfTZxV4sjZafimseTDiSrCKWYdMtV2zNwdweFFcoFDxeuKXtE
         a0NMtfZ8z+m4i6XKzhAbC+SDz2U3AA5cKBjHSCdKQawWwxzLI/AsoSZwUARTKvaW0Zrp
         E+lPuJLExNxL3scbhUDXo9UNUFydGav1fmQX8pahIaM1OI5Em9Da5nksavev8tgxCVWs
         EAlRQarOha1ih0rAuOJVb8wiq6iNIWFee6SYtPl0L77aOngREoF9XFl5UWs2mOfIZSjD
         mwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055013; x=1792659813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUIkGkj6B9Tv+hZUqi/sJY1ZKDxkj40BHrOHpN+3Sz0=;
        b=f1mZ9iLKTf6cGTGKODE0Hk15QwxxDWnR4XXer//3J9SmAJZxMj75b7IUfZzUONvIpj
         vbZd/Lira/LGdvLZ9wc/mDqUx2EMAsJYrCnn0qV+tfVk393NXUjaJRQ8fLltz6YQdvDc
         CAuPV66dmgMm/iiry8Lpa3eP7h64tZ2irgL0QATnVI6327tJwuifXOZ/vb46rRFAflJa
         +KWw1Mx7KIGRu6SmR1+ccqK6vYR3bvKgM/c1sFfkyzj2b1cQSmUYP1Bw2abJoFElQdEZ
         tjDiQVxPdzT49m9P5+/Q4Fla0Z/BM5R+GP5agc8/pylY81iFe67vkIgr28LcTgjBQZRr
         p9bA==
X-Gm-Message-State: AFq9FYKBWwsl+o+QRHZ/LLJNaVVLI75uRAHVoPIq6qlhODZRIVTBNm2L
	gKU00KRgxyVVOP1aJUHdqjyxOjF677nCEpdYooRwuPmUeD4ItZua4J8+
X-Gm-Gg: AYBFou32FEdO8KPXO65f8atCF2uR4INHOGjX7cwrarFCl+4yyEAFTaxjdKalOJ9H+kZ
	OvRTzY7aUuW3vR9i5YwEhW1LdPW7AT51AYoaUH9Dyidewa54fiRl6G6X4r6z/mwSevMr3ERbD+K
	8cWDmTl0dvIALD0hTrOckpo5qXdFcyD09tCpMRI8jz35KBuLncaPcEfknWnbUCbBm4avn5AHqdY
	wBknTXuHbDb+wWHVPz9xTPBA03GDQdn2k6B1zfV1qxI/GVeKUgP386K/3IHtz+nvfJ17hqS/zB8
	K0x74oCxcCleoSeXIrlIXc1FeGtUFPyjH2yVC+01m9HeV+87CFDnXymgQi3CkJVD30wLYVwsDnE
	FelAU9db6WpybeSD7KmHPHaYR6LDGRXCwWaByIhDLEAbMfzkJveQjBIkAacoX1etJIWpQsFH5h1
	anw2len+NH/kPS2wbl9N1TOkXAfr0vGD7RLk8eczdeQbhwHBUlMI5P6xS/mic1wUCZfPkH
X-Received: by 2002:a05:6a21:3944:b0:3dd:a196:3091 with SMTP id adf61e73a8af0-3e16bef498emr14329973637.65.1792055013262;
        Thu, 15 Oct 2026 02:03:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635cd3b34sm962553a12.28.2026.10.15.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:03:32 -0700 (PDT)
Date: Thu, 15 Oct 2026 17:03:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCV8NsJc5Oatoo0@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>

On Thu, Oct 15, 2026 at 02:43:40PM +0800, Chen Wang wrote:
> Hello,
> 
> On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> > Sophgo SoCs such as SG2044 contain eFuses used to store
> > factory-programmed data.
> > 
> > As for SG2044, HW automatically loads the eFuse content
> > into shadow registers which are organized as 32bit values
> > exposed as MMIO.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >   drivers/nvmem/Kconfig        |  12 +++
> >   drivers/nvmem/Makefile       |   2 +
> >   drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
> >   3 files changed, 190 insertions(+)
> >   create mode 100644 drivers/nvmem/sophgo-efuse.c
> > 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index c36c2a4c2a0b..a7936dd65bdd 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called nvmem-snvs-lpgpr.
> > +config NVMEM_SOPHGO_EFUSE
> > +	tristate "Sophgo eFuse support"
> > +	depends on ARCH_SOPHGO || COMPILE_TEST
> > +	default ARCH_SOPHGO
> > +	help
> > +	  Say y here to enable support for reading eFuses on Sophgo SoCs
> > +	  such as the CV1800B. These are e.g. used to store factory programmed
> 
> Why is "CV1800B"?
> 

This is an old mistake, this patch follows Jishengs's patch in the first
design. But then almost everything changed and only thing for SG2044 left.
This is the thing that is left to change.

I am not sure whether it should keep this generic name as I see it should
be compatible for most sophgo SoCs (at least it should be for CV1800X, 
by just change offset). Feel free to give if you have some suggestion for
a better name

Regards,
Inochi
