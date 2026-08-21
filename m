Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F3288505
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319068; cv=none; b=hEsJnQklLWLfvzXhxU3uB2N3DqAC8dqM+F/wrDgGzBU97Yi2HP3WfbnRVpR+rYuHqrXHPreyoe4+91Im1kvDqysXRNfgs2PIghrm1i6tbgAGdSiFyx8jfNgH7x2+2fu7nMdJk5rCmRA2ovDk57iqRzpOh4jNMXOGhjJdvBUeRBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319068; c=relaxed/simple;
	bh=6AUWG531ITdJiyXHcGrQZ9uZ3z30PZIV9tkEMhAjlGg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ucj4Dh0i/PcoCkmABgajeXDUptJZJ7eU7Iqa3+s1J5lmytCcyp37kUyhE2RwERdc7g8wLsCqSNn5QYtzN/89h3ytmDsNIZVbvdMILecXQSZE5rIarxPMCSnot2+aKRLvS0Gl2ZUfbmbLrXDfRnw5bVLtMSPXPQEdmFlArYFg2NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9U397Ch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9U397Ch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDAD1F000E9;
	Fri, 21 Aug 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787319067;
	bh=B35MIrfWj3Wm46Am+VNmewD9onDeHMdrltFqeGvmlh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9U397Cht6rulZNnP46wHuk1jf598ymSCBGFunITtfSWNNDcNwUmolUxO/yjhsMcb
	 Pal1O8gz4qZNsL3UtxaCd7NFekpS2EZHeE811xDkhWPLMwBujDoZO7IAwmv6szA00P
	 TSfu8WLGriZ/4tRp5q4qnshV5LcciGuQXI1W9cC+wmVxnB+FO4gGeBmadQb8FzDd3H
	 +udIgcuEOZnVUSXD3VAHp7BYDrOPnxDPYUQi/SxIVkBKDVhERDmIPvPk0XTQ7cAqUO
	 QCIBBbluXfxCzWUtN1e9V7ZbjT7RX4fZE1pROwRubEEE2tCat3XYmWf7youZHa3Bnz
	 a7aRDbJlGrzhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 11/18] spi: cadence-quadspi: enable PHY for direct
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821114822.4040338-12-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
 <20260821114822.4040338-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:31:06 +0000
Message-Id: <20260821133106.9DDAD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The error path in `cqspi_tune_phy` (when `enable` is true) fails t=
o restore the `CQSPI_REG_READCAPTURE` register, leaving the controller in a=
 corrupted state for subsequent non-PHY reads.
- [High] `cqspi_tune_phy` (enable=3Dfalse) bails out early on idle wait tim=
eout, leaving the PHY permanently enabled, and its return value is ignored =
by callers, masking the failure.
- [High] A failed DLL resync leaves `CQSPI_REG_PHY_CONFIG` updated, causing=
 subsequent retries to skip the resync and use an unlocked PHY.

Pre-existing issues:
- [High] The PIO fallback path in `cqspi_memcpy_fromio()` causes data corru=
ption on big-endian architectures due to mismatched I/O accessors.
--

--- Patch [11]: [PATCH v8 11/18] spi: cadence-quadspi: enable PHY for direc=
t reads ---
commit b1257269b9ef8a064e84e36b6359dd1d26e31e0d
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: spi: cadence-quadspi: enable PHY for direct reads

This patch adds support for toggling the PHY mode around direct DMA reads in
the Cadence QSPI driver. It introduces cqspi_tune_phy() to configure and
enable the PHY pipeline and reprogram the DLL if necessary. It also adds a
predicate to ensure PHY is only used when the operation frequency matches t=
he
tuned frequency and the transfer is 16-byte aligned.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 99a0ec0e769c5..8903b4cf4f6f5 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1074,6 +1074,102 @@ static int cqspi_resync_dll(struct cqspi_st *cqsp=
i)
>  	return ret;
>  }
> =20
> +static int cqspi_tune_phy(struct cqspi_flash_pdata *f_pdata, bool enable)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	void __iomem *reg_base =3D cqspi->iobase;
> +	u32 reg;
> +	u8 dummy;
> +	int ret;
> +
> +	ret =3D cqspi_wait_idle(cqspi);
> +	if (ret)
> +		return ret;

[Severity: High]
If this cqspi_wait_idle() times out when enable is false, the function retu=
rns
early without clearing CQSPI_REG_CONFIG_PHY_EN or restoring the read capture
settings. Does this leave the SPI controller permanently stuck in PHY mode,
which would break subsequent non-PHY communication with the flash?

> +
> +	if (enable) {

[ ... ]

> +		reg =3D readl(reg_base + CQSPI_REG_PHY_CONFIG);
> +		if (((reg >> CQSPI_REG_PHY_CONFIG_RX_DEL_LSB) &
> +		     CQSPI_REG_PHY_CONFIG_RX_DEL_MASK) !=3D f_pdata->phy_setting.rx ||
> +		    ((reg >> CQSPI_REG_PHY_CONFIG_TX_DEL_LSB) &
> +		     CQSPI_REG_PHY_CONFIG_TX_DEL_MASK) !=3D f_pdata->phy_setting.tx) {
> +			cqspi_set_dll(reg_base, f_pdata->phy_setting.rx,
> +				      f_pdata->phy_setting.tx);
> +			ret =3D cqspi_resync_dll(cqspi);
> +			if (ret)
> +				return ret;

[Severity: High]
If cqspi_resync_dll() fails, the hardware register CQSPI_REG_PHY_CONFIG
still retains the new settings written by cqspi_set_dll(). On a subsequent
retry, the initial check above will see that the register matches the devic=
e's
settings, skipping the resync entirely. Can this lead to operating the PHY
with an unsynced or unlocked DLL?

> +		}
> +
> +		cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
> +				       f_pdata->phy_setting.read_delay);
> +
> +		reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +		reg |=3D CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE;
> +		writel(reg, reg_base + CQSPI_REG_CONFIG);
> +

[ ... ]

> +		ret =3D cqspi_wait_idle(cqspi);
> +		if (ret) {
> +			reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +			reg &=3D ~(CQSPI_REG_CONFIG_PHY_EN |
> +				 CQSPI_REG_CONFIG_PHY_PIPELINE);
> +			writel(reg, reg_base + CQSPI_REG_CONFIG);
> +			reg =3D readl(reg_base + CQSPI_REG_RD_INSTR);
> +			reg &=3D ~(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +				 << CQSPI_REG_RD_INSTR_DUMMY_LSB);
> +			reg |=3D FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +						  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +					  cqspi->phy_saved_dummy);
> +			writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +		}
> +		return ret;

[Severity: High]
This error path rolls back CQSPI_REG_CONFIG and CQSPI_REG_RD_INSTR, but it
seems to miss reverting CQSPI_REG_READCAPTURE, which was modified earlier
via cqspi_readdata_capture(). Since cqspi_configure() optimizes out
READCAPTURE updates unless the clock frequency or chip-select changes, could
this cause subsequent standard reads to use incorrect PHY capture settings =
and
corrupt data?

> +	}

[ ... ]

> @@ -1629,6 +1733,7 @@ static int cqspi_direct_read_execute(struct cqspi_f=
lash_pdata *f_pdata,
>  	loff_t from =3D op->addr.val;
>  	size_t len =3D op->data.nbytes;
>  	u_char *buf =3D op->data.buf.in;
> +	int ret;
> =20
>  	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
>  	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN) {

[ ... ]

> +	ret =3D cqspi_tune_phy(f_pdata, true);
> +	if (ret)
> +		return ret;
> +	ret =3D cqspi_direct_read_dma(f_pdata, buf, from, len);
> +	cqspi_tune_phy(f_pdata, false);
> +
> +	return ret;
>  }

[Severity: High]
Is it possible this hides a hardware failure from the SPI subsystem since
the return value is still 0 from the DMA read? The return value of
cqspi_tune_phy(f_pdata, false) is ignored here, so if the DMA read succeeds
but disabling the PHY times out during cqspi_wait_idle(), the operation is
reported as a success despite the controller being left in a broken state.


While reviewing this, I also noticed a pre-existing issue in the driver.

[Severity: High]
This is a pre-existing issue, but the PIO fallback path in
cqspi_memcpy_fromio() appears to mix accessors in a way that breaks
big-endian systems:

drivers/spi/spi-cadence-quadspi.c:cqspi_memcpy_fromio() {
    ...
    while (count >=3D 4) {
        put_unaligned_le32(__raw_readl(from), to);
        from +=3D 4;
        to +=3D 4;
        count -=3D 4;
    }
    ...
}

The __raw_readl() performs a native load without byte-swapping, but
put_unaligned_le32() will apply a byteswap before storing on big-endian
hardware. Can this incorrectly reverse the byte order of the stream in 4-by=
te
chunks during unaligned DMA transfers that fallback to PIO?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821114822.4040=
338-1-s-k6@ti.com?part=3D11
