Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FCE390C85
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785677373; cv=none; b=vBdmtfcNcfR/QVkSWeo2ZfDMdBJUjkQ+i1OywPjn91w/5WJ0PzJPJdbZeO5XOi0H/6By5A+w6Ez3GPxueVZU7jZ8m0qrt3Yxap7HYlj7IDlzCuhx0xjWbKz/wREwChbNZNoo+bgOc80pHOJJU0y4QUeX4cn7pRvCx+VJRHQSZtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785677373; c=relaxed/simple;
	bh=Vx6atyePmZhMD1xDeyHVfZSIxO38yC1YPLdTK3pm0EA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vEHzYxaBM0mE8AIvQKtQr//xd5R23bKJbs6Ed3O2j2oY6s8/WvEQnid2x2KCTICYFDKPFH1bV3s9SArjxoWoAIoawjGdyyibgYW9j9fL4SCS02nW2yWbmA06vYyxox1p5/ViE323fDZn1VkX1bhX+c/Hsgm1QdGqEVRThZqZuew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaTbG89W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaTbG89W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF451F000E9;
	Sun,  2 Aug 2026 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785677371;
	bh=784rCKxpdxhrxSIZpjsZoTsyJ0Ilh27xaqbgcAl22R8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kaTbG89Wv5M+6l8yJRpETxx0U6Mc8BW5CagK7dP502hydfsFI1eFAu70i+i9/5g8X
	 oelUpalBm5OzsgevXzR0Z71zQ9y8M+HWLTw0FBPkuDS2ni8z8han3PZxigvT4y9SHg
	 ttw4ZqZovV88oCVma7cmc6zECYoUDkmNFQUI0vx3uBTNPuWmpW/qRPb2SS5MK8Y9ET
	 OdN/Lp+Wg38/zP0Cg7PCaCTaTJkrExQWIy+9SyM5K4d2RC2lpz/uEZYBlgR7YCIFBN
	 LGvaL+Jodz0IG0Tx9iYhcHQ79nV52WYfhvNkjKuwuzNWurobT20n+LKkFW/w+YO6tr
	 S0FYxZ03qMtmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i2c: qcom-target: Add driver for Qualcomm I2C
 target controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Viken Dadhaniya" <viken.dadhaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260802-i2c-qcom-slave-v2-2-27653118fa75@oss.qualcomm.com>
References: <20260802-i2c-qcom-slave-v2-0-27653118fa75@oss.qualcomm.com>
 <20260802-i2c-qcom-slave-v2-2-27653118fa75@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 13:29:30 +0000
Message-Id: <20260802132931.4DF451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Enabling the I2C target core without a registered slave client exp=
oses the system to unrecoverable I2C bus lockups and interrupt storms.
- [High] Unbalanced disable_irq() in the remove function hangs the I2C bus =
and causes kernel warnings.
- [Medium] Incorrect IRQ dispatch order causes RESTART_DETECTED to wipe sta=
te after data phases are processed, corrupting the I2C slave state machine.
- [Medium] Failure to clear `target->status` during PM suspend/resume corru=
pts the I2C slave event sequence on the next transaction.
- [Medium] Using devm_clk_get_enabled() causes a clock reference count unde=
rflow if resume() fails.
- [Medium] Writing configuration registers immediately after asserting SW_R=
ESET without a delay may cause the initialization to be ignored by the hard=
ware.
- [Low] Concurrent calls to `qcom_i2c_target_reg_slave` lack locking, poten=
tially causing silent overwrites of the slave pointer.
--

--- Patch [2]: [PATCH v2 2/2] i2c: qcom-target: Add driver for Qualcomm I2C=
 target controller ---
commit d082641ecccd906b168547525bb8607e63afab2a
Author: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

i2c: qcom-target: Add driver for Qualcomm I2C target controller

This patch introduces a new driver for the Qualcomm I2C target controller,
allowing compatible SoCs like the QDU1000 to operate in I2C slave mode.
It registers with the Linux I2C slave framework and handles interrupts for
RX FIFO, clock stretching, and state recovery.

> diff --git a/drivers/i2c/busses/i2c-qcom-target.c b/drivers/i2c/busses/i2=
c-qcom-target.c
> new file mode 100644
> index 0000000000000..79b0b9ff7b9bf
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-target.c
[ ... ]
> +static void qcom_i2c_target_hw_init(struct qcom_i2c_target *target)
> +{
> +	dev_dbg(target->dev, "HW init: resetting FIFOs, enabling IRQs and core\=
n");
> +	writel(CLEAR_TX_FIFO | CLEAR_RX_FIFO, target->base + I2C_S_CONTROL);
> +	writel(QCOM_I2C_TARGET_ALL_IRQ, target->base + I2C_S_IRQ_EN);
> +	writel(I2C_S_CORE_EN, target->base + I2C_S_CONFIG);

[Severity: High]
Could unconditionally enabling the I2C core here before a slave client
registers expose the bus to lockups? If an external master sends a General
Call to address 0x00, the hardware will ACK and stretch the clock.

> +}
> +
> +static void qcom_i2c_target_write_requested(struct qcom_i2c_target *targ=
et)
[ ... ]
> +static void qcom_i2c_target_hw_reset(struct qcom_i2c_target *target)
> +{
> +	/* Clear error bits before SW_RESET; the reset may not be instantaneous=
 */
> +	writel(BIT(ERR_CONDITION) | BIT(CLOCK_LOW_TIMEOUT),
> +	       target->base + I2C_S_IRQ_CLR);
> +	writel(SW_RESET, target->base + I2C_S_SW_RESET_REG);
> +	qcom_i2c_target_hw_init(target);

[Severity: Medium]
Since the comment notes the reset might not be instantaneous, is it safe to
write to the configuration registers immediately in qcom_i2c_target_hw_init=
()
without a delay? Could the hardware silently drop these writes while it is
actively processing the software reset?

> +	writel(target->slave->addr, target->base + I2C_S_DEVICE_ADDR);
> +}
[ ... ]
> +static irqreturn_t qcom_i2c_target_irq(int irq, void *dev)
> +{
> +	struct qcom_i2c_target *target =3D dev;
> +	u32 irq_stat, rx_bits;
[ ... ]
> +	/*
> +	 * Load target->slave once. Both reg_slave() and unreg_slave() disable
> +	 * the IRQ before writing the pointer, so it cannot change while this
> +	 * handler runs. Sub-handlers may dereference target->slave directly.
> +	 */
> +	if (!READ_ONCE(target->slave)) {
> +		writel(irq_stat, target->base + I2C_S_IRQ_CLR);
> +		return IRQ_HANDLED;

[Severity: High]
If the core was enabled during probe, but no slave is registered yet, could
this early return leave the bus permanently stretched?

Since this path clears the IRQ status but doesn't write to I2C_S_CONTROL to
issue an ACK_RESUME or NACK, a General Call will cause the hardware to hang
the bus waiting for a command.

> +	}
[ ... ]
> +	rx_bits =3D irq_stat & (BIT(RX_FIFO_FULL) | BIT(RX_DATA_AVAIL) |
> +			      BIT(STRCH_WR));
> +	if (rx_bits)
> +		qcom_i2c_target_handle_rx_data(target, rx_bits);
> +
> +	if (irq_stat & BIT(RESTART_DETECTED)) {
> +		dev_dbg(target->dev, "Repeated start bit detected\n");
> +		target->status =3D 0;

[Severity: Medium]
Does clearing the status here corrupt the slave state machine if a Repeated
Start and a data phase assert in the same interrupt read?

If irq_stat contains both STRCH_RD and RESTART_DETECTED, the earlier call to
qcom_i2c_target_handle_strch_rd() will set READ_IN_PROGRESS. Then this code
clears target->status, wiping out READ_IN_PROGRESS and causing subsequent
reads to mistakenly trigger new I2C_SLAVE_READ_REQUESTED events.

> +		writel(ACK_RESUME, target->base + I2C_S_CONTROL);
> +		writel(BIT(RESTART_DETECTED), target->base + I2C_S_IRQ_CLR);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_i2c_target_reg_slave(struct i2c_client *slave)
> +{
> +	struct qcom_i2c_target *target =3D i2c_get_adapdata(slave->adapter);
> +
> +	if (target->slave)
> +		return -EBUSY;

[Severity: Low]
Is there a lock missing here to prevent concurrent slave registrations? If =
two
threads concurrently check this, they might both see NULL and proceed, caus=
ing
the second one to silently overwrite target->slave.

> +
> +	if (slave->flags & I2C_CLIENT_TEN)
[ ... ]
> +static int qcom_i2c_target_unreg_slave(struct i2c_client *slave)
> +{
> +	struct qcom_i2c_target *target =3D i2c_get_adapdata(slave->adapter);
> +
> +	if (!target->slave)
> +		return -EINVAL;
> +	disable_irq(target->irq);
> +	WRITE_ONCE(target->slave, NULL);
> +	target->status =3D 0;
> +	writel(0, target->base + I2C_S_DEVICE_ADDR);

[Severity: High]
When unregistering the slave, this sets the device address back to 0 (Gener=
al
Call). Since the core remains enabled, doesn't this recreate the bus lockup
vulnerability described earlier where external masters sending a General Ca=
ll
will hang the bus because the IRQ handler no longer services the transactio=
n?

> +	enable_irq(target->irq);
> +
> +	return 0;
> +}
[ ... ]
> +static int qcom_i2c_target_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	target->xo_clk =3D devm_clk_get_enabled(dev, "xo");
> +	if (IS_ERR(target->xo_clk))
> +		return dev_err_probe(dev, PTR_ERR(target->xo_clk),
> +				     "failed to get and enable XO clock\n");
> +
> +	target->ahb_clk =3D devm_clk_get_enabled(dev, "ahb");

[Severity: Medium]
Because these clocks are requested using devm_clk_get_enabled(), devres will
automatically disable them when the driver unbinds.

[ ... ]
> +static void qcom_i2c_target_remove(struct platform_device *pdev)
> +{
> +	struct qcom_i2c_target *target =3D platform_get_drvdata(pdev);
> +
> +	disable_irq(target->irq);

[Severity: High]
Does this unbalanced disable_irq() lead to kernel warnings during devres
cleanup?

Also, since the IRQ is disabled before the core is shut down below, if a
transaction arrives right now, the hardware will stretch the clock and wait
for the IRQ handler. Because the IRQ is disabled, the handler never runs,
leading to an I2C bus hang.

> +	i2c_del_adapter(&target->adap);
> +	writel(0, target->base + I2C_S_CONFIG);
> +	icc_set_bw(target->icc_path, 0, 0);
> +}
[ ... ]
> +static int qcom_i2c_target_resume(struct device *dev)
> +{
> +	struct qcom_i2c_target *target =3D dev_get_drvdata(dev);
> +	int ret;
[ ... ]
> +	qcom_i2c_target_hw_init(target);
> +	if (target->slave)
> +		writel(target->slave->addr, target->base + I2C_S_DEVICE_ADDR);
> +
> +	return 0;

[Severity: Medium]
Could the lack of clearing target->status here cause the I2C slave event
sequence to become desynchronized?

If a transaction was aborted by system suspend while READ_IN_PROGRESS or
WRITE_IN_PROGRESS were set, they will remain set upon resume. The next
transaction would then mistakenly skip sending the I2C_SLAVE_READ_REQUESTED
or I2C_SLAVE_WRITE_REQUESTED events.

> +
> +err_disable_xo:
> +	clk_disable_unprepare(target->xo_clk);
> +err_disable_ahb:
> +	clk_disable_unprepare(target->ahb_clk);
> +	return ret;
> +}

[Severity: Medium]
If qcom_i2c_target_resume() fails and takes this error path, it manually
disables the clocks. Since the clocks were registered via
devm_clk_get_enabled(), won't devres attempt to disable them again when the
driver unbinds, causing a clock reference count underflow?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-i2c-qcom-s=
lave-v2-0-27653118fa75@oss.qualcomm.com?part=3D2
