Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD81427F84
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785834709; cv=none; b=YMfRlKT15IiShS+PF0balH8cgHQKnZk2K9+P6z3D1keYw/iM6DMDw+FGEnwMrCRyIflzE3WnKKKEuAHg2LlZLvHFdDBiggQvZAAbh8OyTgH7vz+Cpio2qc/ADo9DHf/ImEdC+323O1oit3/IFWinYL2yk2G4elFPi19RMXJZ4jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785834709; c=relaxed/simple;
	bh=dupXCW8junvFWUWhoiy6wZYLlhdLPHv5vgWN2JRAvaA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h81JKpdxib9agknKFLKERo2ggww4y6CcAbfRndim9oVtfzLO0RNhECFZnj+T0weItq6GjV4TigQsROdI8aHbJd7s5C+mlPUiE3SWDm14ETxKetJ4/jSja60BNH68lx03pultV8LMYg+2zaaAwoRElTx91eGA+a7D7sB5kRMMzeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDpM+G5G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDpM+G5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4791F00A3A;
	Tue,  4 Aug 2026 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785834707;
	bh=rD5+xz+4vuZ2s9fUftzE0arH49XCLr5o/UDtFsJBJDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDpM+G5G3DduPr0DzxbiEigkPoC6Buocu9qeeU5LHF6LUdPQhAOFS/9fJsTrxKjeK
	 P8zfp39BIuLTuc5Fzo+OE+03tUjdOsXZ0LIeeLFzjgFH/ZgQpNWGsp74R7elxDl+hp
	 b8/C15rBWue5FTSILwys528xIrkRxE+Lvw/hSk1UlPbWqyh+m66l2w0kItlDtwhvFE
	 YobIXUydey8y6qO37U4YhE7jCrIemcxqw5aoYNHenRVMRqhk3TDVJGZrt1dkL8estU
	 wn+tCI6dL8b6djdO61LKkV/wvjYG2Eoi7w10998W996q9nQ32o9IsXrAPx0ZrafXNk
	 36ZbW3ovktfIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804084806.1846570-3-zychennvt@gmail.com>
References: <20260804084806.1846570-1-zychennvt@gmail.com>
 <20260804084806.1846570-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 09:11:47 +0000
Message-Id: <20260804091147.AD4791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Missing hardware reset deassertion in probe leaves I2C controller =
non-functional
- [High] Uninitialized stack variable `byte` is leaked to the I2C bus in ta=
rget mode
- [High] Unconditional dereference of `i2c->target` causes kernel panic in =
target interrupt handler
- [High] Race condition in `ma35d1_i2c_write_ctl` swallows pending target i=
nterrupts and corrupts bus state
- [Low] Swapped inline documentation comments for arbitration lost statuses
--

--- Patch [2]: [PATCH v8 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver su=
pport ---
commit 6daea0deaf0ce019dd9ceedda9e214429b4994a4
Author: Zi-Yu Chen <zychennvt@gmail.com>
Subject: i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

This commit adds I2C support for the Nuvoton MA35D1 SoC. The controller
supports standard, fast, and fast-plus modes, providing both controller
and target functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..645fd7171104d
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
[ ... ]
> +static void ma35d1_i2c_write_ctl(struct ma35d1_i2c *i2c, unsigned int ct=
l)
> +{
> +	unsigned int val;
> +
> +	guard(spinlock_irqsave)(&i2c->lock);
> +	val =3D readl(i2c->regs + MA35_CTL0);
> +	val &=3D ~(MA35_CTL_STA_SI_AA | MA35_CTL_STO);
> +	val |=3D ctl;
> +	writel(val, i2c->regs + MA35_CTL0);
> +}

[Severity: High]
Does this read-modify-write risk dropping the AA bit or clearing a pending
target interrupt? When a master transfer is started via
ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA_SI) called from ma35d1_i2c_doxfer(),=
 it
omits the MA35_CTL_AA flag. If a target interrupt is pending (SI=3D1), writ=
ing a
1 to SI clears the flag without processing the interrupt, potentially abort=
ing
target transactions and breaking bus state.

[ ... ]
> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +					     unsigned long i2c_status)
> +{
> +	unsigned char byte;

[Severity: High]
Can this function be reached when i2c->target is NULL?=20

If a master transfer encounters an arbitration loss (such as
MA35_S_RECE_ARB_LOST or MA35_ADDR_TRAN_ARB_LOST), the hardware drops into
target mode and triggers this interrupt. If no target backend is currently
registered, passing a NULL i2c->target to i2c_slave_event() further down
will cause a kernel panic.

> +
> +	switch (i2c_status) {
> +	case MA35_S_RECE_ARB_LOST:
> +		/*
> +		 * Arbitration lost during address transmission phase.
> +		 * The hardware switches to Target Transmitter mode when
> +		 * our own SLA+R is detected on the bus.
> +		 */

[Severity: Low]
Are the inline comments for MA35_S_RECE_ARB_LOST and MA35_ADDR_TRAN_ARB_LOST
swapped? This comment mentions Target Transmitter (SLA+R), but the code bel=
ow
triggers I2C_SLAVE_WRITE_REQUESTED which corresponds to Target Receiver
(SLA+W).

> +		i2c->err =3D -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);
> +		break;
[ ... ]
> +	case MA35_ADDR_TRAN_ARB_LOST:
> +		/*
> +		 * Arbitration lost during address transmission phase.
> +		 * The hardware switches to Target Receiver mode when
> +		 * our own SLA+W is detected on the bus.
> +		 */
> +		i2c->err =3D -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_READ_REQUESTED, &byte);
> +		writel(byte, i2c->regs + MA35_DAT);

[Severity: High]
Could this write uninitialized stack memory to the I2C data bus?=20

The local variable byte is passed to i2c_slave_event(). If the slave backend
returns an error or fails to populate the value, byte remains uninitialized,
and writel() will leak kernel stack data onto the physical bus.

[ ... ]
> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	i2c->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(i2c->regs))
> +		return PTR_ERR(i2c->regs);
> +
> +	i2c->rst =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c->rst),
> +				     "failed to get reset control\n");
> +
> +	/* Setup info block for the I2C core */

[Severity: High]
Is there a missing reset_control_deassert(i2c->rst) here?=20

The probe function acquires the reset control exclusively, but never seems
to deassert it before initialization. If the bootloader leaves the hardware
in an asserted reset state, will the controller remain non-functional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804084806.1846=
570-1-zychennvt@gmail.com?part=3D2
