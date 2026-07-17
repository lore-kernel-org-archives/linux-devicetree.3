Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590D3644AF
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315452; cv=none; b=Rv+dRe5NZpZm5EJXbcv5IP+61//ASjgofc1XzPO5o3X/c63cGfdBK/4c3SpwBSCklzHA3X6euakGTbeevQLOIxirodN5VqFq/ksWLJkfO1P1LB2qdkeTZiZFOvce9rZnoRJVBjv5LJMxqDCge+AiGgx0xtgSPRnaFp/ZCqa8HzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315452; c=relaxed/simple;
	bh=4tLLfDUL5+nQlKW3OraxiqUoJn2/rVOaINWMm+CTWKg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a00D/q3vnN97VI8tmy1PP7nScn41b+KL9syIQUxJeDOOPnwVRT4eJr+/2UXght/5MqZXDzllNWvqNXXzcBZ5pu8OVAJIuHOCoNb5kfF8JMZP5knni/twIkjsPiIff7xCp1NzgZuq89AGQipiZ3Kq5wI8qT5bjAaK4B+RJoX5tKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JV27oXI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JV27oXI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70CA1F000E9;
	Fri, 17 Jul 2026 19:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315451;
	bh=o9YxhwGGHCEabfqn2xkhdHRCwL2B2WUteBE8UWWsy58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JV27oXI3YSeq/OFcDXM1fuKmPMrKzya6YfmQo4PbSw+8wi4Tsh67rKAnMytaARGn0
	 ILA9Shf12maMtm+KXXVu1q9oGuryIbkuHZcmkPYjTs1oMk8MyMEv/JAj5rKQe2s3Uu
	 FKKXXMJC56CAJfaNd/fnRQKmGi4HuUsNkzQ60XVl9cdQafg5BabX8qUxOr/J+E/PCg
	 fijqB13OZ4VB0Z09iPU6max8mzXu3ER3t95/4nuge/SpCVOwcoj4eA/PLMMEoxO7Ct
	 H2MbzHOmKS6+HOjpHbaV5LFN1go3PlXiDximYpq+iL5Oc0BrdNZqcUeeiMkU5nhACa
	 dYV8TM8UHqlPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/17] spi: cadence-quadspi: enable PHY for direct
 reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717185116.2065505-12-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-12-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:10:50 +0000
Message-Id: <20260717191050.C70CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [Critical] Splitting the direct read into adjacent unaligned DMA mappings=
 violates the DMA API cacheline alignment rules, causing memory corruption.
- [Critical] Direct reads for unaligned buffers, small lengths, or vmalloc =
addresses bypass PHY tuning at high speeds, causing silent data corruption.
- [High] Integer underflow when decrementing the dummy cycle count for 0-du=
mmy cycle commands, resulting in 31 dummy cycles being programmed.
- [High] The return value of `cqspi_tune_phy(..., false)` is completely ign=
ored, masking hardware timeouts.
- [High] Hardware state modifications are not reverted if `cqspi_wait_idle(=
)` fails in `cqspi_tune_phy(..., true)`, leaving the PHY permanently enable=
d.
- [High] If `cqspi_resync_dll()` fails, the controller retains the target d=
evice's settings in `CQSPI_REG_PHY_CONFIG` but the DLL remains unlocked, ca=
using silent data corruption on subsequent reads.
- [High] The `rx_dma_complete` completion is reinitialized after the DMA tr=
ansaction is submitted, creating a TOCTOU race condition.
- [High] Modifying PHY configuration and dummy cycle registers while the co=
ntroller may not be fully idle corrupts the hardware state machine.

Pre-existing issues:
- [High] Inconsistent MMIO accessor semantics between bulk transfers and pa=
rtial remainder transfers, leading to data corruption on big-endian archite=
ctures.
--

--- Patch [11]: [PATCH v5 11/17] spi: cadence-quadspi: enable PHY for direc=
t reads ---
commit c88f8eecc883007f79c6f7679e88e02531e508ae
Author: Santhosh Kumar K <s-k6@ti.com>

spi: cadence-quadspi: enable PHY for direct reads
   =20
Add cqspi_tune_phy() to toggle PHY mode. Enabling sets the calibrated
read-capture delay, asserts PHY_EN and PHY_PIPELINE, and decrements the
dummy cycle count by one since the PHY pipeline absorbs that latency.
When multiple chip selects have different calibration results, the DLL
is reprogrammed on each enable to match the active device's settings.
Disabling reverses all three.

For direct reads, split the transfer into an unaligned head, a
16-byte-aligned middle section with PHY active, and an unaligned tail.
PHY is used when tuning completed successfully and the transfer is at
the calibrated frequency.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index 322e95b3bc17d..35a4000739449 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -1067,6 +1067,82 @@ static int cqspi_resync_dll(struct cqspi_st *cqspi)
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
Does returning early here if cqspi_resync_dll() fails leave the controller =
in
an inconsistent state? cqspi_set_dll() has already updated CQSPI_REG_PHY_CO=
NFIG
with the new settings. If we return here, on the next read, the driver might
skip cqspi_resync_dll() entirely because the settings appear to match, and
proceed to read with the PHY enabled but the DLL unlocked or out-of-sync.
Could this cause silent data corruption?

> +		}
> +
> +		cqspi_readdata_capture(cqspi, true, f_pdata->use_dqs,
> +				       f_pdata->phy_setting.read_delay);
> +
> +		reg =3D readl(reg_base + CQSPI_REG_CONFIG);
> +		reg |=3D CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE;
> +		writel(reg, reg_base + CQSPI_REG_CONFIG);

[Severity: High]
Is it safe to modify CQSPI_REG_CONFIG and CQSPI_REG_RD_INSTR here without
first ensuring the SPI controller is fully idle?

In cqspi_direct_read_execute(), cqspi_tune_phy() is called immediately afte=
r a
DMA segment completes. The DMA completion indicates that the AHB memory wri=
tes
finished, but not necessarily that the QSPI controller has fully de-asserte=
d CS
and returned to idle. Could modifying these registers without a prior
cqspi_wait_idle() check race with the controller's shutdown sequence and
corrupt the hardware state machine?

> +
> +		/*
> +		 * The PHY data-capture pipeline absorbs one dummy cycle's
> +		 * worth of latency; reduce the count to avoid over-compensation.
> +		 */
> +		reg =3D readl(reg_base + CQSPI_REG_RD_INSTR);
> +		dummy =3D FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +					  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +				  reg);
> +		dummy--;
> +		reg &=3D ~(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +			 << CQSPI_REG_RD_INSTR_DUMMY_LSB);
> +		reg |=3D FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
> +					  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
> +				  dummy);

[Severity: High]
Can this decrement cause an integer underflow if the initial dummy count is=
 0?

If a read command requires 0 dummy cycles, dummy-- would underflow to 255.
When masked to 5 bits via FIELD_PREP, it would write 31 to the hardware
register instead of 0, which might misalign sampling and corrupt data.

> +		writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +	} else {
[ ... ]
> +		writel(reg, reg_base + CQSPI_REG_RD_INSTR);
> +	}
> +
> +	return cqspi_wait_idle(cqspi);

[Severity: High]
If cqspi_wait_idle() times out during the enable path, the function returns=
 an
error, but it does not seem to revert the hardware state modifications
(like PHY_EN and the dummy cycle decrement). Since the caller will abort
without calling cqspi_tune_phy(..., false), does this leave the PHY permane=
ntly
enabled and break subsequent operations?

> +}
> +
[ ... ]
> @@ -1617,8 +1701,11 @@ static int cqspi_direct_read_execute(struct cqspi_=
flash_pdata *f_pdata,
>  {
>  	struct cqspi_st *cqspi =3D f_pdata->cqspi;
>  	loff_t from =3D op->addr.val;
> +	loff_t from_aligned, to_aligned;
>  	size_t len =3D op->data.nbytes;
> +	size_t len_aligned;
>  	u_char *buf =3D op->data.buf.in;
> +	int ret;
> =20
>  	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
>  	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN) {
> @@ -1626,7 +1713,42 @@ static int cqspi_direct_read_execute(struct cqspi_=
flash_pdata *f_pdata,
>  		return 0;
>  	}
> =20
> -	return cqspi_direct_read_dma(f_pdata, buf, from, len);
> +	if (!cqspi_use_tuned_phy(f_pdata, op, post_config_max_speed_hz))
> +		return cqspi_direct_read_dma(f_pdata, buf, from, len);
> +
> +	/* Split into unaligned head, aligned middle, unaligned tail */
> +	from_aligned =3D ALIGN(from, 16);
> +	to_aligned =3D ALIGN_DOWN(from + len, 16);
> +	len_aligned =3D to_aligned - from_aligned;
> +
> +	if (from !=3D from_aligned) {
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, from,
> +					    from_aligned - from);

[Severity: Critical]
By splitting the DMA mappings at 16-byte boundaries instead of the CPU's
cacheline size (typically 64 bytes), do these adjacent sub-buffers end up
sharing cachelines?

When the middle section is mapped for DMA, could the cache maintenance
operations destroy the data just written to memory by the head section's
DMA, or write back stale CPU cache data over it, causing memory corruption
on architectures with non-coherent DMA?

[Severity: High]
Additionally, I noticed a race condition inside cqspi_direct_read_dma() when
submitting the transaction:

    cookie =3D tx->tx_submit(tx);
    reinit_completion(&cqspi->rx_dma_complete);

If the DMA engine processes the descriptor immediately after tx_submit, the
callback might execute and call complete() before reinit_completion() clear=
s it,
causing wait_for_completion_timeout() to incorrectly hang.

[Severity: Critical]
For unaligned buffers, short lengths, or vmalloc addresses, it appears we b=
ypass
PHY tuning and read directly via AHB. However, the SPI clock frequency is s=
till
running at post_config_max_speed_hz.

If this high frequency requires PHY tuning for proper data capture, will re=
ading
without the PHY enabled violate setup/hold times and sample garbage data?

> +		if (ret)
> +			return ret;
> +		buf +=3D from_aligned - from;
> +	}
> +
> +	if (len_aligned) {
> +		ret =3D cqspi_tune_phy(f_pdata, true);
> +		if (ret)
> +			return ret;
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, from_aligned,
> +					    len_aligned);
> +		cqspi_tune_phy(f_pdata, false);

[Severity: High]
Does this code ignore the return value of cqspi_tune_phy(..., false)?

If the preceding DMA operation succeeded but disabling the PHY fails
due to a hardware timeout in cqspi_wait_idle(), the return value is lost.
Could this mask hardware timeouts and leave the controller broken while the=
 SPI
subsystem assumes success?

> +		if (ret)
> +			return ret;
> +		buf +=3D len_aligned;
> +	}
> +
> +	if (to_aligned !=3D (from + len)) {
> +		ret =3D cqspi_direct_read_dma(f_pdata, buf, to_aligned,
> +					    (from + len) - to_aligned);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }

I also noticed an issue in the indirect transfer functions that is not
introduced by this patch, but might be worth addressing.

[Severity: High]
This is a pre-existing issue, but does mixing ioread32_rep() with ioread32()
cause data corruption on big-endian architectures?

In cqspi_indirect_read_execute():

    ioread32_rep(ahb_base, rxbuf, (bytes_to_read / 4));
    } else if (!word_remain && mod_bytes) {
        unsigned int temp =3D ioread32(ahb_base);

The bulk data is read using ioread32_rep() (which preserves FIFO byte order
without byteswapping), while the remainder bytes use ioread32() (which perf=
orms
CPU-to-device byteswapping on big-endian systems). The trailing bytes of the
payload will be byte-swapped relative to the bulk data. A similar pattern
exists in cqspi_indirect_write_execute() with iowrite32_rep() and iowrite32=
().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D11
