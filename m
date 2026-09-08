Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1852E042
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866930; cv=none; b=cCAinb8AEw88XJzb1n1gtNrHn+O3xfzhQn6tw8VNWCdGWAeDZbYNGWxvr4LHunBiRjvW0fmt57zTdgxpeYb9EMeDJW17t7NtUQkjpYwfbTNe/b3y4YcAHeTkO3WbnT0SQvrfuyQ/+p4tvvErkNgTfM0JZ9N4HEFZ/fQRZspA84s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866930; c=relaxed/simple;
	bh=uCXnOs3tBzVQUkKRBye5FBuYclubwYCFkpUctCoCTyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nti3E5XDKyopD0KQObferen45mlorvSPE+TlPdSoegYRFP8JDCU0l+aPpENWXdyqeBj3q5LrbpFfrpHeJepy3KJzpmFotW6vHAod9EJ+6EUTuPrqFkxQauq1Lp7iw6/YGx+EClxyaVTnG+sqQPa2lwmp6z/N2f0kNc8qZoHYaNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdoHF3h0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdoHF3h0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25981F00A3A;
	Tue,  8 Sep 2026 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788866922;
	bh=y729wYMQ7g2s+A5/4Jy7V9kHq1KmXptfkzPpnlzQvX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SdoHF3h03BaFmQfExl2i1J6AAmxL+i91wyfmIxv9Vl25NAcDb5XdCred9es5stumZ
	 +60T2E8ZBoXUSr8DALda4pGdZZmZnNuKm0B9GxC1WHer0UzRj8qmu0edeVV1D8qVGM
	 ZkBy/yo/n4A0h7EA/SywEU8XBvity/GZ2MVOLVtVTcgfGExwcGm6ivYvz6E1TBC7hb
	 QIra2ltj7MKKI7u2lFMbNEb19tQxnDCykt/UYN8Y5dQvDs5EbeDijjIA8/g/PxAqqK
	 pvqK9uTbQuapQE1cW14VOOPlKAJKoaxfuGPAdcRIqbUQasRpaIYbg0s2i77pNmi7/8
	 emFM3WNZBuOiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] spi: spi-mem: Add Realtek SPI NOR flash
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908111640.2032749-3-eleanor.lin@realtek.com>
References: <20260908111640.2032749-1-eleanor.lin@realtek.com>
 <20260908111640.2032749-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 11:28:41 +0000
Message-Id: <20260908112841.E25981F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Dual I/O mode is advertised for TX and RX but is not enabled for `=
exec_op` reads or any writes, leading to silent data corruption.
- [High] Missing bounds checks on flash offsets allow out-of-bounds virtual=
 memory accesses and arbitrary physical memory DMA.
- [High] Stateless 4-byte address commands are corrupted due to strict reli=
ance on the `EN4B` stateful opcode.
- [Medium] Unchecked `pm_runtime_get_sync()` in `remove()` causes clock und=
erflow if resume fails.
- [Medium] Missing `reset_control_assert()` in the `probe()` error path and=
 `remove()`, leaking the hardware reset state.
- [Low] The driver uses legacy `RUNTIME_PM_OPS()` and `SYSTEM_SLEEP_PM_OPS(=
)` macros instead of `DEFINE_RUNTIME_DEV_PM_OPS()`, directly contradicting =
the patch changelog.
- [Low] Leftover error check on unassigned `ret` variable in `rtk_spi_do_wr=
ite_and_cmds` is unreachable dead code.
--

commit 94200312000dbff54ba23aa9dcbfc62c9c169eb0
Author: Jyan Chou <jyanchou@realtek.com>

spi: spi-mem: Add Realtek SPI NOR flash controller driver

Add a spi-mem driver for the SPI NOR Flash Controller (SFC) found on Realtek
DHC SoC. SFC supports Dual I/O.
   =20
Implement the exec_op API for regular control commands and the dirmap API
for hardware-accelerated read/write operations.

[ ... ]

> diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
> new file mode 100644
> index 0000000000000..df75da60ce8a7
> --- /dev/null
> +++ b/drivers/spi/spi-rtk-nor.c

[ ... ]

> +static void rtk_spi_write_mode(struct rtk_spi_host *host,
> +			       const struct spi_mem_op *op)
> +{
> +	u32 opcode =3D op->cmd.opcode;
> +	u32 val;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);

[Severity: High]
The controller advertises SPI_TX_DUAL, but does this function enable dual
I/O for writes? It looks like op->data.buswidth =3D=3D 2 is not checked her=
e,
so DUAL_MODE_EN is never set on the opcode, which could lead to silent data
corruption when writing to the flash.

> +
> +	val =3D readl(host->regbase + SFC_CTL);
> +	val |=3D RW_DATAEN | ADDR_EN;
> +	writel(val, host->regbase + SFC_CTL);
> +}

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

[Severity: High]
Similarly, does this exec_op read path support dual I/O? It appears to miss
the op->data.buswidth =3D=3D 2 check, so the DUAL_MODE_EN bit is missing wh=
en
dual reads are negotiated.

> +
> +	val =3D readl(host->regbase + SFC_CTL);
> +	val &=3D ~(SFC_CTL_DMYCNT_MASK | ADDR_EN);

[ ... ]

> +static int rtk_spi_do_write_and_cmds(struct rtk_spi_host *host, const st=
ruct spi_mem_op *op)
> +{
> +	u8 opcode =3D op->cmd.opcode;
> +	u32 ctl_val =3D 0;
> +	int ret =3D 0;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);

[Severity: High]
Is it intentional to ignore op->data.buswidth here as well? The DUAL_MODE_EN
bit is not applied for these writes.

> +
> +	if (op->data.nbytes > 0)
> +		ctl_val |=3D RW_DATAEN;
> +	if (op->addr.nbytes > 0)
> +		ctl_val |=3D ADDR_EN;
> +
> +	writel(ctl_val, host->regbase + SFC_CTL);
> +
> +	if (op->data.nbytes > 0) {
> +		const u8 *buf =3D op->data.buf.out;
> +		size_t i;
> +
> +		for (i =3D 0; i < op->data.nbytes; i++)
> +			writeb(buf[i], host->iobase + op->addr.val + i);
> +	} else {
> +		readb(host->iobase + op->addr.val);
> +	}
> +
> +	if (ret) {
> +		dev_err(host->dev, "opcode 0x%02x failed: %d\n", opcode, ret);
> +		return ret;
> +	}

[Severity: Low]
Is this error handling block dead code? The variable ret is initialized to 0
at the start of the function and is never modified before this check.

> +
> +	/*
> +	 * Hardware Workaround:
> +	 * The controller's auto-mode engine requires SFC_ADR_FOUR_BYTE_EN to be
> +	 * explicitly updated when the flash enters or exits 4-byte mode.
> +	 */
> +	if (opcode =3D=3D RTK_SPI_OP_EN4B) {
> +		host->is_4byte =3D true;
> +		writel(0x1, host->regbase + SFC_ADR_FOUR_BYTE_EN);
> +	} else if (opcode =3D=3D RTK_SPI_OP_EX4B) {

[Severity: High]
Does this strict reliance on stateful opcodes break stateless 4-byte
addressing?

The spi-nor framework often uses stateless 4-byte opcodes (like
SPINOR_OP_READ_1_1_1_4B) without explicitly sending an EN4B command. If
op->addr.nbytes =3D=3D 4 is not checked dynamically, the hardware will emit=
 only
3 bytes of address for those commands, potentially causing data corruption.

> +		host->is_4byte =3D false;
> +		writel(0x0, host->regbase + SFC_ADR_FOUR_BYTE_EN);
> +	}
> +
> +	return ret;
> +}
> +
> +static void rtk_spi_byte_transfer(struct rtk_spi_host *host, loff_t offs=
et,
> +				  size_t len, unsigned char *buf, bool is_read)
> +{
> +	if (is_read)
> +		memcpy_fromio(buf, host->iobase + offset, len);
> +	else
> +		memcpy_toio(host->iobase + offset, buf, len);
> +}

[Severity: High]
Does this function perform any bounds checking on the offset? If the flash
size exceeds the memory-mapped IO window provided by the dirmap resource,
adding offset directly to host->iobase could trigger a kernel page fault.

> +
> +static int rtk_spi_dma_transfer(struct rtk_spi_host *host, loff_t offset,
> +				size_t len, bool is_read)
> +{
> +	u64 dma_buffer, timeout_us =3D SFC_DMA_TIMEOUT * 100;
> +	u32 flash_phys_addr, val;
> +	int ret;
> +
> +	writel(DMA_W_EN_START | DMA_W_EN, host->mdbase + MD_FDMA_CTRL1);
> +
> +	dma_buffer =3D host->dma_buffer;
> +
> +	/* Setup MD DDR address and flash address */
> +	writel(lower_32_bits(dma_buffer), host->mdbase + MD_FDMA_DDR_SADDR);
> +	writel(upper_32_bits(dma_buffer) & DMA_HIGH_BITS_MASK,
> +	       host->mdbase + MD_FDMA_DDR_SADDR1);
> +
> +	/* MD_FDMA_FL_SADDR is a 32-bit hardware register */
> +	flash_phys_addr =3D lower_32_bits(host->flash_phys_base + offset);
> +	writel(flash_phys_addr, host->mdbase + MD_FDMA_FL_SADDR);

[Severity: High]
Similar to the byte transfer function, could this cause arbitrary physical
memory corruption if offset is larger than the dirmap resource? Without
bounds checks, the DMA engine might access unallocated physical memory.

[ ... ]

> +static int rtk_spi_probe(struct platform_device *pdev)
> +{

[ ... ]

> +err_pm_disable:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +
> +err_disable_clk:
> +	clk_disable_unprepare(host->clk);
> +
> +	return ret;
> +}

[Severity: Medium]
Does this error path leave the hardware permanently out of reset? The reset
line was deasserted earlier in probe, but reset_control_assert() is missing
here, leaking the hardware reset state.

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
> +	clk_disable_unprepare(host->clk);
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_set_suspended(dev);
> +}

[Severity: Medium]
Can pm_runtime_get_sync() fail here? If it returns an error, the clock might
remain disabled, but clk_disable_unprepare() is called anyway, which would
cause a clock count underflow.

Also, similar to the probe error path, is it necessary to assert the reset
line with reset_control_assert() before disabling the clock and exiting?

[ ... ]

> +static const struct dev_pm_ops rtk_spi_pm_ops =3D {
> +	RUNTIME_PM_OPS(rtk_spi_runtime_suspend, rtk_spi_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(rtk_spi_suspend, rtk_spi_resume)
> +};

[Severity: Low]
This isn't a bug, but the commit message explicitly states "Replace
RUNTIME_PM_OPS() + SYSTEM_SLEEP_PM_OPS() with DEFINE_RUNTIME_DEV_PM_OPS()",
yet these legacy macros are still used. They fail to wrap the callbacks in
__maybe_unused, which can cause compiler warnings when PM is disabled.

> +
> +static struct platform_driver rtk_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "rtk-spi-nor",
> +		.of_match_table =3D rtk_spi_dt_ids,
> +		.pm =3D pm_ptr(&rtk_spi_pm_ops),
> +	},
> +	.probe	=3D rtk_spi_probe,
> +	.remove	=3D rtk_spi_remove,
> +};
> +module_platform_driver(rtk_spi_driver);
> +
> +MODULE_DESCRIPTION("Realtek SPI Nor Controller Driver");
> +MODULE_AUTHOR("Jyan Chou <jyanchou@realtek.com>");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908111640.2032=
749-1-eleanor.lin@realtek.com?part=3D2
