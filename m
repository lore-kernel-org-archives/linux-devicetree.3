Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9772C530DE5
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959364; cv=none; b=PiHPUlO3XeNrOV2/v0F0f9ZolZn0JXAKso8CvZzEsPrkAruQhvmwLnPMuTfp/pa2Z006eSsCLAcXpHifOJH//4iejIWy7FHrBoTceCH0A7o9XD0xuqOqCsvdRLFivuII3zYZ54ykxZw6rojjyf1hJXQOgPZjIZIIcfkc51J9OsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959364; c=relaxed/simple;
	bh=SJIzcnwohh8qakAHBlYBskHO/iTOVzgifwZXKK/AuTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RahPhiaAfu+EA/XdjR+1T+ilQfsQCBxDM+bAoutUFIvHfLPRp2KduzhxOguX9ykwdy1rAP5F2nmCSMaq1EK6RDF80kGb19vwahafRehFrH31Zf87LtmRMckNKO3Han4JyC28HX0OlbmaDy+Vov7SBvmfNnFuwVxNJMeJp0MM2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyRgwkUF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyRgwkUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB581F00A3A;
	Wed,  9 Sep 2026 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788959363;
	bh=ms3PJ3KetCV3iXmKyxWWNEqze2YotnxDHotwJUQYGr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nyRgwkUFGRIF7uM57sbzriiWIRbuwHEMb2lbOUHU33XUCdZE04jTe4fPP4ygNQgCX
	 joWtBwOM72yEA1ySzoOK+SGYrILgZIc7qm/QLX2duNTr/fVRsZ8qLXwd0JNE64ef+J
	 Gu43OoRWf3XFt03jaTJ0r3aNoskilvszQ8LAfH8kJLubdN2Q2omAaMMyZsBkkKo+U6
	 CwLA4OmwW+00alW/J6LP4r12MWhcpcoXu1j3DimoBPHXTRIhM1+8dgMdYlRqny5yrb
	 XFD9J/AC4Abhzyce3n3X+1Pjnj5gHl3SFvRqse5Dsjs9Co1bRajaVAOFdyv245hqDe
	 ST+ZmQ0tSukoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] spi: spi-mem: Add Realtek SPI NOR flash
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909125701.273314-3-eleanor.lin@realtek.com>
References: <20260909125701.273314-1-eleanor.lin@realtek.com>
 <20260909125701.273314-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:09:22 +0000
Message-Id: <20260909130923.0CB581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect 4-byte address mode handling for stateless commands and =
reads causes address truncation and controller-flash state desynchronizatio=
n.
- [High] Stateless SPI commands (e.g., RDID, WRSR) can be fragmented due to=
 byte-wise MMIO accesses and timing-dependent CS handling.
- [High] Missing Dual I/O enable for writes despite advertising SPI_TX_DUAL.
- [Medium] Unbalanced clock disable in `rtk_spi_remove` if device resume fa=
ils.
- [Medium] Missing reset_control_assert() on probe error paths leaves hardw=
are out of reset.
- [Medium] Dummy read from iobase triggers an unintended physical SPI read =
transaction.
--

commit ef4877eed506d539849849d8e36962c060c55e3d
Author: Jyan Chou <jyanchou@realtek.com>
spi: spi-mem: Add Realtek SPI NOR flash controller driver

This commit adds a spi-mem driver for the Realtek DHC SoC SPI NOR Flash
Controller. It supports single and dual I/O transfers and offloads the
payload to an integrated DMA engine.

> diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/spi/spi-rtk-nor.c
> @@ -0,0 +1,623 @@
[ ... ]
> +static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct sp=
i_mem_op *op)
> +{
[ ... ]
> +	val &=3D ~SFC_CTL_DMYCNT_MASK;
> +	val |=3D (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
> +	writel(val, host->regbase + SFC_CTL);
> +
> +	readl(host->iobase);

[Severity: Medium]
Does reading from host->iobase here unintentionally trigger a physical SPI
read transaction on the bus before the DMA transfer begins? Because
host->iobase maps to the flash region, reading it may directly instruct the
SPI controller to issue a read command.

> +}
> +
> +static void rtk_spi_write_mode(struct rtk_spi_host *host,
> +			       const struct spi_mem_op *op)
> +{
> +	u32 opcode =3D op->cmd.opcode;
> +	u32 val;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);

[Severity: High]
The controller advertises SPI_TX_DUAL, but is it intentional to omit setting
DUAL_MODE_EN here for dual buswidth operations? The flash might expect data
on two lines while the controller only transmits on one.

[ ... ]
> +static int rtk_spi_command_read(struct rtk_spi_host *host, const struct =
spi_mem_op *op)
> +{
> +	size_t len =3D op->data.nbytes;
> +	loff_t offset =3D op->addr.val;
> +	u8 opcode =3D op->cmd.opcode;
> +	u32 dummy_cycles, val;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);
> +
> +	val =3D readl(host->regbase + SFC_CTL);
> +	val &=3D ~(SFC_CTL_DMYCNT_MASK | ADDR_EN);
> +	val |=3D RW_DATAEN;
> +
> +	if (op->addr.nbytes > 0)
> +		val |=3D ADDR_EN;

[Severity: High]
This function executes SPI reads, but is it missing the 4-byte address mode
check (SFC_ADR_FOUR_BYTE_EN) and verification of op->addr.nbytes? The
spi-nor framework frequently issues 4-byte stateless reads, which would be
truncated to 3 bytes without this configuration.

[ ... ]
> +static int rtk_spi_do_write_and_cmds(struct rtk_spi_host *host, const st=
ruct spi_mem_op *op)
> +{
> +	u8 opcode =3D op->cmd.opcode;
> +	u32 ctl_val =3D 0;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);

[Severity: High]
Similar to rtk_spi_write_mode, is this missing the DUAL_MODE_EN setup for
PIO data writes?

[ ... ]
> +	if (op->data.nbytes > 0) {
> +		const u8 *buf =3D op->data.buf.out;
> +
> +		if (op->addr.val + op->data.nbytes > host->dirmap_size)
> +			return -EINVAL;
> +
> +		for (unsigned int i =3D 0; i < op->data.nbytes; i++)
> +			writeb(buf[i], host->iobase + op->addr.val + i);

[Severity: High]
For multi-byte stateless PIO commands like WRSR, does writing byte-by-byte
to the memory-mapped window risk fragmenting the transaction if the CPU is
preempted? A context switch here might cause the chip select to timeout and
deassert, splitting the command into separate, invalid transactions.

> +	} else {
[ ... ]
> +	/*
> +	 * Hardware Workaround:
> +	 * The controller's auto-mode engine requires SFC_ADR_FOUR_BYTE_EN to be
> +	 * explicitly updated when the flash enters or exits 4-byte mode via co=
ntrol
> +	 * commands.
> +	 */
> +	if ((op->addr.nbytes =3D=3D 4 || opcode =3D=3D RTK_SPI_OP_EN4B) && !hos=
t->is_4byte) {
> +		host->is_4byte =3D true;
> +		writel(0x1, host->regbase + SFC_ADR_FOUR_BYTE_EN);

[Severity: High]
Because the physical transfer occurs before this hardware workaround updates
SFC_ADR_FOUR_BYTE_EN, won't stateless commands be sent with the old address
length?

This could truncate 4-byte addresses to 3 bytes for the current command,
and then erroneously lock the controller into 4-byte mode for subsequent
commands.

> +	} else if ((op->addr.nbytes =3D=3D 3 || opcode =3D=3D RTK_SPI_OP_EX4B) =
&& host->is_4byte) {
> +		host->is_4byte =3D false;
> +		writel(0x0, host->regbase + SFC_ADR_FOUR_BYTE_EN);
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int rtk_spi_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(35));
> +	if (ret) {
> +		dev_err(dev, "Failed to set dma mask\n");
> +		goto err_disable_clk;
> +	}
[ ... ]
> +err_pm_disable:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	reset_control_assert(host->rstc);
> +
> +err_disable_clk:
> +	clk_disable_unprepare(host->clk);

[Severity: Medium]
If dma_set_mask_and_coherent or dmam_alloc_coherent fails, does jumping
straight to err_disable_clk leave the hardware out of reset? It looks like
this bypasses the reset_control_assert call present in err_pm_disable.

> +
> +	return ret;
> +}
> +
> +static void rtk_spi_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctrl =3D platform_get_drvdata(pdev);
> +	struct rtk_spi_host *host =3D spi_controller_get_devdata(ctrl);
> +	struct device *dev =3D &pdev->dev;
> +
> +	spi_unregister_controller(ctrl);
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_disable(dev);
> +	reset_control_assert(host->rstc);
> +	clk_disable_unprepare(host->clk);

[Severity: Medium]
If pm_runtime_get_sync fails here (for example, if the clock fails to
re-enable during resume), does the unconditional call to
clk_disable_unprepare cause a clock usage underflow?

> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_set_suspended(dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909125701.2733=
14-1-eleanor.lin@realtek.com?part=3D2
