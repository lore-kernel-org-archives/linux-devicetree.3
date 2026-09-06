Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBAC2AD37
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 15:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788707405; cv=none; b=Py6YBs+7QCBkqpl2RlzJeZ1k5UfiKi1sLEAVio1TspPWWsPRFPTGVZlZoBjO9gdq5wJRCZ1D6ce5B4kkAqfAGH/bYMf0tLBZo1hDSCa7IaziS59VfTEk++42IwJilDP6R4AcEbzhmhvuXTelXXRfvsb/hr6UuIW15KgOo97UiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788707405; c=relaxed/simple;
	bh=t2rRtRuLjNuhQFmZy3rmgR1MIu6KMX2t59NF43wzr0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b42/w9SGPL3z7Nxee0ZpQhsiO2bXBQad6K9VYE/oqG3op+OTle2WMEtKVLzicRi4N3drU/adjhtq5dLNGJPKuaRwGPETE3cMoTIn+jGkEtGb3qUdXyZl38+qKO/AzARPDL/CbzcKhN/bev979Ei4C9eD61xd0x5L+c7ckROf0yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OiJXVu6r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OiJXVu6r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE1D1F00A3A;
	Sun,  6 Sep 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788707396;
	bh=kAKpnUbKQ3ehEoVaz1U7+eJuNVB3vq6jmOoNBsfw2OY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OiJXVu6rLV3Dg+Yev1fcC+6n1And5D537TBzPs1+HDic7dmQyJ7oLndiEl7wXFy6q
	 Q5EA2hV70JIHXhcEwoUsCmvfwf1I+8aq77rRKq8lzzplmYlpNnDxrlZ1744uGmEbis
	 tyeEXQmOLj1UKqrvk1oqdlFAMJ0Kn8d7QdIKZfzf9Ovo+6eHNkxdVXC9sYuNqybGzF
	 kpOrRCEag1CwQxg+fdfWBvawHemOMlRqthnnC+K2IfNWQ+3EaTNxYh8S03mWhMIVpd
	 QrSUIJAxv3X2QUfd72Ojr8UgWzhzo3RTxzbqv40x1FysZSeiseICUlbe5pjMYR+4Xt
	 4W6TK9zYljnbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] spi: spi-mem: Add Realtek SPI flash controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906145755.1230079-3-eleanor.lin@realtek.com>
References: <20260906145755.1230079-1-eleanor.lin@realtek.com>
 <20260906145755.1230079-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 15:09:55 +0000
Message-Id: <20260906150956.1EE1D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] The driver fails to configure the hardware's address length dy=
namically based on the requested `op->addr.nbytes`, relying instead on snoo=
ping `EN4B` opcodes, which breaks stateless 4-byte addressing.
- [Critical] The controller's 4-byte addressing mode configuration (SFC_ADR=
_FOUR_BYTE_EN) is lost across runtime suspends, leading to address truncati=
on and data corruption.
- [High] Multi-byte writes and reads via `exec_op` are fragmented into inde=
pendent 1-byte SPI transactions due to a byte-wise I/O loop, breaking regis=
ter accesses and fallback operations.
- [High] The driver intercepts SPI commands and enforces a fixed ~4-second =
timeout by internally polling the flash WIP bit using a hardcoded RDSR comm=
and, breaking long-running operations.
- [High] The driver advertises support for Dual I/O operations for all comm=
ands but fails to configure the Dual mode hardware bit for writes and `exec=
_op` reads.
- [High] The driver lacks bounds checking against the `dirmap` memory resou=
rce size, allowing out-of-bounds physical memory accesses.
- [Medium] Unbalanced clk_disable_unprepare() if pm_runtime_get_sync() fail=
s during device removal.
--

commit 76380ef4b88916eb9469e84777c4aa38898c403e
Author: Jyan Chou <jyanchou@realtek.com>

spi: spi-mem: Add Realtek SPI flash controller driver

This commit adds a spi-mem driver for the Realtek SPI Flash Controller
found on DHC SoCs. It implements single and dual I/O transfers with support
for hardware-accelerated dirmap reads and writes.

> diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
> new file mode 100644
> index 0000000000000..0206ea99f3c95
> --- /dev/null
> +++ b/drivers/spi/spi-rtk-nor.c
[ ... ]
> +static int rtk_spi_read_status(struct rtk_spi_host *host)
> +{
> +	int timeout =3D SFC_DMA_TIMEOUT;
> +	u8 status;
> +
> +	while (timeout--) {
> +		writel(RTK_SPI_OP_RDSR, host->regbase + SFC_OPCODE);
> +		writel(RW_DATAEN, host->regbase + SFC_CTL);
> +
> +		status =3D readb(host->iobase);
> +		if (!(status & SFC_SR_WIP))
> +			return 0;
> +
> +		usleep_range(100, 200);
> +	}

[Severity: High]
Does this hardcoded loop enforce a fixed timeout of around 4 seconds=20
(20,000 iterations of ~200us) for all polled operations?=20

Long-running flash operations like Chip Erase might prematurely abort from=
=20
the kernel's perspective even if the hardware continues working. Furthermor=
e,
if a command like Deep Power Down is issued, the flash might stop responding
to RDSR, causing this loop to constantly see 0xFF and eventually time out.

> +
> +	dev_err(host->dev, "Timeout waiting for Flash ready\n");
> +
> +	return -ETIMEDOUT;
> +}
[ ... ]
> +static void rtk_spi_read_mode(struct rtk_spi_host *host, const struct sp=
i_mem_op *op)
> +{
> +	u32 opcode =3D op->cmd.opcode;
> +	u32 dummy_cycles, val;
> +
> +	if (op->data.buswidth =3D=3D 2)
> +		opcode |=3D DUAL_MODE_EN;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);
> +
> +	val =3D readl(host->regbase + SFC_CTL);
> +	val |=3D RW_DATAEN | ADDR_EN;

[Severity: Critical]
Will this instruct the hardware to send an address without ever specifying
its length based on op->addr.nbytes?=20

If the spi-nor core issues stateless 4-byte opcodes (where
op->addr.nbytes =3D=3D 4) without a dedicated EN4B command, the hardware mi=
ght
only send 3 address bytes, causing data corruption for reading and writing
on flashes larger than 16MB.

> +
> +	dummy_cycles =3D rtk_spi_calc_dummy_cycles(op);
[ ... ]
> +static void rtk_spi_write_mode(struct rtk_spi_host *host,
> +			       const struct spi_mem_op *op)
> +{
> +	u32 opcode =3D op->cmd.opcode;
> +	u32 val;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);
> +
> +	val =3D readl(host->regbase + SFC_CTL);
> +	val |=3D RW_DATAEN | ADDR_EN;
> +	writel(val, host->regbase + SFC_CTL);

[Severity: High]
Is the DUAL_MODE_EN bit missing for write operations?=20

If the SPI subsystem determines dual mode is supported and issues a
dual-lane write, the flash will expect two lanes of data but the controller
will operate in single-lane mode, which could scramble the bits.

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
Similarly to the write mode setup, is the DUAL_MODE_EN bit also omitted here
when exec_op is used for fallback dual reads?

> +
> +	val =3D readl(host->regbase + SFC_CTL);
> +	val &=3D ~(SFC_CTL_DMYCNT_MASK | ADDR_EN);
> +	val |=3D RW_DATAEN;
> +
> +	if (op->addr.nbytes > 0)
> +		val |=3D ADDR_EN;
> +
> +	dummy_cycles =3D rtk_spi_calc_dummy_cycles(op);
> +	val |=3D (dummy_cycles << SFC_CTL_DMYCNT_SHIFT) & SFC_CTL_DMYCNT_MASK;
> +	writel(val, host->regbase + SFC_CTL);
> +
> +	memcpy_fromio(op->data.buf.in, host->iobase + offset, len);

[Severity: High]
Could this memory I/O read split restart address-less commands like RDID
multiple times since it triggers discrete read transactions?

Also, is there any bounds checking against the mapped dirmap resource size?
If offset (derived from op->addr.val) or len exceeds the physical memory
window mapped by devm_ioremap_resource(), it could lead to out-of-bounds
physical memory accesses, kernel panics, or Data Aborts.

> +
> +	return 0;
> +}
> +
> +static int rtk_spi_do_write_and_cmds(struct rtk_spi_host *host, const st=
ruct spi_mem_op *op)
> +{
> +	u8 opcode =3D op->cmd.opcode;
> +	u32 ctl_val =3D 0;
> +	int ret =3D 0;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);
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

[Severity: High]
Does this byte-wise loop fragment a contiguous write transfer into
independent 1-byte SPI transactions?=20

Each writeb to the mapped memory generates a discrete bus sequence (CS
assert -> command -> data -> CS deassert). Commands requiring multiple
contiguous data bytes, like WRSR or fallback Page Programs, could fail
or corrupt state.

Also, similar to rtk_spi_command_read(), this seems to write directly to
physical memory using an unbounded op->addr.val, which could exceed the
size of the mapped dirmap resource.

> +	} else if (op->addr.nbytes > 0) {
> +		readb(host->iobase + op->addr.val);
> +
> +		/* Wait for internal flash erase/programming to complete */
> +		ret =3D rtk_spi_read_status(host);
> +	} else {
> +		readb(host->iobase);
> +
> +		/*
> +		 * For pure commands that require internal state synchronization
> +		 * (such as Chip Erase), poll the flash status.
> +		 */
> +		ret =3D rtk_spi_read_status(host);

[Severity: High]
Does this intercept the spi-mem command completion and force the hardware
driver to synchronously poll the flash status internally?=20

This polling is usually intended for the spi-nor core, and combined with
the ~4-second timeout, could cause longer operations like Chip Erase to
abort prematurely.

> +	}
> +
> +	if (ret) {
> +		dev_err(host->dev, "opcode 0x%02x failed: %d\n", opcode, ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Hardware Workaround:
> +	 * The controller's auto-mode engine requires SFC_ADR_FOUR_BYTE_EN to be
> +	 * explicitly updated when the flash enters or exits 4-byte mode via co=
ntrol
> +	 * commands.
> +	 */
> +	if (opcode =3D=3D RTK_SPI_OP_EN4B)
> +		writel(0x1, host->regbase + SFC_ADR_FOUR_BYTE_EN);
> +	else if (opcode =3D=3D RTK_SPI_OP_EX4B)
> +		writel(0x0, host->regbase + SFC_ADR_FOUR_BYTE_EN);

[Severity: Critical]
Is it possible for the hardware to get permanently stuck in 3-byte address
mode if the spi-nor core uses stateless 4-byte opcodes instead of explicitly
issuing EN4B?=20

Additionally, this dynamic SFC_ADR_FOUR_BYTE_EN state appears to be lost
across runtime suspends because rtk_spi_runtime_resume() resets the hardware
and does not restore this setting. If the controller resumes and defaults
back to 3-byte mode while the flash chip is in 4-byte mode, subsequent
reads and writes could be globally corrupted.

> +
> +	return ret;
> +}
[ ... ]
> +static bool rtk_spi_supports_op(struct spi_mem *mem,
> +				const struct spi_mem_op *op)
> +{
> +	if (op->cmd.buswidth !=3D 1)
> +		return false;
> +
> +	if (op->cmd.dtr || op->addr.dtr || op->data.dtr)
> +		return false;
> +
> +	if (op->addr.nbytes !=3D 0) {
> +		if (op->addr.buswidth > 1)
> +			return false;
> +		if (op->addr.nbytes < 3 || op->addr.nbytes > 4)
> +			return false;
> +	}
> +
> +	if (op->dummy.nbytes !=3D 0) {
> +		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
> +			return false;
> +	}
> +
> +	if (op->data.nbytes !=3D 0 && op->data.buswidth > 2)
> +		return false;

[Severity: High]
Does this check allow 2-lane wide writes to proceed?=20

As noted in rtk_spi_write_mode(), the hardware is not configured with
DUAL_MODE_EN for writes, leading to a mismatch between what is advertised
here and what the controller actually does.

> +
> +	return spi_mem_default_supports_op(mem, op);
> +}
> +
> +static int rtk_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
> +{

[Severity: High]
Does this function fail to check if desc->info.length exceeds the hardware's
mapped memory window size?=20

Failing to reject oversized dirmap descriptions could result in out-of-boun=
ds
physical memory accesses later during transfers.

> +	const struct spi_mem_op *op =3D desc->info.op_tmpl;
> +
> +	if (op->data.dir =3D=3D SPI_MEM_DATA_IN && op->addr.nbytes !=3D 3 && op=
->addr.nbytes !=3D 4)
> +		return -EOPNOTSUPP;
[ ... ]
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

[Severity: Medium]
If pm_runtime_get_sync(dev) fails during module removal (for instance, when
the device is suspended and runtime resume encounters an error), the device
clock is not enabled.=20

Will this lead to an unbalanced clk_disable_unprepare() call and a clock
enable count underflow?

> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_set_suspended(dev);
> +}
[ ... ]
> +static int rtk_spi_runtime_resume(struct device *dev)
> +{
> +	struct spi_controller *ctlr =3D dev_get_drvdata(dev);
> +	struct rtk_spi_host *host =3D spi_controller_get_devdata(ctlr);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(host->clk);
> +	if (ret < 0) {
> +		dev_err(dev, "clk_prepare_enable failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	reset_control_assert(host->rstc);
> +	usleep_range(10, 20);
> +	reset_control_deassert(host->rstc);
> +
> +	rtk_spi_init(host);

[Severity: Critical]
When the hardware is reset and initialized upon resume, the dynamic=20
SFC_ADR_FOUR_BYTE_EN state is wiped.=20

Since rtk_spi_init() doesn't restore this state, could the controller revert
to 3-byte address mode while the flash chip remains in 4-byte mode, leading
to address truncation and data corruption?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906145755.1230=
079-1-eleanor.lin@realtek.com?part=3D2
