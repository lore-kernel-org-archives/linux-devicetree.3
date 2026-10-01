Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B94A441D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842095; cv=none; b=TdXVjGaw1Pi9vhe9pD0+FhxuSrGD7Fy5ZjzxtDk2LNIqII7k4pOMspPrwJ2eK05RyEjdAkGPyc/yYrb0tWnTL2KsKEGIl1wgg0veqNFygh7K+oe18qUIijtEJqAaSusiXfGmMoiYstnJ0oUsuUQQY2Owiy4RqFj3ZllovFlpe94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842095; c=relaxed/simple;
	bh=tjJPx3yWqcXHHVBUD6s6X+jCOpzeG20YEBoVh9BBaiQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T2iTJqnRWCANsKZHurvUbhFKF3BjCDtXSkuNYfYB5BE1gfm4P6TrsVYYQ4ASrXq1vXAOIBVGcJp9BnbbCHg56/PcJPpom5YB14+iZu/Go6fSUi2LitEVvJIPOZerrzH48kVnUu0QQKQiyjQPe6FGun6UWo67C5E2LDKIv3GT10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zata8DTZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zata8DTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9183C1F000FF;
	Thu,  1 Oct 2026 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842093;
	bh=cwNBDW+jpVpg303nmp13hfa2m75n10Q2eIgAwuCYKCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zata8DTZ0wovCUjh0JKGKflSixWZ0H4z95tLxtMUY1dC62xu0psAo+JAlvXBGAemO
	 A7dTbNpQbgNE0oooYyPlE3FXgn0WqGP0A9ydF/UGqEu+FQ+4XORcxRdJ0Zflleyxdx
	 3fnWnlmS4HeWYiUfoBUsmnzAwHBZ+Lfbchc+U+u5HLXyMxEPhXe48h9rSGn79FoUQh
	 jJZFhFg7En1nRGdLRPoZioPcKmQa5Inp+8DXyNALLd6d+9ZSwE5PXiPKNzZ8UXse+p
	 uam4w+vpfUpVTE+5azwxDFS8YSKrLGeArsQ0T9Kc9eeynvNEWjgnKU+fzBeCeuT2f5
	 w6DAgaBXsaQvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261001075101.489660-3-zychennvt@gmail.com>
References: <20261001075101.489660-1-zychennvt@gmail.com>
 <20261001075101.489660-3-zychennvt@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 08:08:13 +0000
Message-Id: <20261001080813.9183C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] i2c: ma35d1: data race in transfer initialization corrupts state m=
achine
- [High] i2c: ma35d1: TOCTOU race in target registration leads to NULL poin=
ter dereference
- [Medium] i2c: ma35d1: ignored return value in target receive allows buffe=
r overrun
- [Medium] i2c: ma35d1: inconsistent IO accessors for MA35_DAT register
- [Medium] i2c: ma35d1: resource leak on suspend error path leaves wake-up =
enabled
- [Medium] i2c: ma35d1: multi-master target mode broken due to unconditiona=
l AA bit clear
--

commit deb266e66e11836eee266a00ecd16f32efa64cf8
Author: Zi-Yu Chen <zychennvt@gmail.com>

i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
   =20
Add I2C support for Nuvoton MA35D1 SoC.
The controller supports standard, fast and fast-plus modes,
and provides controller/target functionality.

> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma3=
5d1.c
> new file mode 100644
> index 0000000000000..2a4985dc22c6e
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
> +	val &=3D ~(MA35_CTL_SI_AA);
> +	val |=3D ctl;
> +	writel(val, i2c->regs + MA35_CTL0);
> +}

[Severity: Medium]
Will this unconditionally clear the Assert Acknowledge (AA) bit during
controller transfers?

When ma35d1_i2c_doxfer() calls this with just MA35_CTL_STA, the AA bit is
omitted and stripped from the register. In a multi-master environment, if
arbitration is lost and another controller addresses this device as a
target, won't it fail to ACK its target address and break the multi-master
target fallback mechanism?

[ ... ]
> +static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
> +					     unsigned long i2c_status)
> +{
> +	unsigned char byte =3D 0;
> +	int ret;
> +
> +	switch (i2c_status) {
[ ... ]
> +	case MA35_S_RECE_DATA_ACK:
> +		/*
> +		 * Previously address with own SLA address Data has been received;
> +		 * ACK has been returned
> +		 */
> +		byte =3D readb(i2c->regs + MA35_DAT);
> +		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_RECEIVED, &byte);
> +		break;

[Severity: Medium]
Is it possible for i2c_slave_event() to return an error here when the backe=
nd
buffer is full?=20

By ignoring the return value, target_reject remains false, causing the
controller to blindly ACK subsequent bytes and potentially overrun the back=
end
buffer instead of NACKing the next byte.

[ ... ]
> +static irqreturn_t ma35d1_i2c_irq_controller_trx(struct ma35d1_i2c *i2c,
> +						 unsigned long i2c_status)
> +{
> +	unsigned char byte;
[ ... ]
> +	case MA35_M_TRAN_ADDR_ACK:
> +	case MA35_M_TRAN_DATA_ACK:
> +		/* SLA+W has been transmitted and ACK has been received */
> +		if (i2c_status =3D=3D MA35_M_TRAN_ADDR_ACK) {
> +			if (is_last_msg(i2c) && i2c->msg->len =3D=3D 0) {
> +				ma35d1_i2c_stop(i2c, 0);
> +				return IRQ_HANDLED;
> +			}
> +		}
> +
> +		if (!is_msgend(i2c)) {
> +			byte =3D i2c->msg->buf[i2c->msg_ptr++];
> +			writel(byte, i2c->regs + MA35_DAT);
> +			ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> +		} else if (!is_last_msg(i2c)) {

[Severity: Medium]
Why is 32-bit writel() used to write data but 8-bit readb() used to read
from the exact same MA35_DAT register below?=20

If the ARM SoC's peripheral bus dictates 32-bit aligned accesses, could
readb() trigger a bus fault or return invalid data? Both paths should use
consistent accessor sizes (e.g. readl(reg) & 0xff).

[ ... ]
> +	case MA35_M_RECE_DATA_ACK:
> +	case MA35_M_RECE_DATA_NACK:
> +		/* DATA has been received and ACK/NACK has been received */
> +		byte =3D readb(i2c->regs + MA35_DAT);
> +		i2c->msg->buf[i2c->msg_ptr++] =3D byte;
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
> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);

[Severity: High]
Does this expose the transfer state to the active interrupt handler before
setup is fully complete and protected?=20

If a spurious interrupt or bus error fires during this window, the ISR
could concurrently modify these fields. The ISR might set msg_num=3D0 and
err=3D-EIO, which the process context then overwrites with err=3D0 before
sending a START, potentially leaving the hardware hanging.

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
> +
> +	return ret;
> +}

[Severity: High]
Is there a TOCTOU race condition here?

If ma35d1_unreg_target() clears i2c->target and calls synchronize_irq()
right after ma35d1_i2c_xfer() checks it but before it sets the AA bit, this
could enable target mode interrupts while i2c->target is NULL. A subsequent
target transaction would then fire the ISR and dereference the NULL pointer.

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
> +	/* Clear AA bit */
> +	ma35d1_i2c_write_ctl(i2c, 0);
> +
> +	synchronize_irq(i2c->irq);
> +	i2c->target =3D NULL;
[ ... ]
> +static int ma35d1_i2c_suspend(struct device *dev)
> +{
> +	struct ma35d1_i2c *i2c =3D dev_get_drvdata(dev);
> +	unsigned int val;
> +	int ret;
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
> +		ret =3D enable_irq_wake(i2c->irq);
> +		if (ret)
> +			return ret;
> +		return 0;
> +	}
> +	return pm_runtime_force_suspend(dev);
> +}

[Severity: Medium]
If enable_irq_wake() fails, this returns early without clearing MA35_WKCTL.=
=20

Will this leave the hardware wake-up control active during normal runtime,
potentially causing spurious wakeups or interrupt storms?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001075101.4896=
60-1-zychennvt@gmail.com?part=3D2
