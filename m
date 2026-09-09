Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BC44C64E
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940899; cv=none; b=VvbMcsgPvzM9dhRnQ0LUv/4VyjYWJ4WU+1oc7raAMk6WtY5/epAvWZmvU1f0KpSVoe7exloz7IR+njCrM+EEtiAi+bBXIYsheZNl6THTxCrBvvnyKaxDbZOTQq+jFbui5DGr9kaU7Qh9eMOiD3oQ9uvnEseH/B4imkFZohf2cYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940899; c=relaxed/simple;
	bh=BwkTq+kWcanD6pJH1odrel9/Fm5+LJ3h9fF3o0OWkg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdKSuNzFpwNZhhgoAjFd5C+xziyBrfVVNOIvynx/WuBC49d8N2MzAhci7AMvX4hvD+6a1MtrJjAHdb1F60KQ3AqcxjfUl4aAk7ityIB8i9DHaoP1l/YwztFH9xkS9uyPmnBeGH6TQWpHYxIpz1uU8jIU+Y3dDid0bPY+TUjEW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMzoZhbX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMzoZhbX"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso5212179a91.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940898; x=1789545698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f8CIem4P/Or0F4qZW5iNmZjHo/TZnFkGYTym/tguf0U=;
        b=SMzoZhbXIj1aAu0PFPJCbyp4M62Yk1egqty6uxR5no94af+5xzBFYvA1qUtHS+Zkje
         AUtacs4pbkh+lOepQs7tpskXGkPRQIMNIZ6bJ1cZxoS3+wRnQqnkrYLcCeQ483ZdOke2
         VVp5JoDL7ap1VLDSp+zGKIb2529QrGUvqi5WTCVC4K08CBWZFEOI6cs2DOXEEla435Zg
         vuxfCgUBisb8p1ga2sMdGAa0NpioLT1IHFN6kuW7+Shaq+8Bmgy1/HjF7XvfR9XEay6W
         21Ki7S0FqrqbV5osdk/iRGDQDOEX5dxDhHPYGQ7XX6UhruOyYLlkeZqnYHvEYpOZ1vmf
         ZUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940898; x=1789545698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8CIem4P/Or0F4qZW5iNmZjHo/TZnFkGYTym/tguf0U=;
        b=Wm0XnztITHdwW+oLGd9wY9M2yN1LUPz3+lpc1LXcv7+xiskWoDHjqJA6fRzIxTGmn0
         I73vzz9oVo4832j/qTMfxkK0jYthQjVCRmQsKak32Ao0yIQfdO7iHV16cc1Va+5O5y9A
         iC/P6FOgbDsqNOR5PL3oNfhWA96qwq4hS1/qcd065QxL+gU5gFIF7kXChJZrfg/QNHTk
         v+ghfis5MPEEAtA/D9xwN/YGv2l9/KDxk3WrZ6cnEDEu2ln5l3E0IFALaAjdhl2VSW+c
         ntSUBmyln6/yJu7iBSrOmUvsoGtWcBti2CCuNQOlnMFzBqSSR2W3Ib6sjCoK/FS3XB4C
         2Ypw==
X-Forwarded-Encrypted: i=1; AKwUvBwG0MEtPU2b55wmwxj0yeFePfcMUSRo+JNrDez8QyvbQ9DKJyEHaMbHDMi3NJUVfvcL3Hz/j1duAQ7A@vger.kernel.org
X-Gm-Message-State: AFuF++lx8jHSKZrOGYlL251PRccWZflC8YLSKLA+4PynpF3ZC/HeHBVU
	8gPIIyx1xZBmTmbr41Lw/S1Ia97W2YUseK3UfpSBmxxvIlGdcgoMOL8d
X-Gm-Gg: AYBFou2pczzG8vEMuaTz5UptpfX1JdhXPFN34jsm+l3umXYMH8AWuo23RCJ4C92IeRO
	cr39nzCMpoABOnezfzzYVLUeMlgMerrIWLWjwWs6gK6bwJmroTKOmPi8aBTDSAibFmjJzs/60HH
	jmJcswlv/vp5Xw2K+r7AIwIZ9p5k0SofyYYUFk0cSLFpcKGhiDZDg9jcRM1QCOP4YcDLAISNlbn
	+TzXVON1AZEu43mhYwjI7WCOrolOvXYq0JUtSmlujRfd9gXlGacWhlRyUnYc/jh8TMebBEJbD1I
	sZYfksnE0BS3W5CFwuh535e/lsfljDAEwUNq4CK/d7YiO1GMPooHhx4OchTa2+n5rcsG6pitj7A
	z3TncoQu0D0RBvcJ9mHZxKjsrqMQECHp1I2LjFKIXbRQE+pWw2DYC0d3dflxzHVRri0dkMOH/t1
	y998cxT0Pq+554SY6HbP8YuFnzppA8oUgCLK7xuKdz/sFJrRqm1fIjOVSlNODZP05P4sZfCA==
X-Received: by 2002:a17:90b:4b90:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39b2610f2fbmr47242447a91.8.1788940897733;
        Wed, 09 Sep 2026 01:01:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm38584020a91.16.2026.09.09.01.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:01:37 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:01:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <aqESLh8EO77U2nWQ@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-6-inochiama@gmail.com>
 <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL93W9G65JL4.SW643T11BP8O@linux.spacemit.com>

On Mon, Sep 07, 2026 at 09:08:28PM +0800, Troy Mitchell wrote:
> On Mon, Sep 7, 2026 at 07:26:04PM +0800, Inochi Amaoto wrote:
> > @@ -14,26 +14,29 @@ description: >
> >    PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
> >    controller, and supports 256 MSIs.
> >  
> > -allOf:
> > -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> > -
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pcie
> > +    enum:
> > +      - spacemit,k1-pcie
> > +      - spacemit,k3-pcie
> >  
> 
> Please update the title and description to cover K3 as well. They still describe
> only K1.
> 
>                                             - Troy

Right, I forgot this. Thanks for the reminder.

Regards,
Inochi
