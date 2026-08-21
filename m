Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3137BE7E
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316857; cv=none; b=Oz7GgS7E5Fzn/mPztLL9+WO1+AlPtKOmPB5w3JwK/mSq07hYpXcXDMtCFrCKHGTfXlGWwrO8KB/8OfWqOyN7PGYEUJTunGo50YPK7zmaFTu9V7klz7TMuyaLd0ZM87eKP3hW8GJZ55AKEjhN9dF1p5o6BnnnxkrJGuzPllik5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316857; c=relaxed/simple;
	bh=iSgWprvtinuDN0k/M/H79aBq/dKGOe5w15sx1TfRr/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nX1Sju1ASX9D9RioM3wrXaX0b+t4KMtUVpABoTO2q3NbvQgKP0hICC1UGS2r0ATT/z0TKa9GGbqb+uYBQ+subuZBtoqirjAi4U3yhxuG8klrH8ljyEd3Xq0k+y2kKQoFO/nleNtj3wAMCEph2ISS5+btMoEZUnao92+HzCuJw4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=am0wk3Ir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="am0wk3Ir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B75D1F000E9;
	Fri, 21 Aug 2026 12:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316856;
	bh=ap3tGLO7+QNcAhdGMxhZRjfCo0fhfoCWKQ++0yl4vMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=am0wk3Irdws9c8ze23fzgJ9wOsdWBJrM5REO5nZmQQHdGi26DRKWTxh6TXivBVuii
	 VqtJy2b2QN78SwEeaZBEcpcl1kMgwVBP5wDMeQCn40QYBE4nIc10LOz3nT6lUdHvcV
	 nT1wcj+7ZDsZbjBI1Ks4Mda6seZLKPToldROiJ5/sB4/XSAQENU20+0eTHeymH4Q3s
	 sVxksRMHjMq6aOeGinx0Il13n4xNAlJQJXf7NkRuVZ7NJV/enTsTVScmuE2ASjndqh
	 y7uYA7wktc4og1qafKdby8zkqp2z8V+lB7UxwoxT+UmPnn3dS+LcWS9QvlxQnnSGfW
	 TMorYm2SRUQcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/18] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Michael Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Pratyush
 Yadav" <pratyush@kernel.org>
In-Reply-To: <20260821114822.4040338-9-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:54:14 +0000
Message-Id: <20260821125415.6B75D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The DDR PHY tuning search loops modify the TX loop variable after =
a successful pattern match but before exiting the loop, resulting in an inc=
orrect TX coordinate being recorded.
- [High] The `execute_tuning` callback modifies controller registers and ex=
ecutes SPI transfers without acquiring the SPI bus lock or maintaining a co=
ntinuous PM runtime reference.
- [Medium] Device tree `reg` property parsing incorrectly assumes a 32-bit =
offset.
--

--- Patch [8]: [PATCH v8 08/18] spi: cadence-quadspi: add PHY tuning suppor=
t ---
commit dcb00c8fe3b55241aea74077e15b54f0457e2f13
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add PHY tuning support

This commit adds an execute_tuning callback for delay-line calibration in
Cadence QSPI controllers to enable high-speed operation. It performs sweeps
of rx_delay and tx_delay pairs to find the optimal operating point. The
feature is currently enabled for am654-based OSPI controllers.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 046fa5d69b0f7..5651320426b14 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1559,10 +1717,1590 @@ static bool cqspi_supports_mem_op(struct spi_me=
m *mem,
>  	return spi_mem_default_supports_op(mem, op);
>  }
> =20
> +static int cqspi_write_pattern_to_cache(struct cqspi_flash_pdata *f_pdat=
a,
> +					struct spi_mem *mem,
> +					const struct spi_mem_op *write_op)
> +{
> +	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	struct spi_mem_op op =3D *write_op;
> +	int ret;
> +
> +	op.max_freq =3D mem->spi->max_speed_hz;
> +	op.data.nbytes =3D sizeof(phy_tuning_pattern);
> +	op.data.buf.out =3D phy_tuning_pattern;
> +
> +	ret =3D ctlr->mem_ops->exec_op(mem, &op);

[Severity: High]
Does this bypass the SPI bus lock? By directly invoking the unlocked
ctlr->mem_ops->exec_op() callback instead of the standard spi_mem_exec_op(),
could concurrent transfers to other chip selects interleave and corrupt the
tuning configuration?

> +	if (ret) {
> +		dev_err(dev, "Failed to write PHY pattern to cache: %d\n", ret);
> +		return ret;
> +	}

[ ... ]

> +static int cqspi_phy_tuning_ddr(struct cqspi_flash_pdata *f_pdata,
> +				struct spi_mem *mem)
> +{

[ ... ]

> +	/* Primary rxlow: Sweep TX window to find valid RX lower bound */
> +
> +	rxlow.tx =3D CQSPI_PHY_TX_LOOKUP_LOW_START;
> +	do {
> +		dev_dbg(dev, "Searching for Golden Primary rxlow on TX =3D %d\n",
> +			rxlow.tx);
> +		rxlow.read_delay =3D CQSPI_PHY_INIT_RD;
> +		ret =3D cqspi_find_rx_low_ddr(f_pdata, mem, &rxlow);
> +		rxlow.tx +=3D CQSPI_PHY_DDR_SEARCH_STEP;

[Severity: High]
Will this modify the TX loop variable even after a successful pattern match?

When cqspi_find_rx_low_ddr() returns 0 (success), the loop condition evalua=
tes
to false and terminates. However, rxlow.tx is unconditionally incremented h=
ere
before exiting.=20

Does this mean the selected TX baseline is shifted by 4 taps from the optim=
al
value, degrading calibration accuracy?

> +	} while (ret && rxlow.tx <=3D CQSPI_PHY_TX_LOOKUP_LOW_END);
> +	if (ret)
> +		goto out;

[ ... ]

> +static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
> +					   struct spi_mem_op *read_op,
> +					   struct spi_mem_op *write_op)
> +{
> +	struct cqspi_st *cqspi =3D
> +		spi_controller_get_devdata(mem->spi->controller);
> +	struct cqspi_flash_pdata *f_pdata;

[ ... ]

> +	if (read_op->cmd.dtr || read_op->addr.dtr || read_op->dummy.dtr ||
> +	    read_op->data.dtr) {
> +		f_pdata->use_dqs =3D true;
> +		cqspi_phy_pre_config(cqspi, f_pdata, false);

[Severity: High]
Are hardware registers modified here without holding a PM runtime reference?

The spi_mem_execute_tuning() helper does not acquire the controller's PM
runtime reference or the SPI bus lock. Calling cqspi_phy_pre_config() perfo=
rms
raw memory-mapped register accesses (like CQSPI_REG_CONFIG) without calling
pm_runtime_resume_and_get() first.=20

Could this cause a synchronous bus fault if the hardware is runtime-suspend=
ed?

> +		ret =3D cqspi_phy_tuning_ddr(f_pdata, mem);
> +	} else {
> +		f_pdata->use_dqs =3D false;
> +		cqspi_phy_pre_config(cqspi, f_pdata, true);
> +		ret =3D cqspi_phy_tuning_sdr(f_pdata, mem);
> +	}

[ ... ]

> @@ -1588,9 +3326,12 @@ static int cqspi_of_get_flash_pdata(struct platfor=
m_device *pdev,
>  		return -ENXIO;
>  	}
> =20
> -	if (of_property_read_u32(np, "spi-max-frequency", &f_pdata->clk_rate)) {
> -		dev_err(&pdev->dev, "couldn't determine spi-max-frequency\n");
> -		return -ENXIO;
> +	part_np =3D of_parse_phandle(np, "spi-phy-pattern-partition", 0);
> +	if (part_np) {
> +		f_pdata->phy_pattern_partition_valid =3D
> +			!of_property_read_u32_index(part_np, "reg", 0,
> +						    &f_pdata->phy_pattern_partition_offset);

[Severity: Medium]
Will this property read fail on platforms where the device tree uses 64-bit
addresses?=20

Using of_property_read_u32_index() for an address just grabs the first 32-b=
it
cell, which will evaluate to 0 if #address-cells =3D <2> is set.=20

Would it be safer to use of_property_read_u64() or standard DT address help=
ers
so the tuning pattern offset is parsed correctly?

> +		of_node_put(part_np);
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D8
