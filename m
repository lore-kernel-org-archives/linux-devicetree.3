Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC332F7EF5
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679661; cv=none; b=RpH1R71oTPJKXn751nVRQVEmcGiEHEtMiFCCwoRBt6xbb7vHrgQ2tcQi2cfGRUT6NQCTRFJD5gQnRIRCIqDMjaHGE3JFD9iS/873PaHYmtjuasATH8jJGT2vSdyto0n6aUwBEtGPLjLoBSvKkgr9ctXt03S4Bff+hWqjXZoatUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679661; c=relaxed/simple;
	bh=3I/GOK0rdQRXXJHHhQ+VqL2zXB3b+DLvtYxgK/EHUPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bDHTnIV04ao+VVa81X0YpfFOAVa/63DsHrSJVoxWp2cuMwEdW2DqCiTlDxHYx2pn9EQJWS/PLDP72SoEa8ym3QFEy6zvtVQUjcmSK8FPK6MUbmgdxCpTkUBl2o7fljLugyIVXr4ngeHCyf+plsMO30g8GOBt0RRjXh2fSoScY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IHkbGZKF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IHkbGZKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8391F000E9;
	Tue, 25 Aug 2026 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679660;
	bh=BKTdhi3OiU9ggO/Uyw40LP7UgydjkQNwVZR0O8c6z8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IHkbGZKFGaCOEjVIzpMT2XD8xxtnDr1hRj6c14/3ts3W2SKzcP+H/RSAwUS3dt9yo
	 Ee22pXmpc+KG1T2zkqVCSE1fD+IqrlWlpqopj8jOqfQ96fB7lZMI3W7H8WDNVZB6Wl
	 bf8UHtVADfPq9vy7RsSTyjmPaQEVeKzJ0pgWnzTTVbEfqunc5pEEJDYEd20oGW15pI
	 D0PBhq9fneL+G6Xd4aVgRn699INQFIbfOuKjhKO02+YtJ6vY6s4srr4vMPN882RQOe
	 nkSNB1yA6qC56MseTrpYRPee82K1qSN8KPPHqumb44myChHEpyqRLiJaLHe32U8Juj
	 mYcfcT7J4LSLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/18] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, robh@kernel.org, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20260825171737.776052-9-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:40:59 +0000
Message-Id: <20260825174059.7C8391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Manual PHY dummy cycle adjustments are overwritten and clobbered b=
y subsequent read setups.
- [Medium] SDR PHY tuning fails for valid 1-tap wide windows due to an off-=
by-one error in the loop condition.
- [Medium] Incorrect parsing of 64-bit addresses for 'spi-phy-pattern-parti=
tion'.
--

commit 9701c78fc6d77976ffa5b3298e4d3809197ebe5d
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: add PHY tuning support

This commit adds an execute_tuning callback for the Cadence QSPI controller
to perform delay-line calibration. It introduces 2D sweeps for DDR protocols
and 1D sweeps for SDR protocols by reading a known data pattern or writing
to the page cache before calibration.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 046fa5d69b0f7..f7cda1bc71393 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1559,10 +1718,1594 @@ static bool cqspi_supports_mem_op(struct spi_me=
m *mem,
> +static void cqspi_phy_pre_config(struct cqspi_st *cqspi,
> +				 struct cqspi_flash_pdata *f_pdata,
> +				 const bool bypass)
> +{
[ ... ]
> +	reg =3D readl(reg_base + CQSPI_REG_RD_INSTR);
> +	dummy =3D FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +			  reg);
> +	cqspi->phy_saved_dummy =3D dummy;
> +	if (dummy)
> +		dummy--;
> +	reg &=3D ~(CQSPI_REG_RD_INSTR_DUMMY_MASK << CQSPI_REG_RD_INSTR_DUMMY_LS=
B);
> +	reg |=3D FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +			  dummy);
> +	writel(reg, reg_base + CQSPI_REG_RD_INSTR);

[Severity: High]
Does this modification to CQSPI_REG_RD_INSTR get clobbered during tuning?

During the tuning process, cqspi_phy_check_pattern() executes a read via the
SPI core. This eventually calls cqspi_read_setup(), which recalculates the
dummy cycles from the spi_mem_op and unconditionally overwrites
CQSPI_REG_RD_INSTR:

cqspi_read_setup() {
    ...
    dummy_clk =3D cqspi_calc_dummy(op);
    if (dummy_clk)
        reg |=3D (dummy_clk & CQSPI_REG_RD_INSTR_DUMMY_MASK)
               << CQSPI_REG_RD_INSTR_DUMMY_LSB;
    writel(reg, reg_base + CQSPI_REG_RD_INSTR);
    ...
}

Will this overwrite destroy the PHY pipeline adjustment made here before the
tuning read even executes, causing the tuning reads to fail?

> +
> +	cqspi_phy_set_dll_master(cqspi);
> +}
[ ... ]
> +static int cqspi_find_rx_high_sdr(struct cqspi_flash_pdata *f_pdata,
> +				  struct spi_mem *mem, struct phy_setting *phy,
> +				  u8 lowerbound)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	phy->rx =3D CQSPI_PHY_MAX_DELAY;
> +	do {
> +		ret =3D cqspi_phy_apply_setting(f_pdata, phy);
> +		if (!ret) {
> +			ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +			if (!ret)
> +				return 0;
> +		}
> +		phy->rx--;
> +	} while (phy->rx > lowerbound);

[Severity: Medium]
Does this loop condition prematurely fail for 1-tap wide windows?

If the valid SDR window is exactly 1-tap wide, the upper boundary will be
equal to lowerbound. Because the loop condition is strictly greater-than
(phy->rx > lowerbound), it will exit immediately when reaching lowerbound
without returning success for that tap. Should this be >=3D lowerbound so
narrow windows are properly detected?

> +
> +	dev_dbg(dev, "Unable to find RX high\n");
> +	return -ENOENT;
> +}
[ ... ]
> @@ -1588,9 +3331,12 @@ static int cqspi_of_get_flash_pdata(struct platfor=
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
Will this truncate 64-bit partition offsets?

If the SPI device specifies #address-cells =3D <2>, the reg property contai=
ns
a 64-bit address. Reading it with of_property_read_u32_index() fetches only
the upper 32 bits (which is 0 for offsets under 4GB). This could lead to the
pattern being read from the wrong flash offset instead of the dedicated
partition.

> +		of_node_put(part_np);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D8
