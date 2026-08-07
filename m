Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3107944A418
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083533; cv=none; b=qw6MrnUM6yOvJhwD/jfgrz6x+0YdndCqd/zVEvx8BoRFIMcf9CHeKAorHpRaXziFlON6BZJ8C7mWTGnRNNzd43bHiCrHldcON+5HdbmIHaVjcbasnYVnCu9Dg/LLcweKpc4WmzuRYp5SJOrkUKt8YGMfgXBaZsY+2dzKnLuX/AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083533; c=relaxed/simple;
	bh=ZX8N1/w+WcB4w9cU8B6Ums1TvVeOb35Gmu3P0TB50mo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BNWodeAbSrbPoaYBquQp4fjJTEmEPEknuM4/q76J+0SKyKDjwXeuYxQ+Ia2lzdxXm9qLCNMdOposHo7VGsmPxqG5ZDG6o/cf/UZvGk+ixIdrWVHOom/fwp4ZXf0CXhJtH+1cZ0Ut9YTglgjHaw8S+6yXFOfTXqcnVWC/zhGTGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/WvdXj9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/WvdXj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698081F000E9;
	Fri,  7 Aug 2026 06:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786083531;
	bh=xXGfUKmcFG3m4DwHpewtpFqRuOiq5I0d4UEAUQJ31iY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k/WvdXj9L1nmu65nKa2SHZJ2ss2pGrXaPxMNVkKG36y1fzwS8LXHDb6cYtEcuH4fx
	 5H490TV/KhcnDmMbE2d9t4ihxZW9R5rdCB3jtoBdGTSMnNKU3I6ZP9P/Kd3q7EIYyD
	 eUOZQyJ+SJZadF5xnLtFlOrNao4qRzTBoP6KO1D1zTDc09HviItO3Lhj9b2pVI5O2w
	 8hsLWFqDXMSQNbm4F+22bwG8pHFMaYFWunELUmhMrHMQNjLDF+VORDIq5zPgUnCVZF
	 eN8QiELBugrc1Tqs2+8JPs9z2t2ULbvvFHH7Jc9sjsuroqaOqbBNyL5Sk9bW20MJ0S
	 AnHnDj0KHQn+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807060400.2047517-3-zychennvt@gmail.com>
References: <20260807060400.2047517-1-zychennvt@gmail.com>
 <20260807060400.2047517-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 06:18:50 +0000
Message-Id: <20260807061851.698081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Unhandled `MA35_BUS_RELEASED` status causes spurious errors and ra=
ndomly aborts ongoing I2C transfers.
- [High] Missing NULL checks for `i2c->target` and race conditions during t=
arget unregistration lead to a NULL pointer dereference in the ISR.
- [High] Unprotected initialization of shared transfer state in `ma35d1_i2c=
_doxfer` races with asynchronous I2C interrupts.
- [Medium] Missing `pm_runtime_mark_last_busy()` defeats the autosuspend de=
lay, causing immediate suspension.
- [Medium] Missing reset assertion on driver remove or probe error leaves t=
he hardware in a dirty state.
- [Medium] Unconditional `disable_irq_wake()` during resume causes a kernel=
 warning if `enable_irq_wake()` failed.
--

--- Patch [2]: [PATCH v9 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver su=
pport ---
commit a1da9304aab06d4fdb61f6ee5807d7913cc199b8
Author: Zi-Yu Chen <zychennvt@gmail.com>
Subject: i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

This commit adds I2C controller driver support for the Nuvoton MA35D1 SoC.
The driver provides both controller and target functionality across
standard, fast, and fast-plus modes.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
[ ... ]
> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +					     unsigned long i2c_status)
> +{
> +	unsigned char byte =3D 0;
> +
> +	switch (i2c_status) {
> +	case MA35_S_RECE_ARB_LOST:
[ ... ]
> +	case MA35_S_RECE_ADDR_ACK:
> +		/* Own SLA+W has been receive; ACK has been return */
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);

[Severity: High]
Can this result in a NULL pointer dereference if a target interrupt is
pending during unregistration?

When ma35d1_unreg_target() calls synchronize_irq() and sets i2c->target
to NULL, pending interrupts in the irqchip might still fire immediately
after.=20

If that happens, i2c_slave_event() will dereference i2c->target without
a NULL check. Could a defensive check be added here, or could the teardown
synchronization be adjusted?

> +		break;
[ ... ]
> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_id;
> +	unsigned long status;
> +
> +	status =3D readl(i2c->regs + MA35_STATUS0);

[Severity: High]
Does this interrupt handler properly process the MA35_BUS_RELEASED (0xf8)
status code?

If a spurious interrupt occurs and the status is 0xf8, this falls through
to the default cases in the transaction handlers, which log an error and
call ma35d1_i2c_restore_idle().

This would unconditionally abort any active controller transfers via
ma35d1_i2c_stop(i2c, -EIO). Could this be addressed by explicitly checking
for 0xf8 and returning IRQ_NONE early?

> +
> +	if (status =3D=3D MA35_BUS_ERROR) {
[ ... ]
> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msg=
s,
> +			     int num)
> +{
> +	unsigned long timeout;
> +	unsigned int val;
> +	int ret, err;
> +
> +	i2c->msg =3D msgs;
> +	i2c->msg_num =3D num;
> +	i2c->msg_ptr =3D 0;
> +	i2c->msg_idx =3D 0;
> +	i2c->err =3D 0;

[Severity: High]
Could this lockless initialization race with asynchronous I2C interrupts?

These transfer state variables are set in process context without holding
i2c->lock or disabling interrupts. If a target mode event or spurious
interrupt fires concurrently, the ISR could execute
ma35d1_i2c_controller_complete() and clear the i2c->msg pointer.

When doxfer() then sends the START command, the controller might see a null
message pointer and incorrectly abort the transfer. Does this section need
lock protection?

> +
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);
[ ... ]
> +static int ma35d1_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msg=
s,
> +			   int num)
> +{
> +	struct ma35d1_i2c *i2c =3D i2c_get_adapdata(adap);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(i2c->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ma35d1_i2c_doxfer(i2c, msgs, num);
> +
> +	if (i2c->target)
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
> +	pm_runtime_put_autosuspend(i2c->dev);

[Severity: Medium]
Does this bypass the autosuspend delay?

Calling pm_runtime_put_autosuspend() without first updating the timestamp
via pm_runtime_mark_last_busy() will cause the PM core to evaluate based
on an outdated timestamp.

This could result in the device suspending immediately rather than waiting
for the 5000ms delay configured in the probe function.

> +
> +	return ret;
> +}
[ ... ]
> +static int ma35d1_i2c_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	/* Prepare for wake-up from I2C events if target mode is active */
> +	if (i2c->target) {
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_AA);
> +
> +		/* Setup wake-up control */
> +		writel(0x1, i2c->regs + MA35_WKCTL);
> +
> +		/* Clear pending wake-up flags */
> +		val =3D readl(i2c->regs + MA35_WKSTS);
> +		writel(val, i2c->regs + MA35_WKSTS);
> +
> +		enable_irq_wake(i2c->irq);
> +
> +		return 0;
> +	}
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int ma35d1_i2c_resume(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	if (i2c->target) {
> +		/* Disable wake-up */
> +		writel(0x0, i2c->regs + MA35_WKCTL);
> +
> +		/* Clear pending wake-up flags */
> +		val =3D readl(i2c->regs + MA35_WKSTS);
> +		writel(val, i2c->regs + MA35_WKSTS);
> +
> +		disable_irq_wake(i2c->irq);

[Severity: Medium]
Can this cause a kernel warning if enable_irq_wake() fails during suspend?

The return value of enable_irq_wake() is ignored in ma35d1_i2c_suspend().
If the irqchip does not support wakeup, the wake depth remains zero.

Unconditionally calling disable_irq_wake() here will then trigger an
"Unbalanced IRQ wake disable" warning. Should the driver record whether
enabling wake succeeded before disabling it?

> +		return 0;
> +	}
[ ... ]
> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	i2c->rst =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
> +				     "failed to get reset control\n");
> +
> +	ret =3D reset_control_deassert(i2c->rst);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to deassert reset line\n");

[Severity: Medium]
Is a cleanup action required to assert the reset line?

The reset line is deasserted during initialization, but there appears to be
no corresponding reset_control_assert() on the error path or driver
unbind.

If the module is unloaded and reloaded, the hardware could remain in a
dirty state from the previous session, potentially causing unexpected
behavior like spurious interrupts. Could a devm action be added to handle
re-asserting the reset line?

> +
> +	/* Setup info block for the I2C core */
> +	strscpy(i2c->adap.name, "ma35d1-i2c", sizeof(i2c->adap.name));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807060400.2047=
517-1-zychennvt@gmail.com?part=3D2
