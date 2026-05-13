Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE482FE04E
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 18:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695866; cv=none; b=mAeLBYUr5WL5C9scYpSHU2Cu3NHie3dK4pVV6fQtlpGngrSf39kyqBnyDW4ZOeazdNfIzQQWA3q5JHU5slL7ydpG6fx3rNvW/9wV5VwN11vioTw+AziisormXqoVHHarSjiXWJ3TU6N0B5+9YjvxqyspQDKmkJrkK9epdKMNa0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695866; c=relaxed/simple;
	bh=WG3CR5mq+vAnzQ75ueLcBKKokDrZ3l9N+DMd1ZvcWck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ILqg3XuRr10jc7aynf/RU5D1UHrD1C4jsz2Ac1t9qrIbMkK5e5eae/ytpxXOJpS1wOHdpzikczkEzlHxEap4Wov7DriyM5+wq5WRLyb/tUXZdMgprhPVTbK/IKRKNiXd3rErTo0juaE+S3nOQ8NO85zodmqmpO5qy5f4DqZy8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CC6z6Bgm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CC6z6Bgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11585C19425;
	Wed, 13 May 2026 18:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695865;
	bh=WG3CR5mq+vAnzQ75ueLcBKKokDrZ3l9N+DMd1ZvcWck=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CC6z6Bgm82we4zkK0pTS2uNDtCA49asp2SIxhj1t9Eh8RvnMK3rRguuAuCtt1mJfD
	 w0KG+p6CqlGcOFcz17Jc+dzUBLFfj5S4kGxXrmXjhLcdpaYVXGGqqqFeznTqQUksDE
	 fq4+zOA07xsbV3iewS1gUOfEIUW1pgAoXh7bmtZiaaSKm29yNZEYa2J1sJBhPI3tGg
	 /RkFK3nuNhapzLK6InbY20OCKYWsOLQBb4tpgMCBCSpcyzzKHgKZRqn4twag3oNkKM
	 FPPG7kROTKFKEl/Q1NCOACR44RT4Mcxndwut4ItrfTqRpp6ys8aiZVdsxFgUe56Sm6
	 P4+Fv87MndkmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512073953.564323-3-zychennvt@gmail.com>
References: <20260512073953.564323-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 18:11:04 +0000
Message-Id: <20260513181105.11585C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Missing runtime PM checks in shared IRQ handler and missing synchr=
onize_irq()
- [High] Unsafe hardware accesses with disabled clock in system PM and targ=
et registration
- [High] Transfer timeouts lead to Use-After-Free and fail to reset hardware
- [High] Unhandled NACK with I2C_M_IGNORE_NAK causes infinite interrupt sto=
rm
- [High] Protocol violation and memory corruption on 0-length and 1-length =
read messages
- [High] Race conditions in target unregistration and hardware reset
- [Medium] Data NACK is incorrectly reported as a successful transfer
- [Medium] Unsigned integer comparison prevents probe error detection
- [Medium] Clock resource leak in probe error path
- [Medium] Hardware reset function fails to restore target address configur=
ation
- [Low] Incorrect Runtime PM error check in target unregistration
--

commit 900661bb640e824e1459adee8e6a1180f0ab5bca
Author: Zi-Yu Chen <zychennvt@gmail.com>

i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
   =20
This commit adds I2C support for the Nuvoton MA35D1 SoC. It provides
controller and target functionality, and supports standard, fast, and
fast-plus modes.

diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d=
1.c
new file mode 100644
index 0000000000000..c643f406e0008
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ma35d1.c
@@ -0,0 +1,792 @@
[ ... ]
> +static void ma35d1_i2c_reset(struct ma35d1_i2c *i2c)
> +{
> +	unsigned int tmp;
> +
> +	tmp =3D readl(i2c->regs + MA35_CLKDIV);
> +
> +	reset_control_assert(i2c->rst);
> +	usleep_range(10, 20);
> +	reset_control_deassert(i2c->rst);
> +
> +	writel(tmp, (i2c->regs + MA35_CLKDIV));
> +	ma35d1_i2c_write_CTL(i2c, MA35_CTL_I2CEN);
> +
> +	if (i2c->target)
> +		ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
> +}

Does this fully restore the target mode configuration?  The reset asserts t=
he
hardware reset, which wipes the controller state, but it does not rewrite t=
he
target address register MA35_ADDR0.

Could this leave the device with a cleared target address, breaking target
functionality until it is manually re-registered?

Also, could this sleep during an active interrupt?  If this reset is called
and the device uses a shared IRQ, could an interrupt fire during the
usleep_range() while the device is in reset?  Because the lock is not taken
here, the IRQ handler might read from MA35_STATUS0 and trigger a bus fault.

[ ... ]
> +static void i2c_ma35d1_irq_controller_trx(struct ma35d1_i2c *i2c,
> +					  unsigned long i2c_status)
> +{
> +	unsigned char byte;
> +
> +	switch (i2c_status) {
[ ... ]
> +	case MA35_M_TRAN_DATA_NACK:
> +		ma35d1_i2c_stop(i2c, 0);
> +		break;

Does passing 0 to ma35d1_i2c_stop() mask the error?  This increments
i2c->msg_idx and reports to the caller that the message was successfully
transferred, even though the target rejected the data byte.

Should this pass an error code like -EIO or -ENXIO instead?

> +
> +	case MA35_M_TRAN_ADDR_NACK:
> +	case MA35_M_RECE_ADDR_NACK:
> +		/* Controller Transmit Address NACK */
> +		/* 0x20: SLA+W has been transmitted and NACK has been received */
> +		/* 0x48: SLA+R has been transmitted and NACK has been received */
> +		if (!(i2c->msg->flags & I2C_M_IGNORE_NAK)) {
> +			dev_dbg(i2c->dev, "\n i2c: ack was not received\n");
> +			ma35d1_i2c_stop(i2c, -ENXIO);
> +		}
> +		break;

Could this cause an infinite interrupt loop?  If I2C_M_IGNORE_NAK is set,
the switch breaks without clearing the interrupt flag MA35_CTL_SI or
advancing the state machine.

When the IRQ handler returns, the same unacknowledged hardware interrupt
will fire again immediately, potentially freezing the CPU.

> +
> +	case MA35_M_RECE_ADDR_ACK:
> +		if (is_last_msg(i2c) && i2c->msg->len =3D=3D 0)
> +			ma35d1_i2c_stop(i2c, 0);
> +		else if (is_last_msg(i2c) && (i2c->msg->len =3D=3D 1))
> +			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI);
> +		else
> +			ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
> +		break;

Could this corrupt memory on 0-length read messages?  If a read message is
not the final message (!is_last_msg), it falls through to the else branch,
setting MA35_CTL_SI_AA to ACK an incoming byte.

For a 0-length message, this commands the hardware to receive a byte, which
triggers MA35_M_RECE_DATA_ACK.  The received byte will be written to
i2c->msg->buf[0], but the I2C core leaves buf as NULL for 0-length reads,
leading to a NULL pointer dereference.

Additionally, for a 1-length intermediate message, it would send an ACK
instead of a NACK for the final byte, holding SDA low and violating the I2C
protocol, which prevents a Repeated Start.

[ ... ]
> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_id;
> +	unsigned long status, flags;
> +
> +	status =3D readl(i2c->regs + MA35_STATUS0);

Is this hardware access safe when the device is runtime suspended?

The device requests the interrupt with IRQF_SHARED in probe.  If another
device on the same IRQ line triggers an interrupt while this I2C controller
is runtime suspended and its clock is gated, reading MA35_STATUS0 will cause
a bus fault.

Should this use pm_runtime_get_if_active() to verify the device is powered
before accessing registers?

[ ... ]
> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msg=
s,
> +			     int num)
> +{
[ ... ]
> +	timeout =3D wait_event_timeout(i2c->wait, i2c->msg_num =3D=3D 0, HZ * 5=
);
> +	ret =3D i2c->msg_idx;
> +
> +	if (timeout =3D=3D 0)
> +		dev_dbg(i2c->dev, "timeout\n");
> +	else if (ret !=3D num)
> +		dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
> +
> +	err =3D readl_poll_timeout(i2c->regs + MA35_CTL0, val,
> +				 !(val & MA35_CTL_STO), 100,
> +				 STOP_TIMEOUT_MS * 1000);
> +
> +	if (err) {
> +		dev_err(i2c->dev, "Bus stuck! Resetting controller...\n");
> +		ma35d1_i2c_reset(i2c);
> +	}
> +
> +	if (i2c->arblost) {
> +		dev_dbg(i2c->dev, "arb lost, stop\n");
> +		i2c->arblost =3D 0;
> +	}
> +
> +	return ret;
> +}

Could a timeout lead to a use-after-free regression?

If wait_event_timeout() expires, no STOP condition was ever commanded, so
the MA35_CTL_STO bit is likely already 0.  This causes readl_poll_timeout()
to succeed instantly.

Because err is 0, ma35d1_i2c_reset() is bypassed, leaving the controller
active and interrupts enabled.  The function returns without an error code
like -ETIMEDOUT, and the caller frees the msgs buffer.

If the hardware later completes the operation or asserts a delayed interrup=
t,
i2c_ma35d1_irq_controller_trx() will dereference the freed i2c->msg pointer.

[ ... ]
> +static int ma35d1_reg_target(struct i2c_client *target)
> +{
[ ... ]
> +	if (target->flags & I2C_CLIENT_TEN)
> +		return -EAFNOSUPPORT;
> +
> +	ma35d1_i2c_enable_irq(i2c);
> +
> +	ret =3D pm_runtime_resume_and_get(i2c->dev);

Can this access the controller while the clock is disabled?

ma35d1_i2c_enable_irq() writes to the MA35_CTL0 register.  By calling it
before pm_runtime_resume_and_get(), the register write happens while the
device may still be runtime suspended with its clock gated off, resulting
in a bus fault.

[ ... ]
> +static int ma35d1_unreg_target(struct i2c_client *target)
> +{
> +	struct ma35d1_i2c *i2c =3D i2c_get_adapdata(target->adapter);
> +	unsigned int val;
> +	int ret;
> +
> +	/* Disable I2C */
> +	val =3D readl(i2c->regs + MA35_CTL0);
> +	val &=3D ~MA35_CTL_I2CEN;
> +	writel(val, i2c->regs + MA35_CTL0);
> +
> +	/* Disable I2C interrupt */
> +	ma35d1_i2c_disable_irq(i2c);
> +
> +	i2c->target =3D NULL;

Could this race with an active target interrupt?  The i2c->target pointer
is set to NULL without acquiring i2c->lock.

If a target interrupt is firing concurrently, i2c_slave_event() could
dereference the NULL pointer.

> +
> +	ret =3D pm_runtime_put_sync(i2c->dev);
> +	if (ret)
> +		dev_err(i2c->dev, "failed to suspend i2c controller");

Does this incorrectly treat a successful put as an error?

According to PM subsystem rules, pm_runtime_put_sync() returns 1 when the
device is already suspended.  This is a success case, but checking if (ret)
will spuriously log an error.  Should this be if (ret < 0)?

[ ... ]
> +struct ma35d1_i2c {
> +	spinlock_t lock; /* Protects I2C register access and state */
[ ... ]
> +	unsigned int msg_ptr;
> +	unsigned int irq;
[ ... ]
> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	i2c->irq =3D platform_get_irq(pdev, 0);
> +	if (i2c->irq < 0)
> +		return dev_err_probe(dev, i2c->irq, "failed to get irq\n");

Does this successfully detect probe errors?  Since i2c->irq is declared
as an unsigned int, the check if (i2c->irq < 0) will always be false.

A negative error code from platform_get_irq() would be cast to a positive
unsigned value, masking the failure here and deferring it until
devm_request_irq() fails later.

[ ... ]
> +rpm_put:
> +	pm_runtime_put_noidle(dev);
> +	return ret;
> +}

Does this leave the clock permanently enabled on probe failure?

Because pm_runtime_resume_and_get() was called earlier, using
pm_runtime_put_noidle() drops the usage count without allowing the device
to enter the runtime suspended state.  When devres cleans up the PM runtime
context, the peripheral clock will remain enabled.

[ ... ]
> +static int ma35d1_i2c_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	spin_lock_irq(&i2c->lock);
> +
> +	/* Prepare for wake-up from I2C events if target mode is active */
> +	if (i2c->target) {
> +		val =3D readl(i2c->regs + MA35_CTL0);
> +		val |=3D (MA35_CTL_SI | MA35_CTL_AA);
> +		writel(val, i2c->regs + MA35_CTL0);
> +		ma35d1_i2c_enable_irq(i2c);
> +	}
> +
> +	spin_unlock_irq(&i2c->lock);
> +
> +	/* Setup wake-up control */
> +	writel(0x1, i2c->regs + MA35_WKCTL);

Are these register accesses safe if the device is already runtime suspended?

The ma35d1_i2c_suspend() and ma35d1_i2c_resume() functions unconditionally
access the wakeup registers (MA35_WKCTL, MA35_WKSTS).  If the device was
already runtime suspended before system sleep, its clock is gated off,
and these register accesses will cause a synchronous bus fault.

[ ... ]
> +static int ma35d1_i2c_runtime_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	/* Disable I2C controller */
> +	val =3D readl(i2c->regs + MA35_CTL0);
> +	val &=3D ~MA35_CTL_I2CEN;
> +	writel(val, i2c->regs + MA35_CTL0);
> +
> +	clk_disable(i2c->clk);
> +
> +	return 0;
> +}

Does this safely handle mid-flight interrupts?  Since the interrupt is
registered with IRQF_SHARED, disabling the clock without first calling
synchronize_irq() risks a crash if an IRQ handler is still executing or
about to execute on another CPU when the clock is gated off.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512073953.5643=
23-1-zychennvt@gmail.com?part=3D2
