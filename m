Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57FB3E5A0E
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178745; cv=none; b=SXZlcgNcSSjNbqRULpraebRNMnmr3HaZi4176KhKDTRgs9PVCTNRtUywu5JIxbPZW2NSEuQAdqVHZ516nm6mlWBNfoS7NhSXjT64pZoZGLPFM4mH9O+aov7S8Sck5fThQ2tbGV81ivV1xR1+K7RdWQjGyjm7nQow0w8kV+3rLds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178745; c=relaxed/simple;
	bh=LokY7ZV5PcRkI+aeUAzFv5UxuFJO74rA/6mazHkhdcc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJBFSphxU56eZXU/9kvKEPApocVE3wcK1ogBuW8jyM3+um+OvPtWKZCJpWdvKsQV4CUzscY2kE4uHmqEpK662b3B/WoAdPIABoaeAyrhgN6Zng8xh5P6NGDk4GSIrebdI3Mgv1E678+Kx3oYCSmhKx3aIfdxxp67wwK9y0yBvVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEpJ0VWw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEpJ0VWw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so16431515e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 15:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178740; x=1787783540; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzNQMJ+ws1+nniHlWi5ZWmVgaLJuM4kR6WvKxeZk5HU=;
        b=eEpJ0VWwWijJ76qCx/WqTPZL5AA9t813qAlg8/v6jxmgrVkniX3IRJhYs8oGh3ImYu
         4GjwWadLv1QJP1Nta7hklNnZfv3Xyr93xcnCn3Kaov/pquHLD4ZyMlPwZ3td7w+7i5mx
         FYHQg1iH8d2a96BQROJbLzypX83sL46hDHfnngR4yqNybGzjIO+Ojo1JVh7gNE0iTlEl
         xC4N7iHPRIx3jXQSqouqxFv/13EY+buTH4JuiWURFRPycvXtYLPwRqBcJ4WWuNe2cZV0
         RRcglR3uq0vtyA4jyOLoa2HoVidds1gWG3gQVyZk2ypY6/zpDZ6q6l+qvrB8ta5i7SgP
         BWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178740; x=1787783540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WzNQMJ+ws1+nniHlWi5ZWmVgaLJuM4kR6WvKxeZk5HU=;
        b=Yr8kbdyyxF0QuCy6eeO8rr2IHXDVHvqkxOcIuzdA50CCi84Lp0G8nwU/cCELFAkBMW
         SbmloFDbmqYQdKZge5kvHk+BrDVHfO9aUS0h2F6fKFjMETj26eOMkFkgyOStmzbWMn21
         7NCjqvnxbLwkZTipNUGMxeJ4tnLymuWaas8PmZASwvs5NM8YzDv9cgN5LoqByM2EBeP6
         bMlocXGGhJG/eV9aDXm7jxWqQMaikLRxa1oX2T3TTYRLE2ct+FZ1t55HxhM4Dx/uLXpl
         nUAs02Agl5I5Xc7Ov48fAy8ytUIqiPj6c5Z1kSux16+8YNCZR4YQGACBkUlxM+KTKehy
         rbqA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj2DKrDm6Srxas1c7BiJGEtQykwD0AN3wGGrIJ1J2lGT22EdiyYZckgf2Auux7mBG9s/W20E4FYOQy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nWHMQTiS0FnWdgYbHa/GlL6vFIeFa7T3rc0BWfyHv8La8UA5
	Ak41f+VHlQJJiETSAq8QNTOOPipCJbwlHH+2gcEck20KpSYDohLIHZ4jtPRJ19e3
X-Gm-Gg: AR+sD12BCpzPSM6+ZMiDdjdBnud/36EiziCq1rbmED3tL0Hmuo3IwEeCXjdUvvQOcYX
	/tElxItuOUbGKiYq4JzwuDyB2nQLfKlYHzOcTnJYBkD9gUwpsumjp+gYUyN0uh1JK5vJkjDNvVf
	v6K0aHK3j8fYq2CcfAVDTCbcv2rYNw7sZdq1SSqZ27151fUrk8yS2lZ0l8X6FcFNn+p+TdbQzye
	RWhEmnLFP6YguEvdEva50wtDtavH2c4ls0zI55FsKlsxzeDblbwiIDGutmG07sW23gkN/35BzvM
	14arcl/qP94nfiMLpFDlnotNBNil5JvUkHVwQ2uAa3R57b+nxh6NVQo40hruh0Y4Kw1TzxbYTkH
	09cbeThTpJxwONZzMsF186PxW+rGhioc3nxYhCENfIRfynIJM5RTJlRtTmLXtPIIjFZsb3EOTPv
	pgeos60fKrp2SvYQqMoEE8iBJ5wRJp8MwPsJM//ZqgogdfQWme7d5pSd9qijZRgvQG1DtdezrPf
	JuadP1ZHrMOXeQolXlPh0S33JriUmU+otB8ig==
X-Received: by 2002:a05:600c:4f87:b0:499:7219:122f with SMTP id 5b1f17b1804b1-499aa199590mr123654125e9.4.1787178740502;
        Wed, 19 Aug 2026 15:32:20 -0700 (PDT)
Received: from Ansuel-XPS. (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b144173csm8416265f8f.6.2026.08.19.15.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:32:20 -0700 (PDT)
Message-ID: <6a862ef4.35b91a9e.11438f.69a9@mx.google.com>
X-Google-Original-Message-ID: <aoYu8QrMTxiI6pct@Ansuel-XPS.>
Date: Thu, 20 Aug 2026 00:32:17 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 clock
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-4-ansuelsmth@gmail.com>
 <20260819222743.5044F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819222743.5044F1F000E9@smtp.kernel.org>

On Wed, Aug 19, 2026 at 10:27:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [Critical] The macro `REG_PCIE_HB_RST` is used but never defined, causing a build failure.
> - [High] Requesting PCIC resets on AN7583 causes an out-of-bounds read on the `en7581_rst_ofs` array, leading to undefined hardware behavior or memory corruption.
>

For reference, it seems the bot applied the patch to the wrong branch.
The reported problems from the bot are not valid as those changes were
introduced by the last 2 patch present in linux-next and clk-next.

Code was compiled and tested with those 2 changes included.
 
> Pre-existing issues:
> - [High] Probe error paths cause a use-after-free by mixing `devm_kzalloc` with non-devres `clk_hw_register()` for the PCIe clock.
> - [High] Read-modify-write operations on shared registers in the reset and clock controllers lack spinlocks, causing data races and lost writes.
> - [High] The clock `.disable` callback calls `usleep_range()`, which sleeps while holding an IRQ-disabled spinlock.
> --
> 
> --- Patch [3]: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 clock ---
> commit e4983d60cb386b35f51bc20a5f0912039bf92780
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> clk: en7523: add support for Airoha AN7583 clock
> 
> Add support for Airoha AN7583 clock and reset.
> 
> Airoha AN7583 SoC have the same register address of EN7581 but implement
> different bits and additional base clocks. Also reset are different with
> the introduction of 2 dedicated MDIO line and drop of some reset lines.
> 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 087ff4568124f..493812c683f53 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -505,6 +646,64 @@ static const u16 en751221_rst_map[] = {
> >  	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
> >  };
> >  
> > +static const u16 an7583_rst_map[] = {
> > +	/* RST_CTRL2 */
> > +	[AN7583_XPON_PHY_RST]		= 0,
> > +	[AN7583_GPON_OLT_RST]		= 1,
> [ ... ]
> > +	/* RST_PCIC */
> > +	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
> > +	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
> > +};
> 
> [Severity: High]
> Does this out-of-bounds array access corrupt memory when requesting PCIC resets?
> 
> The an7583_rst_map defines these PCIC resets in bank index 2. 
> 
> When en7581_reset_register() is called later in this patch, it is passed
> the en7581_rst_ofs array:
> 
> 	static const u16 en7581_rst_ofs[] = {
> 		REG_RST_CTRL2,
> 		REG_RST_CTRL1,
> 	};
> 
> Since en7581_rst_ofs only has 2 elements, when en7523_reset_update()
> dynamically calculates the bank index via id / RST_NR_PER_BANK, it evaluates
> to 2. Accessing bank_ofs[2] will read out of bounds.
> 
> [ ... ]
> > +static int an7583_clk_hw_init(struct platform_device *pdev,
> > +			      struct clk_hw_onecell_data *clk_data)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct regmap *map;
> > +	void __iomem *base;
> > +	u32 val;
> > +
> > +	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	en7581_register_clocks(dev, clk_data, map, base);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the probe error path leave
> us with a use-after-free for the PCIe clock?
> 
> In en7523_register_pcie_clk() which is called by en7581_register_clocks(),
> the clk_hw structure is allocated via devm_kzalloc(), but registered with the
> non-devres clk_hw_register():
> 
> 	cg = devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
> 	...
> 	if (clk_hw_register(dev, &cg->hw))
> 
> If a subsequent initialization step fails in en7523_clk_probe() (like hw_init 
> returning an error), the driver core automatically frees the memory via devres,
> but the clock framework retains dangling pointers to the freed clk_hw.
> 
> > +
> > +	val = readl(base + REG_RST_CTRL1);
> > +	val |= REG_PCIE_HB_RST;
> 
> [Severity: Critical]
> Will this break the build due to an undefined macro?
> 
> The REG_PCIE_HB_RST macro is not defined anywhere. The existing code seems
> to use REG_RESET_CONTROL_PCIEHB for this bit instead.
> 
> [Severity: High]
> This is a pre-existing issue, but could this unlocked read-modify-write race
> with the reset framework?
> 
> en7523_pci_prepare() modifies REG_RESET_CONTROL1 (0x834) without any locks:
> 
> 	val = readl(np_base + REG_RESET_CONTROL1);
> 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> 	       REG_RESET_CONTROL_PCIEHB;
> 	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
> 
> Concurrently, en7523_reset_update() performs an unlocked read-modify-write
> on the same register (REG_RST_CTRL1 is also 0x834):
> 
> 	val = readl(addr);
> 	if (assert)
> 		val |= BIT(id % RST_NR_PER_BANK);
> 	...
> 	writel(val, addr);
> 
> Since .prepare() runs in process context and resets can be triggered by
> other probing devices concurrently, this seems likely to cause lost writes.
> 
> > +	writel(val, base + REG_RST_CTRL1);
> > +	val &= ~REG_PCIE_HB_RST;
> > +	writel(val, base + REG_RST_CTRL1);
> > +
> > +	return en7581_reset_register(dev, base, an7583_rst_map,
> > +				     ARRAY_SIZE(an7583_rst_map),
> > +				     en7581_rst_ofs);
> > +}
> [ ... ]
> > +static const struct en_clk_soc_data an7583_data = {
> > +	.base_clks = an7583_base_clks,
> > +	/* We increment num_clocks by 1 to account for additional PCIe clock */
> > +	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
> > +	.pcie_ops = {
> > +		.is_enabled = en7581_pci_is_enabled,
> > +		.enable = en7581_pci_enable,
> > +		.disable = en7581_pci_disable,
> > +	},
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does mapping en7581_pci_disable
> to the .disable callback result in sleeping while in an atomic context?
> 
> The core clock framework invokes .disable callbacks with the enable_lock
> spinlock held and hardware interrupts disabled.
> 
> However, en7581_pci_disable() explicitly yields and sleeps:
> 
> 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
> 	usleep_range(1000, 2000);
> 
> Could this cause a scheduling while atomic panic when the PCIe clock is
> disabled?
> 
> > +	.hw_init = an7583_clk_hw_init,
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260819221458.30040-1-ansuelsmth@gmail.com?part=3

-- 
	Ansuel
