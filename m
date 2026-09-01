Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9D23BED6A
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263565; cv=none; b=If0P+hVOBIx9DGbIP48g9kXUita3Ikp/UczbaU/zeUKSkkFnvF1QIE8cKQXYdUDTtETtjAKBOwRTKPQFH/x2omtwNnFQt9KvZVhFkUqsF9la/VDaDbhLQUoqGhBlPyQkIqLIUD4SbNZXDH2e7xfs750YjJ+npAti2kNNLXK7VaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263565; c=relaxed/simple;
	bh=Tkz8rpJVgJxr/fAngV8KM3kIeheaTVpSnw5OVC3fP/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c+2azsg4gSWJzjr1KXfFdPisbXHd6bGzRnyoSah+Vj9UYQobOkjK90NGnCLEPpi9fkWKsLBmzzAsgzFsVqCKJ04xyukl/o6aZI2q/9F1meuqIQGpoiFewhFiroNq7cYL6avY7FkBbz/Bgs8OdGykPugMnVmzlcv6vjYmj9eyOos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avoeYrWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avoeYrWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E541F000E9;
	Tue,  1 Sep 2026 11:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788263563;
	bh=REoHQB91oLFxxMMmQctDUsa+I1bBQ31czHVyRU20WvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=avoeYrWe8PQrB5YvMrRnqonB7Z0ZPBFsDapC0hfjKV2iW0dJ9I3MpND19EoZkNxLv
	 OVqDfWrMxchgpZpGuu/h6FMgrQOwIAIywDCjm2X2ATYZ/jpsH/g+k/xlDvIzYcOsMh
	 t56HaeVni2Hw2HKaB4gwnlF+mdx+vY/9Q7HI/bB2kTkmF8pu1Q/zgxnKYwFU3rCWGn
	 7CbZy5qmy/WS6ca94mLQI/opLcqCr7V/a6y5oOSCIuGi7VFqlia2Mx3qAGZ3t3aanE
	 +/z+wJ56IeDJmd3ezaTYkIMOcnA4OK7p941kXpjEYiKqbz9sm8I27b+k2G32QBcjmB
	 dppdnSbxyIIPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] i3c: mipi-i3c-hci: Add support for the AST2700 I3C
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-5-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-5-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 11:52:42 +0000
Message-Id: <20260901115243.56E541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Kernel crash due to unchecked vendor register access if the hardwa=
re lacks the ASPEED extended capability.
- [High] Incomplete clearing of previous DAA index across registers leaves =
stale bits set.
- [Low] Contradictory use of optional clock API leads to misleading probe f=
ailures.
--

commit 3d4e54b2ee6f05bbf18ce4fc75b881c1d3330487
Author: Billy Tsai <billy_tsai@aspeedtech.com>

i3c: mipi-i3c-hci: Add support for the AST2700 I3C controller

This commit adds support for the AST2700 I3C controller by caching vendor
data through a MIPI extended capability parser. It implements ASPEED-specif=
ic
initialization hooks, hardware configurations like DAA indexing, and custom
IRQ dispatching.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/maste=
r/mipi-i3c-hci/cmd_v1.c
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
[ ... ]
> @@ -293,6 +294,24 @@ static void hci_cmd_v1_prep_i2c_xfer(struct i3c_hci =
*hci,
>  	}
>  }
> =20
> +/*
> + * The DAA index registers name the DAT slot being assigned during ENTDA=
A;
> + * they live in the vendor capability block discovered at probe time.
> + */
> +static void aspeed_i3c_set_daa_index(struct i3c_hci *hci, unsigned int d=
at_idx)
> +{
> +	void __iomem *inhouse_regs =3D to_aspeed_vendor_data(hci)->inhouse_regs;
> +
> +	if (dat_idx < 32)
> +		writel(BIT(dat_idx), inhouse_regs + ASPEED_I3C_DAA_INDEX0);
> +	else if (dat_idx < 64)
> +		writel(BIT(dat_idx - 32), inhouse_regs + ASPEED_I3C_DAA_INDEX1);
> +	else if (dat_idx < 96)
> +		writel(BIT(dat_idx - 64), inhouse_regs + ASPEED_I3C_DAA_INDEX2);
> +	else
> +		writel(BIT(dat_idx - 96), inhouse_regs + ASPEED_I3C_DAA_INDEX3);

[Severity: High]
Does this leave stale bits set in the other register banks?

Writing to one register bank leaves the other three register banks untouche=
d.
As devices are sequentially assigned to DAT slots during ENTDAA, if the ind=
ex=20
crosses a 32-bit boundary (e.g., from index 31 to 32), the old bit remains =
set
globally.

The hardware might interpret multiple set bits as instructions to assign
multiple DAT slots simultaneously, corrupting the HCI's internal routing.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/=
mipi-i3c-hci/core.c
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
[ ... ]
> @@ -866,6 +944,11 @@ static int i3c_hci_reset_and_init(struct i3c_hci *hc=
i)
>  	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
>  	 */
>  	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> +	if (is_aspeed(hci)) {
> +		aspeed_i3c_write(hci, ASPEED_I3C_INTR_SIGNAL_ENABLE, 0);

[Severity: High]
Can this cause a kernel panic due to a NULL pointer dereference or type
confusion?

The unconditional write relies solely on the DT compatible string through
is_aspeed() without verifying if the hardware capability was actually found=
 and
parsed. If the DT indicates an ASPEED compatible device but the hardware do=
es
not expose the ASPEED MIPI vendor extended capability (e.g. due to a mismat=
ched
DT binding), i3c_hci_probe() allocates vd with a NULL inhouse_regs pointer.

Additionally, if the hardware is NXP, the NXP parser incorrectly overwrites
hci->vendor_data. Later, i3c_hci_reset_and_init() unconditionally executes
ASPEED-specific writes using to_aspeed_vendor_data(hci)->inhouse_regs,
causing a crash.

[ ... ]
> @@ -1189,6 +1289,40 @@ static int i3c_hci_probe(struct platform_device *p=
dev)
>  					     "cannot set DMA mask\n");
>  	}
> =20
> +	if (is_aspeed(hci)) {
> +		struct aspeed_i3c_vendor_data *vd;
> +
> +		vd =3D devm_kzalloc(&pdev->dev, sizeof(*vd), GFP_KERNEL);
[ ... ]
> +		vd->dma_rst =3D devm_reset_control_get_optional_shared(&pdev->dev, "dm=
a");
> +		if (IS_ERR(vd->dma_rst))
> +			return PTR_ERR(vd->dma_rst);
> +		if (vd->dma_rst) {
> +			ret =3D reset_control_deassert(vd->dma_rst);
> +			if (ret)
> +				return ret;
> +			ret =3D devm_add_action_or_reset(&pdev->dev,
> +						       i3c_hci_dma_rst_assert,
> +						       vd->dma_rst);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		vd->clk =3D devm_clk_get_optional(&pdev->dev, NULL);

[Severity: Low]
Is the core clock actually optional?

The clock is retrieved as optional here, which will return NULL if it is not
specified in the device tree (masking the -ENOENT failure). However, in
aspeed_i3c_phy_init(), it appears to be treated as a mandatory resource.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c b/drivers/i3=
c/master/mipi-i3c-hci/vendor_aspeed.c
> --- a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
[ ... ]
> +void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val)
> +{
> +	writel(val, to_aspeed_vendor_data(hci)->inhouse_regs + reg);
> +}

[Severity: High]
Does this result in an invalid memory access or NULL pointer dereference?

If the ASPEED extended capability wasn't present in hardware (or if an NXP
device incorrectly overwrote hci->vendor_data), to_aspeed_vendor_data(hci)
might be NULL or point to invalid memory here, triggering a crash when call=
ed
unconditionally from i3c_hci_reset_and_init().

[ ... ]
> +int aspeed_i3c_phy_init(struct i3c_hci *hci)
> +{
> +	u16 hcnt, lcnt, total_cnt, min_tbit_cnt, cas_lcnt, cas_cnt, cbp_cnt;
> +	u32 sda_tx_hold =3D 0, cas_ns =3D 0, cbp_ns =3D 0, sr_p_low =3D 0;
> +	struct i3c_bus *bus =3D i3c_master_get_bus(&hci->master);
> +	u32 pp_high =3D 0, pp_low =3D 0, od_high =3D 0, od_low =3D 0;
> +	struct device_node *np =3D hci->master.dev.of_node;
> +	u32 sdr_ctrl0_reg, ctrl0, ctrl1, ctrl2;
> +	unsigned long core_rate, period_ns;
> +
> +	core_rate =3D clk_get_rate(to_aspeed_vendor_data(hci)->clk);
> +	if (!core_rate) {
> +		dev_err(&hci->master.dev, "invalid core clock rate\n");
> +		return -EINVAL;
> +	}

[Severity: Low]
Does this contradict the optional clock retrieval in i3c_hci_probe()?

If devm_clk_get_optional() returns NULL during probe, clk_get_rate() will
return 0 here.

The code hard-fails if the rate is 0, completely negating the optional
retrieval pattern. This hides the actual missing resource error, returning
a confusing failure message instead of properly propagating a missing DT
requirement.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-i3c-hci=
-ast2700-v1-0-19909e7cbd7e@aspeedtech.com?part=3D5
