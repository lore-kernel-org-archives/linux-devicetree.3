Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF0134CF
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769577; cv=none; b=rKmvx7NdtD1cA7cCKc2pnDA+4Umuk2NOnMHcIuaAymY3b7tkwCBBJN/B4o50PyvqKXsYBZcAUs7lIyUfvJSHMU1uqD+wpT8XsKNVWL8ix8pbzxoAhJ6Hke+DJavBm6URQu0L6+VeqjqwfwM8UCXmEBvixUuNUy/+AtdrbTqrZAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769577; c=relaxed/simple;
	bh=Ma2tAWQ7M9XkJjH15nQxUrUHM/b8JxQktn/pbwlSSuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E/oRj11UgtOSFLjDDgSk3dDTvDHxHVxp7OappQFXNb9et8Mg/GEuurC2WqHn/y7Jcqxphm+lZ5Bx8VA/8xQgI78AnxKGfD5dEc2ZXeUOzIPUrW0xoLMAYwTq2yp/xclPDFXPLzJJTKVLWl6LPVWXWC2/UZ/E+2uAtJmgsns8I5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyJWGwDb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyJWGwDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1E61F000E9;
	Thu, 18 Jun 2026 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781769574;
	bh=k8plmz1/qLoyLjFNYs72NLlSuUs1Uvv2qR8vbWs+Hhw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XyJWGwDbPFif24w00XkRA3E2vtiV11LqdWLqc2OOxvrJlrUSKAlqe6gvGwHVE5PkU
	 hwZeDSob6KrNoRwjXn4/CoBUlDcAV4gtbkTBo/THgxWYrzwUQctJk5q9NqE/LRA1yW
	 1Y6bKL3H1eMc27psH8G1FtTUWRbxXhDeyFVZI/DzXUQJRujiP/T5ulz0OJoBbcz2lv
	 2FnOC9aNjizf8dF3KrS5Jbuvsu6lI0ReEI24tsVeTfbNWYqiTVvJHSuxWhJo7xMSZ7
	 2FtWUooqjBfVlGYtZtD81zlVbvhIulZ0XRqYo6BH8AnAWj7eHSq3+a9/P8OjUyCCSl
	 AJTfwDy4LpmNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/16] spi: cadence-quadspi: add PHY tuning support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260618073725.84733-9-s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-9-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 07:59:33 +0000
Message-Id: <20260618075934.3C1E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Unchecked dereference of `cqspi->ddata` in `cqspi_mem_op_execute_t=
uning` when it can be NULL.
- [High] Passing `.rodata` buffer to `spi_mem_exec_op()` violates SPI API D=
MA constraints.
- [High] Dual-region PHY tuning arithmetic lacks bounds clamping, causing `=
u8` underflows.
- [High] The tuning loops sweep `read_delay`, but `cqspi_phy_apply_setting`=
 fails to update the hardware register with the new delay.
- [High] PHY tuning modifies shared SPI controller registers without holdin=
g the SPI bus lock, creating a race condition with concurrent transfers.
- [High] The PHY tuning sequence performs direct MMIO to controller registe=
rs without acquiring a PM runtime reference.
- [Medium] Missing error check in SDR tuning causes invalid read_delay conf=
iguration.
- [Medium] The PHY tuning search loops ignore critical hardware timeouts an=
d memory allocation errors, causing the system to needlessly stall.
--

commit a0e116638901b220157d7f4a14b288dc44e8d0fd
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: spi: cadence-quadspi: add PHY tuning support

This commit adds an execute_tuning callback for delay-line calibration on
Cadence QSPI controllers. It implements tuning sweeps for both DDR and SDR
modes. The calibration relies on writing and reading a predefined pattern
to and from flash memory.

> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-=
quadspi.c
> index f4efb92c9446a..05e1b7a2f3433 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
[ ... ]
> @@ -1559,6 +1640,1678 @@ static bool cqspi_supports_mem_op(struct spi_mem=
 *mem,
> +static int cqspi_write_pattern_to_cache(struct cqspi_flash_pdata *f_pdat=
a,
> +					struct spi_mem *mem,
> +					struct spi_mem_op *write_op)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	write_op->data.nbytes =3D sizeof(phy_tuning_pattern);
> +	write_op->data.buf.out =3D phy_tuning_pattern;
> +
> +	ret =3D spi_mem_exec_op(mem, write_op);

[Severity: High]
Does passing phy_tuning_pattern directly to spi_mem_exec_op violate SPI DMA
constraints? The phy_tuning_pattern array is defined as static const u8 and
resides in the rodata section.

The SPI framework mandates that buffers passed to the SPI core must be
DMA-capable, as fallback paths will attempt to call dma_map_single on them.
Mapping a rodata buffer violates the DMA API and will trigger kernel panics
or warnings when CONFIG_DMA_API_DEBUG is enabled. Could this be copied to a
dynamically allocated bounce buffer first?

[ ... ]
> +static int cqspi_phy_apply_setting(struct cqspi_flash_pdata *f_pdata,
> +				   struct phy_setting *phy)
> +{
> +	struct cqspi_st *cqspi =3D f_pdata->cqspi;
> +	unsigned int reg;
> +	int ret;
> +
> +	reg =3D readl(cqspi->iobase + CQSPI_REG_READCAPTURE);
> +	reg |=3D BIT(CQSPI_REG_READCAPTURE_EDGE_LSB);
> +	writel(reg, cqspi->iobase + CQSPI_REG_READCAPTURE);
> +
> +	cqspi_set_dll(cqspi->iobase, phy->rx, phy->tx);
> +
> +	ret =3D cqspi_resync_dll(cqspi);
> +	if (ret)
> +		return ret;
> +
> +	f_pdata->phy_setting.read_delay =3D phy->read_delay;
> +	return 0;
> +}

[Severity: High]
Is the read_delay value actually being programmed into the hardware during
the tuning sweeps?

While cqspi_phy_apply_setting updates the DLL and edge registers, it appears
it never writes the phy->read_delay into the DELAY_LSB field of the
CQSPI_REG_READCAPTURE register.=20

Because the internal configuration updates are bypassed when the SPI clock
frequency has not changed, doesn't this mean the hardware read_delay remains
fixed at its initial value throughout the entire tuning sequence?

[ ... ]
> +static int cqspi_find_rx_low_ddr(struct cqspi_flash_pdata *f_pdata,
> +				 struct spi_mem *mem, struct phy_setting *phy)
> +{
> +	struct device *dev =3D &f_pdata->cqspi->pdev->dev;
> +	int ret;
> +
> +	do {
> +		phy->rx =3D CQSPI_PHY_RX_LOW_SEARCH_START;
> +		do {
> +			ret =3D cqspi_phy_apply_setting(f_pdata, phy);
> +			if (!ret) {
> +				ret =3D cqspi_phy_check_pattern(f_pdata, mem);
> +				if (!ret)
> +					return 0;
> +			}
> +
> +			phy->rx +=3D CQSPI_PHY_DDR_SEARCH_STEP;
> +		} while (phy->rx <=3D CQSPI_PHY_RX_LOW_SEARCH_END);

[Severity: Medium]
Will this loop stall the boot process needlessly if a fatal error occurs?

If cqspi_phy_apply_setting returns -ETIMEDOUT because the DLL failed to
lock, or cqspi_phy_check_pattern returns -ENOMEM due to an allocation error,
the loop checks if (!ret) and then blindly continues to the next coordinate.

Since these operations wait up to 600us on each iteration, ignoring these
environmental errors instead of failing fast seems to cause a significant
stall. Should we check for specific fatal error codes and abort?

[ ... ]
> +		/* Compare Manhattan distances: choose corner furthest from gap */
> +		if ((abs(gaplow.tx - bottomleft.tx) +
> +		     abs(gaplow.rx - bottomleft.rx)) <
> +		    (abs(gaphigh.tx - topright.tx) +
> +		     abs(gaphigh.rx - topright.rx))) {
> +			/* Topright further: Use Region 2, 16 taps inward */
> +			searchpoint =3D topright;
> +			searchpoint.tx -=3D 16;
> +			searchpoint.rx -=3D (16 * (topright.rx - bottomleft.rx)) /
> +					  (topright.tx - bottomleft.tx);

[Severity: High]
Can this proportional adjustment underflow the u8 searchpoint.rx variable?

When resolving the dual-region tuning target, if the calculated adjustment
exceeds topright.rx (e.g. if topright.rx is 24 and the adjustment evaluates
to 27), the u8 variable will severely underflow and wrap to 253.

This wrapped value is then passed into cqspi_set_dll where the 0x7F mask
would truncate it to an arbitrary out-of-bounds point, corrupting the
calibration. Should there be a clamp applied here?

[ ... ]
> +static int cqspi_phy_tuning_sdr(struct cqspi_flash_pdata *f_pdata,
> +				struct spi_mem *mem)
> +{
[ ... ]
> +	do {
> +		ret =3D cqspi_find_rx_low_sdr(f_pdata, mem, &rxlow);
> +
> +		if (ret)
> +			rxlow.read_delay++;
> +	} while (ret && rxlow.read_delay <=3D CQSPI_PHY_MAX_RD);
> +
> +	/* Find rxhigh: Decrement from RX=3D127 at same read_delay */
> +
[ ... ]
> +
> +	rxhigh.read_delay =3D rxlow.read_delay;
> +	ret =3D cqspi_find_rx_high_sdr(f_pdata, mem, &rxhigh, rxlow.rx);

[Severity: Medium]
Is there a missing error check after the first search loop?

Unlike the DDR implementation, if the loop exceeds CQSPI_PHY_MAX_RD without
finding rxlow, it exits with a non-zero ret. However, the code proceeds
directly to searching rxhigh with an out-of-bounds rxlow.read_delay (5) and
an invalid rxlow.rx (128). This causes out-of-bounds values to be applied to
the hardware configuration. Could we add an if (ret) goto out; check here?

[ ... ]
> +static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
> +					   struct spi_mem_op *read_op,
> +					   struct spi_mem_op *write_op)
> +{
[ ... ]
> +	if (read_op->cmd.dtr || read_op->addr.dtr || read_op->dummy.dtr ||
> +	    read_op->data.dtr) {
> +		f_pdata->use_dqs =3D true;
> +		cqspi_phy_pre_config(cqspi, f_pdata, false);
> +		ret =3D cqspi_phy_tuning_ddr(f_pdata, mem);
> +	} else {
> +		f_pdata->use_dqs =3D false;
> +		cqspi_phy_pre_config(cqspi, f_pdata, true);
> +		ret =3D cqspi_phy_tuning_sdr(f_pdata, mem);
> +	}

[Severity: High]
Are we adequately protecting concurrent transfers and power management state
during these tuning calls?

The spi_mem_execute_tuning framework API does not acquire the SPI
controller's bus_lock_mutex. Consequently, this callback runs lock-free. It
performs raw read-modify-write operations on shared controller registers
like CQSPI_REG_CONFIG and unconditionally disables the controller via
cqspi_resync_dll(). If another SPI device on the same bus initiates a
concurrent transfer, its transfer could be aborted or corrupted by these
unguarded register writes.

[Severity: High]
Additionally, the tuning sequence accesses the controller's MMIO registers
directly but does not acquire an active PM runtime reference with
pm_runtime_resume_and_get(). If the SPI controller is suspended by
auto-suspend immediately after an inner spi_mem_exec_op returns, subsequent
manual MMIO accesses might hit unclocked hardware and trigger synchronous
external aborts.

[ ... ]
> +static int cqspi_mem_op_execute_tuning(struct spi_mem *mem,
> +				       struct spi_mem_op *read_op,
> +				       struct spi_mem_op *write_op)
> +{
> +	struct cqspi_st *cqspi =3D
> +		spi_controller_get_devdata(mem->spi->controller);
> +
> +	if (!cqspi->ddata->execute_tuning)
> +		return -EOPNOTSUPP;
> +
> +	return cqspi->ddata->execute_tuning(mem, read_op, write_op);
> +}

[Severity: High]
Can cqspi->ddata be NULL here?

The execute_tuning callback is unconditionally added to cqspi_mem_ops. In
this driver, cqspi->ddata is populated via of_device_get_match_data(), which
can return NULL for generic fallbacks or manual device instantiation. If
ddata is NULL, dereferencing cqspi->ddata->execute_tuning will trigger a
kernel panic when the SPI core attempts to execute tuning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618073725.8473=
3-1-s-k6@ti.com?part=3D8
