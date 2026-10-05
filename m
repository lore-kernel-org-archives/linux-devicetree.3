Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4224CC62E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219498; cv=none; b=e7dUhO7xaMsWwWYQM/ILwgjAvQ7N/I5uQ7GnS/GEXIOQavB2TVgWVLemzpMzHWbR/W0GgJCg4qmZfi6nHqZXubTaJAV8a1/xOgJkBZlevh03P19q4vus35ZbC8nT96gR78MVsaCv4JyeTOWf4EzUtge/16eT3joS2CjFYoCLTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219498; c=relaxed/simple;
	bh=eEqaaRfvkrXM7HehbYAtgPM/ffQnqXJVyFDO3XfhB4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=furbtGGJfxFH/9LwXfgNhQB8ATrTnxsUvBY6f1zcA8nXIItCtk5fxEsKc9szi2CeGWO4FeNTGYmgPySUz4ORLzxZ9UVchah1OQZhr/gspXbGeqsLqlLSQuMx15FB6uL4R0KiOmXmUQ4Y4N4UBF5YFw/XT3jVwhLA9g733kHmoJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=coO6fECu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="coO6fECu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481431F000FF;
	Mon,  5 Oct 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219495;
	bh=4ytOzo/U1kKhzLPUY1gqsgZqkcCE+QHox6ceyv9/VdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=coO6fECu7+ZQ5b+AQDDPQtaxSPtTtfurnvC8zyKhsa78OLWPfS69Me0/JpdzJInBG
	 oaTNxticNZ/SmcSb68TiV/LoxPXwXeHTJ65Q4EmHPg2cWDQAzfo09yq4Y9/R9/O8YW
	 H93we5L3H5HKQGYGNh/LH5dsm12dav/AkWS8NudjJNiqJ/BC+g+HxPhFQPVyMoZGTp
	 zHty30HHCGhykdnyhkKO4QdJjOZaGXeZDyrxO2b8bNeYIbhn+wwf2BGGEJjUTyXFDT
	 LZXdCfDM4GEQhMiZeXTfXXJh8yNlCFbBPwgU+IHnnBzQpB3pUiLdhQW6+MBdj786Iq
	 gDgAxkOPVtsYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261005-i2c-qcom-slave-v5-2-6254cc7c08d3@oss.qualcomm.com>
References: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
 <20261005-i2c-qcom-slave-v5-2-6254cc7c08d3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 16:58:14 +0000
Message-Id: <20261005165815.481431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] i2c: incorrect IRQ handling order on repeated start
- [High] i2c: infinite hardirq storm during unreg_target
- [Medium] i2c: missing WRITE_NACK state update on backend NACK
- [Medium] i2c: unbalanced disable_irq() on resume error path
--

commit 29b70e5539395d79b43b6b6c3ed75d84c373f1f3
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

i2c: qcom-target: Add driver for Qualcomm I2C target controller

QDU1000 and related Qualcomm SoCs include a dedicated I2C target controller
that operates exclusively in target mode. This commit adds a driver to
register the controller with the Linux I2C slave framework and handles IRQ
events, clock stretching, and error recovery.

> diff --git a/drivers/i2c/busses/i2c-qcom-target.c b/drivers/i2c/busses/i2=
c-qcom-target.c
> new file mode 100644
> index 0000000000000..c72fca068f5e1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-target.c
> @@ -0,0 +1,638 @@

[ ... ]

> +static void qcom_i2c_target_handle_rx_data(struct qcom_i2c_target *targe=
t,
> +					   u32 rx_irq_bits)
> +{
> +	int ret;
> +
> +	dev_dbg(target->dev, "Rx data event (rx_irq_bits=3D0x%x)\n", rx_irq_bit=
s);
> +	ret =3D qcom_i2c_target_write_requested(target);
> +	if (ret || test_bit(WRITE_NACK, &target->status)) {
> +		dev_dbg(target->dev, "Backend requested NACK\n");
> +		writel(NACK | CLEAR_RX_FIFO, target->base + I2C_S_CONTROL);
> +		writel(rx_irq_bits, target->base + I2C_S_IRQ_CLR);
> +		return;
> +	}
> +
> +	ret =3D qcom_i2c_target_drain_rx_fifo(target);
> +	if (ret)
> +		dev_dbg(target->dev, "Backend requested NACK\n");

[Severity: Medium]
Will this lead to extra data bytes from the RX FIFO being improperly fed to
the backend after it has already returned an error (NACK)?

If the backend returns a non-zero value during I2C_SLAVE_WRITE_RECEIVED,
qcom_i2c_target_handle_rx_data() correctly commands a NACK and clears the
hardware FIFO, but fails to set the WRITE_NACK bit in target->status.

Then, when the STOP event arrives, qcom_i2c_target_handle_stop() incorrectly
evaluates !test_bit(WRITE_NACK, &target->status) as true and attempts to
drain the RX FIFO again.

> +
> +	writel(ret ? NACK | CLEAR_RX_FIFO : ACK_RESUME,
> +	       target->base + I2C_S_CONTROL);
> +	writel(rx_irq_bits, target->base + I2C_S_IRQ_CLR);
> +}

[ ... ]

> +static irqreturn_t qcom_i2c_target_irq(int irq, void *dev)
> +{

[ ... ]

> +	/*
> +	 * Load target->target once. Both reg_target() and unreg_target() disab=
le
> +	 * the IRQ before writing the pointer, so it cannot change while this
> +	 * handler runs. Sub-handlers may dereference target->target directly.
> +	 *
> +	 * The core is enabled only in reg_target() and disabled in unreg_targe=
t(),
> +	 * so no bus activity is expected here. Clear and discard any stale IRQ.
> +	 */
> +	if (!READ_ONCE(target->target)) {
> +		writel(irq_stat, target->base + I2C_S_IRQ_CLR);
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
Could this result in an infinite interrupt storm that locks up the CPU?

When target->target is set to NULL in qcom_i2c_target_unreg_target(), the
hardware interrupt is left enabled because I2C_S_IRQ_EN is not cleared.

If a level-triggered interrupt condition like RX_DATA_AVAIL or RX_FIFO_FULL
is active, this early-exit check clears the IRQ status register but does not
drain the FIFO or disable the hardware interrupt enable. The hardware will
immediately re-assert the interrupt, causing a continuous loop.

> +
> +	if (irq_stat & (BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT)))
> +		return qcom_i2c_target_handle_error(target, irq_stat);
> +
> +	if (irq_stat & BIT(STOP_DETECTED))
> +		return qcom_i2c_target_handle_stop(target, irq_stat);
> +
> +	if (irq_stat & BIT(RESTART_DETECTED)) {
> +		dev_dbg(target->dev, "Repeated start bit detected\n");
> +		target->status =3D 0;

[Severity: High]
Does this wipe the state too early, before the old RX data is processed?

In qcom_i2c_target_irq(), RESTART_DETECTED is checked and processed before
rx_bits. If a repeated start and write-phase RX data are co-asserted in
the same irq_stat snapshot, the state is wiped here before the trailing RX
data is drained.

The subsequent drain incorrectly treats the old data as part of the new
phase, and the backend receives I2C_SLAVE_WRITE_REQUESTED followed by
old data from the previous phase, which scrambles the I2C backend state
machine.

> +		/*
> +		 * Keep clock stretch asserted when STRCH_RD is co-asserted so
> +		 * qcom_i2c_target_handle_strch_rd() can fill TX FIFO first.
> +		 */
> +		if (!(irq_stat & BIT(STRCH_RD)))
> +			writel(ACK_RESUME, target->base + I2C_S_CONTROL);
> +		writel(BIT(RESTART_DETECTED), target->base + I2C_S_IRQ_CLR);
> +	}

[ ... ]

> +static int __maybe_unused qcom_i2c_target_resume(struct device *dev)
> +{

[ ... ]

> +err_disable_ahb:
> +	clk_disable_unprepare(target->ahb_clk);
> +err_disable_xo:
> +	clk_disable_unprepare(target->xo_clk);
> +
> +	return ret;
> +}

[Severity: Medium]
Are we missing a call to re-enable the IRQ on this error path?

The suspend callback disables the IRQ, but this error path in resume returns
without re-enabling it. This leaves the IRQ permanently disabled and the
IRQ descriptor's depth counter unbalanced, which can trigger a WARN trace in
the core IRQ subsystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-i2c-qcom-s=
lave-v5-0-6254cc7c08d3@oss.qualcomm.com?part=3D2
