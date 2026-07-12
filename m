Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1336FCA6F
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783835160; cv=none; b=nz2rygikhU6TYd0H4D0u6jad1sKhuh7J3jliK7d6sAXUyzPgQYCmja/LlYpsiKIv18HDLy/3hdgmFh8tmOD5hvzgHe8NngpFvDUp2Wk0tAsSfTPPXIXz3mmwJqXyBGKb4/kPfvG13L3u9qeK9uIsnzYwuy/0eV/NG2BRUN7WKns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783835160; c=relaxed/simple;
	bh=NO1wVHhYcEvuN+Lhqd6k/I8yI3Bz4oGZnZ8lkUJdfvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e62kEHGWd8N3tV56hkgm3X0BqJarVJzs97/P6bEYsp9WtwKe82dZnoPfOpn0y2EUbfxG1NwlJ+mwA87JTMngIfvK21Bd5owZ8KbaIgoJCZie50JzVHJ58vzA60SPcaH9Ibio8HO6pxJH2WbmuTtfGlxaATi3MQgbehTGtE/WKZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahpOpNT/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahpOpNT/"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2070747a91.3
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783835158; x=1784439958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p5T9DanspdTbxdaM1wq6G9SRiLHrncHsKrVHDW8gIgM=;
        b=ahpOpNT/tJWp/tfFo6LgMqjV2IdUYTjcLs2+MitXrE33ESi+AHJeO6pqtb9QnzX8gd
         b8X9OJyAW0M7LHEqxgsr3bLDJG0ApxB0Nb7NSVZ+1tf8JD0zbMOz8OJVseC0hT5+X2q9
         kPtsMoHU0nzLKrxMJa6XIGlTkEtnta/8xgoP7qnajr3AU1Ix8Ar6oso+w4SXnA/pDkif
         ZTxtIh7z0ALV1lVgr16RNwrgNoBJbiS6xMjq8yQaLiBe9QNgqeB7PIfrF/8aXWyQ6hxx
         jHTz93UGuuYoWgBZuhVcDSx0fBwlcLvPbgYRnBdKFVy3icjSmBd4dleThzV9SEefw65S
         mTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835158; x=1784439958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5T9DanspdTbxdaM1wq6G9SRiLHrncHsKrVHDW8gIgM=;
        b=CHWtlR/w0ygo3hGC4j4SJl0amFZgMXkGf7BkQjihZ0krN7kH0qXuy1J2KOIvDKSQoV
         6reWsGSpkvU2+I+JRVmINXBt/hpYdkUXVNkdpuYXpW85MoF9bXpXB6uRbJp7r8cALU/N
         Ib61BhVmkIYKNbPahXrR1BBd+7ot8/AnHcVKU4rES6Ui6WfBcUgcCcy1ZIaHWUK10bWH
         55BXJZJp4IYSFcRh2QBIZ0ueUtvBsHtXLr6AUnPhOaW7rpZChhhKInRSL5+0mvnxxjKw
         qHpMcf1bctFYR68Xw5CdXf+f1X7jDbTz6rVMpx50b/+HryW4wGAc1MXz/3ofV9/gseEA
         9pgg==
X-Forwarded-Encrypted: i=1; AHgh+RouyWKA0eZqiOqKNAlUcSNJVi2EHuGzLAQBT3o9A233K4lEf2YyWqKzDNgFl8/qAnEY1usfpoL5su+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzxkw+GG5eLfO7WP9eJdt9AcsA1RF0QyWS0ABTdWjg9mX7d07f
	FCvNMZORLMM/kQ26fs/pU9aJsK+2E50X6opegULm5rlIQNn77cQJ6l/Q
X-Gm-Gg: AfdE7clkxBjq2IvJz5s4MrZO6mBryRkHEMfTgHkYyKewESh1LLnjuHnFfG3LNvvudz0
	ER6aMRAK6WNoToeUgunrQ6XHqhFiAp2mIDWUNPt6p8djBHt8zQNIb8/1IpfUAYQYp6Kux1F0Etg
	nf7OsR6/yWt6nj7dtCRCobcwjZBMduinbWZ1pDzx4V7sr32bHpd6vilw5rvMRul4oY4R9Cx7Odp
	9K3aA4aUkNl2O06wWbmz8SZB3q1aB/M7kfkWllH2G+4eVt7dpBWpnD33tMnZOnx6lV39u3SQ05t
	ssrJYEyU55N2v9AD0VkxidMJxlPNWtejQEopCIpXiDkZEyQWyIvl5GlNLW9Bet1Fattdpd5TGxH
	Iz7QPZkfeGDgPtdmWTQE/yQSqREWMRoMB9fdtDpAql+eN1nlIBjCph7h4HLFiJJME
X-Received: by 2002:a17:90b:4a43:b0:37f:9ce1:cda4 with SMTP id 98e67ed59e1d1-38dc773bf14mr5210607a91.26.1783835158527;
        Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm1866372a91.0.2026.07.11.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:45:58 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:45:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host
 controller support
Message-ID: <alMpuGY3z1DTmqez@inochi.infowork>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-7-inochiama@gmail.com>
 <ak9L7k-_aivk1_Uu@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9L7k-_aivk1_Uu@ashevche-desk.local>

On Thu, Jul 09, 2026 at 10:21:18AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 09, 2026 at 12:00:26PM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 is almost a standard Synopsys
> > DesignWare PCIe IP with extra link and reset control. Unlike
> > the PCIe controller on K1, this controller supports external MSI
> > interrupt controller and can use multiple PHYs at the same time.
> > 
> > Add driver to support PCIe controller on Spacemit K3 PCIe.
> 
> ...
> 
> > +	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
> > +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
> > +			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
> > +	usleep_range(1000, 2000);
> 
> fsleep(1 * USEC_PER_MSEC)
> 
> > +	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
> > +
> > +	msleep(PCIE_T_PVPERL_MS);
> 
> If PCIE_T_PVPERL_MS is too small, msleep() maybe not a good choice,
> perhaps
> 
> fsleep(PCIE_T_PVPERL_MS * USEC_PER_MSEC)
> 
> ...
> 
> > +	val = u32_replace_bits(val, BIT(7),
> > +			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> 
> It's perfectly a single line.
> 
> ...
> 
> >  static const struct of_device_id k1_pcie_of_match_table[] = {
> >  	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
> > +	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
> 
> Missed space.
> 
> >  	{ }
> >  };
> 
> I don't see (and haven't checked) the context, do you have
> MODULE_DEVICE_TABLE() for this?
> 

IIRC there is already a patch for adding this, so I won't add
MODULE_DEVICE_TABLE there.

I will take other advice, thanks.

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Regards,
Inochi
