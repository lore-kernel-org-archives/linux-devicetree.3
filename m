Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B911A6814
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 03:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061475; cv=none; b=nPVFtLmVE7qzqxtK+9KMXkTICQcX1PwCxgfZJICXfa+0YLXNMGi+M7Uko+RnB2cGtUkMUTIF8yUXm2v/SGvClgfQQJ96IUlNBm00eeWU30qS+Ad8g0uu0jTWvgv6R6A3X2yzNmDMMK9vwmL/bq4biu/SO30XZ0/KnKWj0PONAts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061475; c=relaxed/simple;
	bh=3Jl88fEMIG6vNn8sstF16GyRYlNmbjsnsvKulbmlIzQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=erYamQPaIYP/c6aX5+zLwwkF6XbCbScMycC6D9qW9jtN/L7L9kN1q+uCMQdcWsGuRAfRMiS7Mys6lx49p3PNX2L42/aUlhqWkSm3X6ydCdYKYm5zmoP4hcdoMbOmZWf+GMqIkaZe1j5MHTbDbP4oYKdzDV/PJ8cm2CsH9qlI2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lr9R0bP3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lr9R0bP3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF961F00893;
	Wed, 10 Jun 2026 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781061473;
	bh=3WtcF5JhuxOn/nGVUfoA3krpXudpMMss0przIuq3dnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lr9R0bP3c7XSVSB3H64qvomH6CrFCQl8jJPYK+TKSx3nf48etiBcXyxLEaLwSFTF4
	 //auHs+3hUnDOJOZPTKLJPahJIU4qYq8dk08ykfqllSdnjeCIFUhZIQqoipnHe7zEy
	 M/mV6eGIePmXgGRyNilPOMLrOMKhMQ/68MrwpwxYlza91WnxJFuf6BmqiHUCeYDIIL
	 df2sgjsb0Xabm7k+T6IaVHLPCD8ioS4k5uMq/9oPrphFceNcax9Apt99XdT5aOd29B
	 bPnWbLQ2uMvWRlskRWm4HA8oWR3tIA8vpqFK5E1z4Nn834CmTgamdyiBtQxngy8h2f
	 Xsy2GsmIEzUrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610030208.2020275-3-zychennvt@gmail.com>
References: <20260610030208.2020275-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 03:17:53 +0000
Message-Id: <20260610031753.6FF961F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Missing IRQ synchronization on teardown paths causes use-after-fre=
e and NULL pointer dereferences.
- [High] Lockless register access and unsafe read-modify-write operations o=
n MA35_CTL0 corrupt the hardware state machine.
- [High] Arbitration lost is handled incorrectly, violating I2C specificati=
ons and causing transfer timeouts.
- [High] Explicit pm_runtime_disable() in the probe error path causes a dou=
ble disable, permanently breaking deferred probes.
- [High] Missing `.remove` callback leaves the I2C clock running and violat=
es the clock API if the module is unloaded while runtime active.
- [High] Clearing MA35_CTL_I2CEN in ma35d1_unreg_target() breaks subsequent=
 master transfers due to PM runtime state mismatch.
- [Medium] The driver falsely advertises I2C_FUNC_PROTOCOL_MANGLING but inc=
orrectly handles I2C_M_IGNORE_NAK and ignores I2C_M_NOSTART.
- [Medium] The system suspend callback leaks power by leaving the I2C clock=
 enabled if the device is active and target mode is inactive.
--

commit bda32059fddeb5d34a52e14ab99c35478baf80a4
Author: Zi-Yu Chen <zychennvt@gmail.com>

    i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
   =20
    Add I2C support for Nuvoton MA35D1 SoC. The controller supports standar=
d,
    fast and fast-plus modes, and provides controller/target functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..7b6b20c0996d2
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ma35d1.c
[ ... ]
> +static void ma35d1_i2c_write_CTL(struct ma35d1_i2c *i2c, unsigned int ct=
l)
> +{
> +	unsigned int val;
> +
> +	val =3D readl(i2c->regs + MA35_CTL0);
> +	val &=3D ~(MA35_CTL_STA_SI_AA | MA35_CTL_STO);
> +	val |=3D ctl;
> +	writel(val, i2c->regs + MA35_CTL0);
> +}

[Severity: High]
Is there a missing lock here? The driver performs unprotected
read-modify-write operations on the shared MA35_CTL0 register. A timeout or
unbind process calling ma35d1_i2c_disable_irq() could race with the
interrupt handler updating state via ma35d1_i2c_write_CTL(), clobbering the
STO or SI bits and locking up the hardware.

[ ... ]
> +static void ma35d1_i2c_disable_irq(struct ma35d1_i2c *i2c)
> +{
> +	unsigned long tmp;
> +
> +	tmp =3D readl(i2c->regs + MA35_CTL0);
> +	writel(tmp & ~MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
> +}

[Severity: High]
Can this read-modify-write race with the interrupt handler? See the comment
on ma35d1_i2c_write_CTL() above.

[ ... ]
> +static void i2c_ma35d1_irq_target_trx(struct ma35d1_i2c *i2c,
> +				      unsigned long i2c_status)
> +{
[ ... ]
> +	case MA35_S_REPEAT_START_STOP:
> +	/* A STOP or repeated START has been received
> +	 *  while still addressed as Target/Receiver
> +	 */
> +		i2c_slave_event(i2c->target, I2C_SLAVE_STOP, &byte);
> +		break;
> +
> +	default:
> +		dev_err(i2c->dev, "Status 0x%02lx is NOT processed\n",
> +			i2c_status);
> +		break;
> +	}
> +	ma35d1_i2c_write_CTL(i2c, MA35_CTL_SI_AA);
> +}

[Severity: High]
Does this fail to handle target arbitration lost states (0x68, 0xb0)? If
execution falls to the default case, the target backend is never notified of
the transfer start, potentially desynchronizing the target state machine.

[ ... ]
> +static void i2c_ma35d1_irq_controller_trx(struct ma35d1_i2c *i2c,
> +					  unsigned long i2c_status)
> +{
[ ... ]
> +	case MA35_M_TRAN_ADDR_NACK:
> +	case MA35_M_RECE_ADDR_NACK:
> +		/* Controller Transmit Address NACK */
> +		/* 0x20: SLA+W has been transmitted and NACK has been received */
> +		/* 0x48: SLA+R has been transmitted and NACK has been received */
> +		if (i2c->msg->flags & I2C_M_IGNORE_NAK) {
> +			ma35d1_i2c_stop(i2c, 0);
> +		} else {

[Severity: Medium]
Does this correctly implement I2C_M_IGNORE_NAK? NACKs are expected to be
ignored to proceed with transmitting the payload as if an ACK occurred, but
this terminates the transfer completely.

[ ... ]
> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_id;
> +	unsigned long status;
> +
> +	status =3D readl(i2c->regs + MA35_STATUS0);
> +
> +	if (status =3D=3D MA35_M_ARB_LOST) {
> +		dev_err(i2c->dev, "Arbitration lost\n");
> +		ma35d1_i2c_stop(i2c, -EAGAIN);
> +		goto out;
> +	}

[Severity: High]
Should this issue a STOP condition when arbitration is lost? Generating a
STOP while another master is actively driving the bus violates the I2C
protocol, which can disrupt the winning master's transfer.

[ ... ]
> +static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msg=
s,
> +			     int num)
> +{
[ ... ]
> +	ma35d1_i2c_enable_irq(i2c);
> +	ma35d1_i2c_write_CTL(i2c, MA35_CTL_STA_SI);
> +	timeout =3D wait_event_timeout(i2c->wait, i2c->msg_num =3D=3D 0, HZ * 5=
);
> +	ma35d1_i2c_disable_irq(i2c);
> +	ret =3D i2c->msg_idx;
> +
> +	if (timeout =3D=3D 0) {
> +		dev_dbg(i2c->dev, "xfer timeout\n");
> +		ret =3D -ETIMEDOUT;
> +		goto reset;
> +	}

[Severity: High]
Are we missing synchronization with inflight ISRs here? Disabling the IRQ at
the register level doesn't stop an already executing handler. Could the ISR
blindly proceed to dereference the message buffer after it has been freed?
This might need synchronize_irq() after ma35d1_i2c_disable_irq().

[ ... ]
> +static int ma35d1_unreg_target(struct i2c_client *target)
> +{
> +	struct ma35d1_i2c *i2c =3D i2c_get_adapdata(target->adapter);
> +	unsigned int val;
> +	int ret;
> +
> +	if (!i2c->target)
> +		return -EINVAL;
> +
> +	/* Disable I2C interrupt */
> +	ma35d1_i2c_disable_irq(i2c);
> +
> +	/* Disable I2C */
> +	val =3D readl(i2c->regs + MA35_CTL0);
> +	val &=3D ~MA35_CTL_I2CEN;
> +	writel(val, i2c->regs + MA35_CTL0);
> +
> +	i2c->target =3D NULL;

[Severity: High]
Similar to ma35d1_i2c_doxfer(), does this need synchronize_irq() before
setting i2c->target to NULL? Setting it to NULL while an ISR is concurrently
executing on another CPU could cause a NULL pointer dereference.

> +
> +	ret =3D pm_runtime_put_sync(i2c->dev);

[Severity: High]
Can clearing MA35_CTL_I2CEN above break subsequent master transfers? If the
autosuspend timer is active, pm_runtime_put_sync() leaves the device in the
RPM_ACTIVE state. A subsequent master transfer could observe RPM_ACTIVE and
skip runtime_resume(), resulting in an -EBUSY timeout because the hardware
was disabled.

[ ... ]
> +/* Declare Our I2C Functionality */
> +static u32 ma35d1_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_SMBUS_EMUL;
> +}

[Severity: Medium]
Should this driver advertise I2C_FUNC_PROTOCOL_MANGLING? It unconditionally
issues a START condition (ignoring I2C_M_NOSTART) and handles
I2C_M_IGNORE_NAK incorrectly.

[ ... ]
> +static int ma35d1_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +rpm_put:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +	return ret;
> +}

[Severity: High]
Can this cause a double disable of runtime PM? The driver uses
devm_pm_runtime_enable() which attaches a devres cleanup action. Calling
pm_runtime_disable() manually increments the disable_depth, and the
subsequent devres cleanup increments it again, preventing the device from
powering on during deferred probes.

> +static int ma35d1_i2c_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +
> +	/* Prepare for wake-up from I2C events if target mode is active */
> +	if (i2c->target) {
> +		val =3D readl(i2c->regs + MA35_CTL0);
> +		val |=3D (MA35_CTL_SI | MA35_CTL_AA);
> +		writel(val, i2c->regs + MA35_CTL0);
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
> +		ma35d1_i2c_enable_irq(i2c);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Could this leak power by leaving the I2C clock enabled if the device is
active and target mode is inactive? If the device happened to be in the
RPM_ACTIVE state when the system goes to sleep, the clock remains fully
enabled for the duration of the suspend.

[ ... ]
> +static struct platform_driver ma35d1_i2c_driver =3D {
> +	.probe      =3D ma35d1_i2c_probe,
> +	.driver     =3D {
> +		.name   =3D "ma35d1-i2c",
> +		.of_match_table =3D ma35d1_i2c_of_match,
> +		.pm =3D pm_ptr(&ma35d1_i2c_pmops),
> +	},
> +};

[Severity: High]
Is a .remove callback needed here? If the module is unloaded while the devi=
ce
is in the RPM_ACTIVE state (e.g., within the 5000ms autosuspend window), the
clock remains enabled. During devres unbinding, executing clk_unprepare() on
an enabled clock violates the clock framework constraints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610030208.2020=
275-1-zychennvt@gmail.com?part=3D2
