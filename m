Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41688423A9B
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611247; cv=none; b=i8VxS5IkmGr45ayCncieZxkYhBa6YZC4TlQiLF8yju3BGbJG80dOHpBtf99EklsugORLetDVR2nyWDyhwvt4XrF1PBm9TNpLxY99InUuzDE/FDsTttKqjqkrtdSRa+OGmXEFNrUzpyajRinUjS/dDvEZ17Oe2x7T40Sy8VTF8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611247; c=relaxed/simple;
	bh=ryyl2iKtL6HFTC0S+jEpX03rSEcnWIok3Z7PGoKEgE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hIcrfN89IyEUXz8+xGegsFrUzCkucTt1sLEIrtpJ7ps1ztawOrhZH++oSKwu8DNA2FHT4jnMoHUb56Si/VNGn/fgMP9Y4kZgEHwDHyi/XlV1haBmUIv20XPTmdgtbAhuCm0Np++OqZkfnUnkipJhwdN1X3T/NpUFej5H5WK4mFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZBONsVE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZBONsVE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810201F000E9;
	Thu,  9 Jul 2026 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783611244;
	bh=5Pdj+OtRC+EAypsUgpvfmbDR/t+Ngf7+jqRKW8NqAZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kZBONsVEcr/HspeuuytJUQ3Bg+S0oF8GRgTXziKtVzvj9euuiQWuhgjbaqZELHj6x
	 /sAHw6H0azUE3Wmr3Yimm7CYFngMaXmlBtatbqPWY8nlWgOrxDAjYy9u2Mg4CfEUW6
	 LSetq2qcQLERY1qbVRGzQ2BEOreSNzQJwWELoHb75F/MxyLVepSaKnMbB+GBxXVXlq
	 UniIhA0OnkuhDWBKSkpwTzAgsqoMNcU4HcD+YBSzIivydbcvj4W+BM/Jhn7LdsZyUo
	 ScrLISF67Ax5bNiZQSP4mwjLQGqSJCRkQn2ALrQ5Ms2EEtCAXE3AY1cVCgJ7stxZdF
	 zD+y7OPq1kw0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 11/11] spi: dw: Add support for StarFive JHB100 SoC
 SFC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709055204.138168-12-changhuang.liang@starfivetech.com>
References: <20260709055204.138168-1-changhuang.liang@starfivetech.com>
 <20260709055204.138168-12-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 15:34:04 +0000
Message-Id: <20260709153404.810201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The JHB100 quirk does not properly validate or handle address leng=
ths other than 3 or 4 bytes, leading to syscon state desynchronization and =
silent address truncation.
- [High] The JHB100 filter interrupt mask register is masked during initial=
ization but is not restored on system resume.
--

--- Patch [11]: [PATCH v1 11/11] spi: dw: Add support for StarFive JHB100 S=
oC SFC ---
commit 3a943425e81f5dc20e515a24b6937c56ee3c08e8
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

spi: dw: Add support for StarFive JHB100 SoC SFC

Add support for the StarFive JHB100 SoC SPI Flash Controller (SFC). It
introduces customizations over the Synopsys DW SSI v2.00a, including
separate instruction/address registers, a filter interrupt mask register,
and requires a syscon phandle for address mode switching.

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index ef1abb540f069..c4e53c7456b26 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
[ ... ]
> -static void dw_spi_enh_write_cmd_addr(struct dw_spi *dws, const struct s=
pi_mem_op *op)
> +static void dw_spi_enh_write_cmd_addr(struct dw_spi *dws, const struct s=
pi_mem_op *op,
> +				      struct spi_mem *mem)
>  {
> -	/* Send cmd as 32 bit value */
> -	dw_write_io_reg(dws, DW_SPI_DR, op->cmd.opcode);
> -	if (op->addr.nbytes) {
> -		dw_write_io_reg(dws, DW_SPI_DR, lower_32_bits(op->addr.val));
> -		if (op->addr.nbytes > 4) {
> -			/* address more than 32bit */
> -			dw_write_io_reg(dws, DW_SPI_DR, upper_32_bits(op->addr.val));
> +	if (dws->quirk_flags & DW_SPI_QUIRK_JHB100) {
> +		dw_write_io_reg(dws, DW_SPI_JHB100_INST, op->cmd.opcode);
> +		if (op->addr.nbytes)
> +			dw_write_io_reg(dws, DW_SPI_JHB100_ADDR, op->addr.val);

[Severity: High]
If op->addr.nbytes is greater than 4, does this 32-bit register write via
dw_write_io_reg() silently truncate the 64-bit op->addr.val address value?

The SPI core can issue mem_op structures with address lengths up to 7 bytes=
=20
(which dw_spi_supports_enh_mem_op allows). Could standard SPI flash
operations utilizing these non-standard address lengths experience data
corruption or communication failure due to this silent dropping of upper bi=
ts?

[ ... ]
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 603e81a92c57a..236ac5fa9cd06 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
[ ... ]
> +static void dw_spi_jhb100_set_addr_nbyte(struct spi_device *spi, u8 nbyt=
e)
> +{
> +	struct dw_spi *dws =3D spi_controller_get_devdata(spi->controller);
> +	struct dw_spi_mmio *dwsmmio =3D container_of(dws, struct dw_spi_mmio, d=
ws);
> +	struct regmap *syscon =3D dwsmmio->priv;
> +
> +	if (nbyte =3D=3D 3) {
> +		regmap_update_bits(syscon, JHB100_ADDRMODE_CS,
> +				   BIT(spi_get_chipselect(spi, 0)),
> +				   0);
> +	} else if (nbyte =3D=3D 4) {
> +		regmap_update_bits(syscon, JHB100_ADDRMODE_CS,
> +				   BIT(spi_get_chipselect(spi, 0)),
> +				   BIT(spi_get_chipselect(spi, 0)));
> +	}
> +}

[Severity: High]
What happens if nbyte is something other than 3 or 4 (like 1, 2, or 5)?

Does this silently ignore unsupported address lengths instead of rejecting
them, potentially leaving the syscon hardware in a stale or misconfigured
state during transfers?

> +
> +static int dw_spi_jhb100_init(struct platform_device *pdev,
> +			      struct dw_spi_mmio *dwsmmio)
> +{
> +	struct regmap *syscon;
> +
> +	syscon =3D syscon_regmap_lookup_by_phandle(dev_of_node(&pdev->dev),
> +						 "starfive,sfc-filter-syscon");
> +	if (IS_ERR(syscon))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(syscon),
> +				     "syscon regmap lookup failed\n");
> +
> +	dwsmmio->priv =3D syscon;
> +
> +	dwsmmio->dws.set_addr_nbyte =3D dw_spi_jhb100_set_addr_nbyte;
> +	dwsmmio->dws.ip =3D DW_HSSI_ID;
> +	dwsmmio->dws.quirk_flags =3D DW_SPI_QUIRK_JHB100;
> +
> +	dw_spi_jhb100_mask_intr(&dwsmmio->dws, 0xff);

[Severity: High]
Since this applies the interrupt mask during probe initialization, is there
corresponding logic needed to restore this register during PM resume?

If the SPI controller's power domain is lost during suspend,
DW_SPI_JHB100_FILTER_IMR might revert to its hardware reset value on resume.

The mmio suspend/resume path (dw_spi_mmio_resume) calls
dw_spi_resume_controller(), which ultimately executes dw_spi_hw_init().=20
However, that function resets standard registers and lacks any awareness of
this quirk-specific DW_SPI_JHB100_FILTER_IMR register.

If the default reset state leaves the filter interrupts unmasked, could this
trigger an unhandled interrupt storm locking up the CPU after the system
resumes?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709055204.1381=
68-1-changhuang.liang@starfivetech.com?part=3D11
