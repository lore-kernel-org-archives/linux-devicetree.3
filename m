Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD5029D265
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517435; cv=none; b=b7uRv44CUBqWM2lwmaKw6Tt2LtwFH0kS9ata1KN6+FPq4Vu74cCzvnc+HwZqXZjVxKBpsBwVTxsK09eSt93ti+E1cZpp4LtYzND1DSchhv6cGMBPpLl9/hA5NB3N5nkvQNgZGHLgTNQUoIZIF239iD/qYRx+v6CHbLZnGZFPrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517435; c=relaxed/simple;
	bh=gwCU0VoO1GeBgmwXA9p2EHvHcbVYse9oq7dPfVgM35M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mjIg4/oO5TI607G4ji8E42e4VcdcB/7aFoDJyzZEogwTozWVEEWA6h22W2xgW9z625JSImpB6WjZielEbA5heLJd6amnLi8FkwFRhbBLWlg/VRFHoDcYETA/s+/O3wT9wEte2oN8WUm+zqWeejL0pUOKmIh4R0zkrsGperhGo1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONf8n0GH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONf8n0GH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CAF1F000E9;
	Mon, 20 Jul 2026 03:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784517433;
	bh=OT55CyK1R4JRkvozk45jraydzia0UjWWQ4v8QmPNIAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ONf8n0GHUBVJWPpseTAuC8KFlO++o9Zh4ETdtYDOFAmuuE7ofJfotwua4jomRwZsw
	 /oAT9YhP32udzPUTUiwi3gC0pn9oyPb4b9UDHU7KeMkjaGvT6NCKkRDSPpoZZG1ozJ
	 WxV9b+RTD+YAqT0cA920yMTTWO9+4fz7c9dPQrMkdkxjgTpoRfQPkseTXWXeD73fxs
	 j3YsZpU1Dl8sp1ilk4nCZsyV3g4VL/4qBLogxo/mIyTWY1Y7XnD5aLu/1mNhYNFPRb
	 6N6MzzO480S25WRO0Vdh2HwDcoupNO49Iwp/v4EW/IPOs7ZUZhwvPaL1bSIho0jq7C
	 uxUav1CgeEdsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720030616.1067660-3-zychennvt@gmail.com>
References: <20260720030616.1067660-1-zychennvt@gmail.com>
 <20260720030616.1067660-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 03:17:13 +0000
Message-Id: <20260720031713.92CAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Lack of synchronization between the I2C transfer timeout path and =
the controller interrupt handler leads to Use-After-Free and data corruptio=
n.
- [High] Lockless target unregistration and unconditional dereferences of `=
i2c->target` crash the kernel on stray target interrupts.
- [High] Zero-length message transfers (`num =3D=3D 0`) cause an immediate =
false-success return while leaving hardware running, leading to out-of-boun=
ds memory access.
- [High] Hardware reset error path fails to restore the Interrupt Enable bi=
t, permanently wedging the I2C controller.
- [High] Writing `MA35_CTL_SI_AA` at the end of a master transfer silently =
clears and drops pending target mode interrupts.
- [High] The IRQ handler accesses hardware registers without verifying the =
device PM state, risking an external abort on wake.
- [High] The driver relies exclusively on PM runtime to enable its clock bu=
t lacks a Kconfig dependency on `CONFIG_PM`.
--

--- Patch [2]: [PATCH v6 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver su=
pport ---
commit ed59c57642f41c98381c1bf982fdec793de595c9
Author: Zi-Yu Chen <zychennvt@gmail.com>

i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

Add I2C support for Nuvoton MA35D1 SoC.
The controller supports standard, fast and fast-plus modes,
and provides controller/target functionality.

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d354569942803..e6c8f17130dbb 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1602,4 +1602,17 @@ config I2C_VIRTIO
>            This driver can also be built as a module. If so, the module
>            will be called i2c-virtio.
> =20
> +config I2C_MA35D1
> +	tristate "Nuvoton MA35D1 I2C driver"
> +	depends on ARCH_MA35 || COMPILE_TEST

[Severity: High]
Does this code need a depends on PM or a fallback for when CONFIG_PM is
disabled?

The driver relies exclusively on PM runtime in ma35d1_i2c_runtime_resume() =
to
enable its clock via clk_enable(). If the kernel is built without CONFIG_PM,
the pm_runtime_resume_and_get() calls succeed immediately without invoking
the callback, leaving the clock disabled and potentially causing hardware
faults on register access.

> +	select I2C_SLAVE
> +	help

[ ... ]

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..4ac49b1b22e00
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> @@ -0,0 +1,780 @@

[ ... ]

> +static void ma35d1_i2c_reset(struct ma35d1_i2c *i2c)
> +{
> +	unsigned int clkdiv, slvaddr;
> +
> +	clkdiv =3D readl(i2c->regs + MA35_CLKDIV);
> +	slvaddr =3D readl(i2c->regs + MA35_ADDR0);
> +
> +	reset_control_assert(i2c->rst);
> +	usleep_range(10, 20);
> +	reset_control_deassert(i2c->rst);
> +
> +	writel(clkdiv, (i2c->regs + MA35_CLKDIV));
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_I2CEN);

[Severity: High]
Does this code inadvertently leave interrupts disabled after a hardware res=
et?

When a transfer times out, ma35d1_i2c_reset() asserts hardware reset and
restores MA35_CLKDIV and MA35_CTL_I2CEN, but it fails to restore the
MA35_CTL_INTEN (Interrupt Enable) bit.

Because the device is already runtime active due to the autosuspend delay,
subsequent transfers will skip ma35d1_i2c_runtime_resume() (where INTEN is
normally set), causing all subsequent operations to time out permanently
and wedging the bus.

> +
> +	if (i2c->target)
> +		writel(slvaddr, i2c->regs + MA35_ADDR0);
> +}

[ ... ]

> +/* Check if this is the last message in the set */
> +static inline bool is_last_msg(struct ma35d1_i2c *i2c)
> +{
> +	return i2c->msg_idx >=3D (i2c->msg_num - 1);

[Severity: High]
Can this calculation underflow when i2c->msg_num is 0?

The I2C core permits probing with 0 messages (such as from i2cdetect).
If msg_num is 0, the calculation 0 - 1 evaluates to UINT_MAX. This causes
the check to fail incorrectly and can lead to reading beyond the end of the
empty array during hardware interrupts.

> +}
> +
> +/* Check if this is the last byte in the current message */

[ ... ]

> +static void ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +				      unsigned long i2c_status)
> +{
> +	unsigned char byte;
> +
> +	switch (i2c_status) {
> +	case MA35_S_RECE_ARB_LOST:
> +		/*
> +		 * Arbitration lost during SLA+R/W (Address) phase.
> +		 * The hardware automatically switches to Target mode as our
> +		 * own slave address was detected.
> +		 */
> +		i2c->err =3D -EAGAIN;
> +		ma35d1_i2c_controller_complete(i2c);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_REQUESTED, &byte);

[Severity: High]
Can i2c->target be NULL when it is passed to i2c_slave_event() here?

If a target event arrives when no target is registered, or if a race occurs
during unregistration, passing a NULL i2c->target pointer unconditionally
will cause a kernel panic when i2c_slave_event() dereferences it.

> +		break;
> +
> +	case MA35_S_RECE_ADDR_ACK:

[ ... ]

> +static void ma35d1_i2c_irq_controller_trx(struct ma35d1_i2c *i2c,
> +					  unsigned long i2c_status)
> +{
> +	unsigned char byte;
> +
> +	/* Ensuring messages are absolutely valid in Controller mode. */
> +	if (unlikely(!i2c->msg)) {
> +		dev_err(i2c->dev, "Spurious controller interrupt (status: 0x%02lx)\n",=
 i2c_status);
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		return;
> +	}
> +
> +	switch (i2c_status) {

[ ... ]

> +	case MA35_M_RECE_DATA_ACK:
> +	case MA35_M_RECE_DATA_NACK:
> +		/* DATA has been received and ACK/NACK has been received */
> +		byte =3D readb(i2c->regs + MA35_DAT);
> +		i2c->msg->buf[i2c->msg_ptr++] =3D byte;

[Severity: High]
Can this access to i2c->msg->buf race with the timeout teardown path?

If a transfer times out, ma35d1_i2c_doxfer() locklessly sets i2c->msg =3D N=
ULL
and returns, after which the caller usually frees the msgs array.=20

If a delayed or spurious hardware interrupt fires concurrently on another C=
PU,
this function checks !i2c->msg at the start, but accesses i2c->msg->buf
locklessly later here. If the pointer was cleared or the array was freed
in between, this will result in a NULL pointer dereference or use-after-fre=
e.

> +
> +		if (is_last_byte(i2c)) {

[ ... ]

> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_id;
> +	unsigned long status;
> +
> +	status =3D readl(i2c->regs + MA35_STATUS0);

[Severity: High]
Is it safe to access hardware registers here without verifying if the device
PM state is active?

When i2c->target is enabled, the driver enables IRQ wakeup in
ma35d1_i2c_suspend(). If a target event wakes the system from sleep, the
IRQ handler can execute early during the resume phase, before the device's
own pm_runtime or system resume has enabled the peripheral clock.

Accessing the registers while the clock is disabled triggers an external
bus abort. Using pm_runtime_get_if_active() before accessing registers would
prevent this.

> +
> +	if (status =3D=3D MA35_BUS_ERROR) {
> +		dev_err(i2c->dev, "Bus error during transfer\n");
> +		ma35d1_i2c_stop(i2c, -EIO);
> +		goto out;
> +	}

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
> +
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA_SI);
> +
> +	timeout =3D wait_event_timeout(i2c->wait, i2c->msg_num =3D=3D 0, HZ * 5=
);

[Severity: High]
Does this code inadvertently return success immediately for zero-length
messages?

The I2C core can send zero-length messages (num =3D=3D 0). If msgs_num is
initially 0, this wait_event_timeout() condition evaluates to true
immediately before the hardware executes the START condition.=20

The function will return successfully and the caller may destroy the msgs
array while the hardware is still running.

> +	ret =3D i2c->msg_idx;
> +
> +	if (timeout =3D=3D 0) {
> +		dev_dbg(i2c->dev, "xfer timeout\n");
> +		i2c->msg =3D NULL;

[Severity: High]
Can clearing i2c->msg locklessly here cause a data race?

As noted above, if a delayed interrupt fires concurrently on another CPU,
setting this to NULL locklessly can cause the interrupt handler to access
freed memory or dereference a NULL pointer.

> +		ret =3D -ETIMEDOUT;
> +		goto reset;
> +	}
> +
> +	err =3D readl_poll_timeout(i2c->regs + MA35_CTL0, val,

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
> +		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);

[Severity: High]
Does writing MA35_CTL_SI_AA clear and drop pending target mode interrupts?

MA35_CTL_SI_AA includes the MA35_CTL_SI bit. Since I2C controllers often
use a Write-1-To-Clear model for the SI (Interrupt) bit, writing this
blindly acknowledges and clears any I2C target interrupt that might have
just arrived on the bus. This drops the event and stalls the external
master waiting for a response.

> +	pm_runtime_put_autosuspend(i2c->dev);
> +
> +	return ret;
> +}
> +

[ ... ]

> +static int ma35d1_unreg_target(struct i2c_client *target)
> +{
> +	struct ma35d1_i2c *i2c =3D i2c_get_adapdata(target->adapter);
> +	int ret;
> +
> +	if (!i2c->target)
> +		return -EINVAL;
> +
> +	writel(0, i2c->regs + MA35_ADDR0);
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +	i2c->target =3D NULL;

[Severity: High]
Can clearing i2c->target locklessly race with an executing target IRQ handl=
er?

The target pointer is cleared here without holding a lock or using
synchronize_irq(). An actively executing target IRQ handler on another CPU
could crash when it attempts to use the pointer.

> +
> +	ret =3D pm_runtime_put_sync(i2c->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720030616.1067=
660-1-zychennvt@gmail.com?part=3D2
