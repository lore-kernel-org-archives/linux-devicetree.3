Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878029;
	b=VC/Wtyae+ysti5yOa17U47AZMVIK/AwyRXfiiP7baReHUAGXNEjbHytcACOcXA8GyYAI
	 urR78eva4P60VzPScM0LNe8r1OFZeFW9gHOoXPVE4S86WUvb3uqV+cu6JiH/46kKNT5n0
	 CAR1zltE77V/p0jA7QmSZQPB60HNWV7WHBOF3Re73oyNeCi2RCk+1xbkZXXA/8jkm8qxX
	 DafFUONaCRFkeFqeVP7mCzhlrh/2gcKOgIhPEVkqEFVuB1AMOhas/O+gjiIRkIrqf5wnm
	 4ZFBLCJxswtwMcmp4tZ3kjwhoGOjacy2a0QEDMtdkamjr49H7BINoPqeUccL5ilKf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iAcrTZYGj9Z0xe0WP+0BvkJC+jqTsdSUr73f5NR4cAg=;
	b=KQUYg6C/SpItdyhDNamYwoA4j1lVNNNoWd5uMtw1O5N6qqxHcZOvZRfZUDBqAEutMYh8
	 gTbzJ7o4TC/94WVVCTORIEZeowH48eRzRA1+UCKNr9ondJTXwH/8yz6I2K5soMIuugqnB
	 NgKmF4GwJeqxTTxCDMmxmH6170OIivgZlSAK4uzzrq5zfPtOOTYRsEmYpe0lq2gO4yOiS
	 mr3R4RvmjCL1w2BK3Z3iBhm2f38LK0bFkD+5LcucNVWOeQ4IDHLKEvCDWXpPutp6Nz3y5
	 nEOSTRTimFgTpRSH5FKY7gKCLl2448jO8r9zERpDB8Uvr0a1YZAABHqlfLMDaPpHtGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=To2f6wKp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD1606A326
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=To2f6wKp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE99F1F000C1;
	Thu,  5 Nov 2026 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878028;
	bh=iAcrTZYGj9Z0xe0WP+0BvkJC+jqTsdSUr73f5NR4cAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=To2f6wKpT0BiQQ9H48SBmk7Lw8kQG9ue2XtHLU1N4jVJAJskr4NC9m/btEgGYiVAs
	 VDWsAuDKPdQjXnrfkQtHvkF04ATLT2dAVWCAGvcKjaQcr9ErN88tGDH5pcaUCVGlBU
	 zXetgVyJsm+dRZBhHM9sVnMN9D4LUyhoSvhK7P++1776rq8Na+SGGiNhhHUM0fi045
	 rBjhIVOfqlzW3VWgeIXm4t5XFt1K0pSPjI5j34bHCpu0FAkoQ173PIpTvrVjxZvP6J
	 88Hdmr5NVZDgVVrQntajl796UJ4dyWC9IbaMFmcAs3sX6fBYRyZ/2TKyPP1eDnYfGW
	 U3vaLlXYX//pw==
Message-ID: <sashiko-outbox-198946@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 11/19] spi: cadence-quadspi: enable PHY for direct
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-12-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:27:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] spi: cadence-quadspi: state leak on disable timeout in cqspi_tune_=
phy_read()
- [High] spi: cadence-quadspi: silent base-clock fallback during PHY tuning=
 in cqspi_read()
- [High] spi: cadence-quadspi: missing READCAPTURE_EDGE bit in cqspi_tune_p=
hy_read()
--

commit feb139507791ba27ec4dfd5612d622bfad619500
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for direct reads

This commit enables PHY mode around direct-mode DMA reads when PHY tuning h=
as
succeeded and the operation requests the post-config clock rate. It also ad=
ds
fallback logic to drop the clock to the base rate when a read cannot use the
tuned PHY.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index c324451a9a285..55c446f4245af 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

[ ... ]

> @@ -1075,6 +1076,105 @@ static int cqspi_resync_dll(struct cqspi_st *cqsp=
i)

[ ... ]

> +static int cqspi_tune_phy_read(struct cqspi_flash_pdata *f_pdata, bool e=
nable)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	u32 reg;
> +	u8 dummy;
> +	int ret;
> +
> +	/* Wait for idle before touching CONFIG/RD_INSTR either direction. */
> +	ret =3D cqspi_wait_idle(cqspi);
> +	if (ret)
> +		return ret;
> +
> +	if (!enable) {
> +		cqspi_phy_restore_read_config(f_pdata);
> +		return 0;
> +	}

[Severity: High]
As reported by Sashiko on v10 [1], when cqspi_direct_read_execute() calls
cqspi_tune_phy_read(f_pdata, false) after cqspi_direct_read_dma() and
cqspi_wait_idle() times out, returning early before the !enable check skips
cqspi_phy_restore_read_config().

Doesn't this leave CQSPI_REG_CONFIG_PHY_EN and CQSPI_REG_CONFIG_PHY_PIPELINE
asserted in CQSPI_REG_CONFIG, CQSPI_REG_READCAPTURE programmed with the PHY
capture settings, and the decremented dummy cycle count in CQSPI_REG_RD_INS=
TR
for subsequent untuned transfers?

> +
> +	ret =3D cqspi_phy_reprogram_dll(f_pdata);
> +	if (ret)
> +		return ret;
> +
> +	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
> +			       f_pdata->phy_setting.read_delay);

[Severity: High]
During PHY calibration, cqspi_phy_apply_setting() sets
BIT(CQSPI_REG_READCAPTURE_EDGE_LSB) in CQSPI_REG_READCAPTURE before each
pattern read:

drivers/spi/spi-cadence-quadspi.c:cqspi_phy_apply_setting() {
	reg =3D readl(cqspi->iobase + CQSPI_REG_READCAPTURE);
	reg |=3D BIT(CQSPI_REG_READCAPTURE_EDGE_LSB);
	writel(reg, cqspi->iobase + CQSPI_REG_READCAPTURE);
	...
}

When calibration finishes, cqspi_phy_post_config() clears that bit to resto=
re
the non-PHY state:

drivers/spi/spi-cadence-quadspi.c:cqspi_phy_post_config() {
	...
	reg =3D readl(reg_base + CQSPI_REG_READCAPTURE);
	reg &=3D ~BIT(CQSPI_REG_READCAPTURE_EDGE_LSB);
	writel(reg, reg_base + CQSPI_REG_READCAPTURE);
	...
}

However, cqspi_tune_phy_read() and cqspi_readdata_capture() never set or
restore BIT(CQSPI_REG_READCAPTURE_EDGE_LSB). Won't all runtime PHY direct
reads execute with CQSPI_REG_READCAPTURE_EDGE_LSB cleared, even though the
PHY delay settings were calibrated with that bit set?

[ ... ]

> @@ -1622,26 +1730,66 @@ static void cqspi_memcpy_fromio(const struct spi_=
mem_op *op, void *to,
>  	memcpy_fromio(to, from, count);
>  }
> =20
> +static int cqspi_direct_read_fallback(struct cqspi_flash_pdata *f_pdata,
> +				      const struct spi_mem_op *op,
> +				      unsigned long max_speed_hz,
> +				      u32 post_config_max_speed_hz)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	loff_t from =3D op->addr.val;
> +	size_t len =3D op->data.nbytes;
> +	u_char *buf =3D op->data.buf.in;
> +	unsigned long configured_sclk =3D cqspi->sclk;
> +	bool reclock =3D op->max_freq =3D=3D post_config_max_speed_hz &&
> +		       configured_sclk !=3D max_speed_hz;
> +	int ret =3D 0;
> +
> +	/* Drop to the safe rate for this untuned transfer; PHY isn't used. */
> +	if (reclock)
> +		cqspi_configure(f_pdata, max_speed_hz);
> +
> +	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
> +	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN)
> +		cqspi_memcpy_fromio(op, buf, cqspi->ahb_base + from, len);
> +	else
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, from, len);
> +
> +	if (reclock)
> +		cqspi_configure(f_pdata, configured_sclk);
> +
> +	return ret;
> +}
> +
>  static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
>  				     const struct spi_mem_op *op,
> +				     unsigned long max_speed_hz,
>  				     u32 post_config_max_speed_hz)
>  {
>  	struct cqspi_st *cqspi =3D f_pdata->cqspi;
>  	loff_t from =3D op->addr.val;
>  	size_t len =3D op->data.nbytes;
>  	u_char *buf =3D op->data.buf.in;
> +	int ret;
> =20
> -	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
> -	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN) {
> -		cqspi_memcpy_fromio(op, buf, cqspi->ahb_base + from, len);
> -		return 0;
> -	}
> +	if (!cqspi_use_tuned_phy(f_pdata, op, post_config_max_speed_hz) ||
> +	    !cqspi->rx_chan || !virt_addr_valid(buf) ||
> +	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN ||
> +	    !IS_ALIGNED(from, 16) || !IS_ALIGNED(from + len, 16))
> +		return cqspi_direct_read_fallback(f_pdata, op, max_speed_hz,
> +						  post_config_max_speed_hz);

[Severity: High]
During PHY calibration via cqspi_am654_ospi_execute_tuning(), pattern
verification reads go through cqspi_phy_check_pattern() -> cqspi_exec_mem_o=
p()
-> cqspi_mem_process() -> cqspi_read() -> cqspi_direct_read_execute().

If DMA is not available (!cqspi->rx_chan), direct mode is disabled
(!cqspi->use_direct_mode), or f_pdata->phy_read_op.addr.val is not 16-byte
aligned or exceeds cqspi->ahb_size, won't every calibration read silently f=
all
back to cqspi_direct_read_fallback() (or the indirect read path in
cqspi_read()) and drop the clock from post_config_max_speed_hz to
max_speed_hz without running cqspi_tune_phy_read()?

That would evaluate the entire PHY delay sweep at the slow base clock rate,
falsely report tuning success, and promote read_op->max_freq and
write_op->max_freq to post_config_max_speed_hz with uncalibrated tap settin=
gs.
Should cqspi_am654_ospi_execute_tuning() verify that direct DMA reads can be
used for the calibration pattern before starting tuning, or should fallback
reads be rejected while cqspi->phy_tuning_active is set?

[1] https://lore.kernel.org/r/20260929063529.1235417-12-s-k6@ti.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105105832.2134=
313-1-s-k6@ti.com?part=3D11
