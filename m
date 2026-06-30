Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE2B2E62A9
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782783317; cv=none; b=jBiMqNZg03MSWSCXptnVqXVA+8zfUBqiD8Ka8KRr6fR/Nvvyt8KzQOHm4mZyeNi1dBP4KSUS3k6jDBI3+xirfuCASY5jaA50m9dmwViDw9e+OvSiCBh2RSAP4o43DRlZKsj6dAZ6hKcBQj16BHZb1hSPTd3iAvVYnKSTeQZVUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782783317; c=relaxed/simple;
	bh=ScL/LI1vDLKLnQTT68Rp+AsRyqSHSBmCijWXquF5pVs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xte91SZ8BMcZd4p+CdhNwT+z7FhHvABF4kN61qi9SLrJFYS6hOqebE8hObaxromIIVJD2WcIcOskpMwAj5+Lbz1UdT217/corHIjjIJKGSArEVl29fKPhS/q/3gGKsZzsMnI8PK1eyL/Ifz+6oTT2eYeYHH0508k1nlcm/VVqo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0rr53H5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0rr53H5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAE41F000E9;
	Tue, 30 Jun 2026 01:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782783310;
	bh=12j53gvMJyOaX0V5JZCBDMk3LGj8WO9jA9//rf36Xmg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0rr53H5fje0BQ6INZ5O5nW/pF+sSlSWwLeVtHtIe21E908KQREIjq/V3pXROSHNk
	 qYIvGdGxw0zA4Xh1DJ1/xMQk4AkyRFODOMAE4k8lHXNZqdE/zJU3fCfcvktaLJPxN3
	 fWo/r6ohwxEYlmP1Ksw6lgfDlvpecibqzoXAo0Oh+jJZ47NldkOs9stv/gU2w6OKzh
	 4+Z3lHRCyrFKoBJo6oOnNtcyMw3zv03uhaqOyb+IxRXX3qF1oBrzcFQLyNp28CYxcK
	 AOhtBwsEDO0bZcdxgIIC6epcFG6kRFMfOae5vE1J0RdfBtq1PKFgm+OSZmgh6Dabix
	 ehrFJhtH8sBDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630012106.3616821-3-zychennvt@gmail.com>
References: <20260630012106.3616821-1-zychennvt@gmail.com>
 <20260630012106.3616821-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 01:35:09 +0000
Message-Id: <20260630013509.EBAE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Dangling `i2c->msg` pointer and lack of IRQ synchronization causes=
 Use-After-Free / Memory Corruption on timeout.
- [High] Incomplete target unregistration and lack of IRQ sync causes NULL =
pointer dereference panic and bus freeze.
- [High] Zero-message transfer triggers a START condition followed by a ZER=
O_SIZE_PTR dereference panic.
- [Medium] Missing `pm_runtime_mark_last_busy()` breaks PM autosuspend dela=
y logic.
- [Medium] Unlocked Read-Modify-Write of `MA35_CTL0` in system suspend path=
 races with the IRQ handler.
- [Medium] Incorrect handling of `I2C_M_IGNORE_NAK` aborts the transaction =
while reporting success.
- [Medium] A malformed or unusually large `clock-frequency` device tree pro=
perty causes division by zero during probe.
- [Low] Comment incorrectly describes receiving data as transmitting data.
--

commit 469758a7eb28d07aab76dce6fd3f09b0e77b5e45
Author: Zi-Yu Chen <zychennvt@gmail.com>
Subject: i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support

Add I2C support for Nuvoton MA35D1 SoC.
The controller supports standard, fast and fast-plus modes,
and provides controller/target functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..2044479b608ed
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
[ ... ]
> @@ -345,13 +345,11 @@ static void ma35d1_i2c_irq_controller_trx(struct ma=
35d1_i2c *i2c,
>  	case MA35_M_TRAN_ADDR_NACK:
>  	case MA35_M_RECE_ADDR_NACK:
>  		/* Controller Transmit Address NACK */
>  		/* 0x20: SLA+W has been transmitted and NACK has been received */
>  		/* 0x48: SLA+R has been transmitted and NACK has been received */
>  		if (i2c->msg->flags & I2C_M_IGNORE_NAK) {
>  			ma35d1_i2c_stop(i2c, 0);
>  		} else {

[Severity: Medium]
Does handling I2C_M_IGNORE_NAK by stopping the transfer and returning 0
correctly implement the ignore flag?

Typically, ignoring a NACK implies treating it as an ACK and continuing to =
the
data phase rather than aborting the transaction entirely.

>  			dev_dbg(i2c->dev, "\n i2c: ack was not received\n");
>  			ma35d1_i2c_stop(i2c, -ENXIO);
>  		}
>  		break;
[ ... ]
>  	case MA35_M_RECE_DATA_ACK:
>  	case MA35_M_RECE_DATA_NACK:
>  		/* DATA has been transmitted and ACK has been received */

[Severity: Low]
Is this comment accurate? Since this is the receive data case, shouldn't it
state that data has been received instead of transmitted?

>  		byte =3D readb(i2c->regs + MA35_DAT);
>  		i2c->msg->buf[i2c->msg_ptr++] =3D byte;
[ ... ]
> @@ -415,22 +415,19 @@ static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c=
, struct i2c_msg *msgs,
>  			     int num)
>  {
>  	unsigned long timeout;
>  	unsigned int val;
>  	int ret, err;
> =20
>  	i2c->msg =3D msgs;
>  	i2c->msg_num =3D num;
>  	i2c->msg_ptr =3D 0;
>  	i2c->msg_idx =3D 0;
>  	i2c->err =3D 0;
> =20
>  	ma35d1_i2c_enable_irq(i2c);
>  	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA_SI);
> =20
>  	timeout =3D wait_event_timeout(i2c->wait, i2c->msg_num =3D=3D 0, HZ * 5=
);

[Severity: High]
What happens if ma35d1_i2c_doxfer() is called with num =3D=3D 0 (e.g., via =
the
I2C_RDWR ioctl)? The hardware is issued a START condition, but the
i2c->msg_num =3D=3D 0 condition in wait_event_timeout() evaluates to true
instantly.

When the hardware START interrupt fires, will ma35d1_i2c_irq_controller_trx=
()
then call ma35d1_i2c_set_addr() and dereference a ZERO_SIZE_PTR for i2c->ms=
g?

>  	ma35d1_i2c_disable_irq(i2c);
>  	ret =3D i2c->msg_idx;
> =20
>  	if (timeout =3D=3D 0) {
>  		dev_dbg(i2c->dev, "xfer timeout\n");
>  		ret =3D -ETIMEDOUT;
>  		goto reset;
>  	}

[Severity: High]
Does this timeout path leave a dangling pointer in i2c->msg? If
ma35d1_i2c_disable_irq() runs but an interrupt handler is already executing=
 or
fires slightly late, the handler will bypass the unlikely(!i2c->msg) check =
and
operate on memory that has already been freed by the caller.

Could this cause memory corruption when the handler writes to
i2c->msg->buf[i2c->msg_ptr++], or a hardware external abort when
ma35d1_i2c_reset() runs concurrently?

> =20
>  	err =3D readl_poll_timeout(i2c->regs + MA35_CTL0, val,
[ ... ]
> @@ -445,15 +442,13 @@ static int ma35d1_i2c_xfer(struct i2c_adapter *adap=
, struct i2c_msg *msgs,
>  			   int num)
>  {
>  	struct ma35d1_i2c *i2c =3D i2c_get_adapdata(adap);
>  	int ret;
> =20
>  	ret =3D pm_runtime_resume_and_get(i2c->dev);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D ma35d1_i2c_doxfer(i2c, msgs, num);
> =20
>  	if (i2c->target) {
>  		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI_AA);
>  		ma35d1_i2c_enable_irq(i2c);
>  	}
>  	pm_runtime_put_autosuspend(i2c->dev);

[Severity: Medium]
Does dropping the PM reference here without calling
pm_runtime_mark_last_busy() break the autosuspend delay logic?

Since the last busy timestamp isn't updated, won't subsequent transfers
instantly suspend the controller once the initial 5000ms delay elapses,
instead of keeping it active?

> =20
>  	return ret;
>  }
[ ... ]
> @@ -490,12 +485,11 @@ static int ma35d1_unreg_target(struct i2c_client *t=
arget)
>  {
>  	struct ma35d1_i2c *i2c =3D i2c_get_adapdata(target->adapter);
>  	int ret;
> =20
>  	if (!i2c->target)
>  		return -EINVAL;
> =20
>  	/* Disable I2C interrupt */
>  	ma35d1_i2c_disable_irq(i2c);
> =20
>  	i2c->target =3D NULL;
> =20
>  	ret =3D pm_runtime_put_sync(i2c->dev);

[Severity: High]
Can setting i2c->target to NULL without calling synchronize_irq() lead to a
NULL pointer dereference in ma35d1_i2c_irq_target_trx() if a concurrent
target interrupt fires?

Additionally, since ma35d1_i2c_disable_irq() does not clear the hardware
target address (MA35_ADDR0) or the AA bit in MA35_CTL0, does the I2C
controller remain active on the bus? Would it continue to ACK its slave
address without generating interrupts, permanently holding SCL low and
freezing the bus until PM fully suspends it?

>  	if (ret < 0)
>  		dev_err(i2c->dev, "failed to suspend i2c controller");
> =20
>  	return 0;
>  }
[ ... ]
> @@ -529,15 +523,12 @@ static int ma35d1_i2c_suspend(struct device *dev)
>  {
>  	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
>  	unsigned int val;
> =20
>  	/* Prepare for wake-up from I2C events if target mode is active */
>  	if (i2c->target) {
>  		val =3D readl(i2c->regs + MA35_CTL0);
>  		val |=3D (MA35_CTL_SI | MA35_CTL_AA);
>  		writel(val, i2c->regs + MA35_CTL0);

[Severity: Medium]
Does this unlocked read-modify-write on MA35_CTL0 race with
ma35d1_i2c_write_ctl() in the interrupt handler?

Because the device is in target mode, it can still receive transactions and
generate interrupts concurrently. Can this race corrupt the control register
state, such as losing the MA35_CTL_SI flag or inadvertently clearing I2CEN?

> =20
>  		/* Setup wake-up control */
>  		writel(0x1, i2c->regs + MA35_WKCTL);
[ ... ]
> @@ -642,12 +633,11 @@ static int ma35d1_i2c_probe(struct platform_device =
*pdev)
>  	/* Default to 100kHz if not specified in DT */
>  	busfreq =3D 100000;
>  	device_property_read_u32(dev, "clock-frequency", &busfreq);
> =20
>  	/* Calculate divider based on the current peripheral clock rate */
>  	clkdiv =3D DIV_ROUND_CLOSEST(clk_get_rate(i2c->clk), busfreq * 4) - 1;

[Severity: Medium]
Can this division crash the kernel during boot if the device tree contains a
malformed clock-frequency?

If busfreq is 0, or if it is an excessively large value that causes
busfreq * 4 to overflow a 32-bit integer back to 0, does this result in a
division by zero macro expansion?

>  	if (clkdiv < 0 || clkdiv > 0xffff)
>  		return dev_err_probe(dev, -EINVAL, "invalid clkdiv value: %d\n",
>  				     clkdiv);
> =20
>  	i2c->irq =3D platform_get_irq(pdev, 0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630012106.3616=
821-1-zychennvt@gmail.com?part=3D2
