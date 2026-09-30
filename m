Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43AC351C11
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752291; cv=none; b=Rwy9WnGamonQXLGLoYsIqQsF3hzWro5M57SXL3YD0quT6NG67Tw8cqllXLizAZSjKG3BmQEPMIHYDYriqcj8FZ6eiAHR5HqjXgJlB/6s1N/jw18oa7awSGouM9dpVssPzD3oGXdvfsNWJfZ8ZOp9LAyrs4mjPxUj6/dsPMhljfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752291; c=relaxed/simple;
	bh=ezOQmWacUpvFo49a4bnPOVxUmAdmZcEBrG9IW15T5M8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gn0CI9kdIMtI3Kw8jfJidxsRJYmxBBW5btpNXWLcEJWKC5Fas8am5bUERuDhNUf4cxFa3qdjmqiqIdZpMOH10E1VyT05JIzAtnlRMxB1q77zE31DvxEVrg24T3f95BFZHGUHlP7TRCuUSfKuGO9VfDjrBkeM3ttQ3coHRqMDHZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSGzuO5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSGzuO5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529791F000FF;
	Wed, 30 Sep 2026 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790752285;
	bh=eFVXgUAvHvOP/zVcY0O1mg/1erMfChfzj8vOY7/hc7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cSGzuO5T4hOuuYQ76EF0fm0W7+83C4pRJ3mCdyY5AOhb9AKa9PajwSunSf8pDjzj+
	 l+W1JdVFcmHsJ0OVwTiMuL1N9m0TshMU2pku5cKAZdhUkmVZpm2fQ53Iaz8h++qeZ2
	 dKjzufz3kHoKJTEuDAvFMLhjsfI/d3tJQikOi8g+AsOFWwwzsRmiSgwWj4PDcCYhfT
	 rDlAab3H0u46WXI+sclscQ7ZyzpZJpQ96R/30DqUad/3iV+2muaqgJTw0jiYCCBlY1
	 zAjdeE/jgl0kwtZxfHoP+p6NDXFXey3Js3SYBokCZec130v13NFa5FNj+diiK4H2uY
	 RqQoCTW8MjXcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] spi: spi-mem: Add Realtek SPI NOR flash
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260930065945.88008-3-eleanor.lin@realtek.com>
References: <20260930065945.88008-1-eleanor.lin@realtek.com>
 <20260930065945.88008-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:11:25 +0000
Message-Id: <20260930071125.529791F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] spi: rtk-nor: missing error handling for pm_runtime_resume_and_get=
() in remove path
- [High] spi: rtk-nor: rtk_spi_supports_op() returns true for unsupported c=
ommands due to bool coercion
- [High] spi: rtk-nor: rtk_spi_do_write_and_cmds() silently truncates multi=
-byte writes
- [High] spi: rtk-nor: stateful 4-byte mode tracking breaks dirmap memory-m=
apped accesses
- [High] spi: rtk-nor: missing DUAL_MODE_EN for write operations and exec_o=
p reads causes data corruption
--

commit 3bdf61831cde1ea53f0bf3d584243f565bbd2cc7
Author: Jyan Chou <jyanchou@realtek.com>

spi: spi-mem: Add Realtek SPI NOR flash controller driver

Add a spi-mem driver for the SPI NOR Flash Controller (SFC) found on
Realtek DHC SoC. The controller supports single and dual I/O transfers
and offloads the payload to an integrated DMA engine.

> diff --git a/drivers/spi/spi-rtk-nor.c b/drivers/spi/spi-rtk-nor.c
> --- /dev/null
> +++ b/drivers/spi/spi-rtk-nor.c
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

[Severity: High]
If a stateless 3-byte command (like Read SFDP) is issued via
rtk_spi_exec_op() while the flash is in 4-byte mode, host->is_4byte is
set to false and the hardware register is updated.

If a subsequent dirmap read bypasses rtk_spi_exec_op() and calls
rtk_spi_read_mode() here, it appears the 4-byte enable register
(SFC_ADR_FOUR_BYTE_EN) is not updated from the dirmap template.

Could this cause the controller to send a 3-byte address for a 4-byte
dirmap operation, resulting in garbage data reads?

[ ... ]
> +static void rtk_spi_write_mode(struct rtk_spi_host *host,
> +			       const struct spi_mem_op *op)
> +{
> +	u32 opcode =3D op->cmd.opcode;
> +	u32 val;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);

[Severity: High]
rtk_spi_supports_op() accepts buswidth =3D=3D 2 for all data operations, and
rtk_spi_read_mode() above properly sets the DUAL_MODE_EN bit for dirmap
reads.

Is DUAL_MODE_EN missing here in rtk_spi_write_mode()?

If the SPI NOR core initiates a dual I/O Page Program, will the controller
execute it in standard 1-1-1 mode and potentially misconfigure the hardware?

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
Similarly, does this code also miss setting DUAL_MODE_EN for exec_op reads
when dual I/O is requested?

[ ... ]
> +static int rtk_spi_do_write_and_cmds(struct rtk_spi_host *host, const st=
ruct spi_mem_op *op)
> +{
> +	u8 opcode =3D op->cmd.opcode;
> +	u32 ctl_val =3D 0;
> +
> +	writel(opcode, host->regbase + SFC_OPCODE);
> +
> +	if (op->data.nbytes > 0)
> +		ctl_val |=3D RW_DATAEN;
> +
> +	if (op->addr.nbytes > 0)
> +		ctl_val |=3D ADDR_EN;
> +
> +	writel(ctl_val, host->regbase + SFC_CTL);
> +
> +	if (op->data.nbytes > 0) {
> +		const u8 *buf =3D op->data.buf.out;
> +
> +		if (op->addr.val + op->data.nbytes > host->dirmap_size)
> +			return -EINVAL;
> +
> +		writeb(*buf, host->iobase + op->addr.val);
> +	} else {

[Severity: High]
When exec_op is used for multi-byte writes (where op->data.nbytes > 1),
this executes a single writeb() without a loop and returns success.

Does this silently discard the rest of the payload in op->data.buf.out?
If the SPI NOR core falls back to exec_op for multi-byte register writes,
it appears only the first byte is written.

[ ... ]
> +static bool rtk_spi_supports_op(struct spi_mem *mem,
> +				const struct spi_mem_op *op)
> +{
[ ... ]
> +	/*
> +	 * The data window is access-triggered: each CPU access to host->iobase
> +	 * generates one complete SPI transaction. Consecutive byte accesses
> +	 * therefore cannot be merged into a single transaction, so
> +	 * multi-byte stateless commands are not supported by this controller.
> +	 */
> +	if (!op->addr.nbytes && op->data.nbytes > 1)
> +		return -EOPNOTSUPP;

[Severity: High]
Since rtk_spi_supports_op() returns a bool, won't returning -EOPNOTSUPP
evaluate to true?

Does this cause the driver to erroneously advertise support for multi-byte
stateless commands instead of rejecting them?

[ ... ]
> +static void rtk_spi_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctrl =3D platform_get_drvdata(pdev);
> +	struct rtk_spi_host *host =3D spi_controller_get_devdata(ctrl);
> +	struct device *dev =3D &pdev->dev;
> +
> +	spi_unregister_controller(ctrl);
> +
> +	if (pm_runtime_resume_and_get(dev) < 0)
> +		dev_warn(dev, "Failed to resume device during remove\n");
> +
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	reset_control_assert(host->rstc);
> +	clk_disable_unprepare(host->clk);
> +}

[Severity: High]
If pm_runtime_resume_and_get(dev) fails (returns < 0), it does not increment
the device's PM usage counter.

Since the execution unconditionally proceeds to call
pm_runtime_put_noidle(dev) and clk_disable_unprepare(host->clk), will
this result in a PM usage counter underflow (double put) and a clock
enable counter underflow?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930065945.8800=
8-1-eleanor.lin@realtek.com?part=3D2
