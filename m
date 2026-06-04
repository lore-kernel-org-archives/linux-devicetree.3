Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E322286425
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780554126; cv=none; b=XumCyOkKEt3A1rDhHRj4CQAUpKElqtqqnIhl2iFVGMkBUOV7Sy+Io4zVVMZnkghnKn/BDQ1defVbpWhS9BIZKjwRZMAVGdnNah0594bGS2O1yPVrVFSkW+l7N8mr0uqn1hMCRMJwsAGcFTOgv+P+psvsEIOPxvTp7eBGjeoHNaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780554126; c=relaxed/simple;
	bh=La6U1d5BGEZBpGlRr+Nuzxarls7eO9ZQW7vXjbqqopY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kavtleQqgGJ/aYRGI4pEE6SbKi1Rl0yJkdbh3pRv3RYrWh+QBpIrYJIm1XOIcTpBseXExJ4PAUxps5knFydPwY7MtQNIWwAMLIV52sYkmse6k1elwAllqop8dE03pK4CQWZAcnR4sXXQqv+yv9fpEu5jIfJZ7gPY6GdSb9I5kzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7TMiGgu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7TMiGgu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B791F00898;
	Thu,  4 Jun 2026 06:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780554125;
	bh=zt78WfiY0QOVW89AztRTesc93nkZqbXQ82xlpft4rMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R7TMiGgusCW3wmhIckcZrlfaHYj+opGSYHqgoGz/nK3oaMH/l457OuPcXHT1qUgia
	 02yJcCBKT+bGszOgINF1qFUR95IEWaobDGmGn7NlqbQNZf8reIwaHOghqc1F3HW+bi
	 TFFfp9aFZF3ID18bx94yP9E1sF3zj7HnemaezHysXa4kgQUXigdL/KdAiPP1outcaw
	 e3kk0h0u3WCtg5q6Kpc+TMMeftJ78RWB4Sn7Uy73CQhZ2LWATOWWE5c+gO747Pw8Hy
	 cmYx9glHzKUSw8/u1csZ1lER4fou/BvwIKcd6noo9dX69JQDWSh6MXsjgLwcgX4EfE
	 skXrHQYqyPyeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i2c: Add i2c-nt726xx.c i2c driver for Novatek
 NT726xx SoCs.
Reply-To: sashiko-reviews@lists.linux.dev
To: SP_ISW1_AT@novatek.com.tw
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604060446.355787-1-SP_ISW1_AT@novatek.com.tw>
References: <20260604060446.355787-1-SP_ISW1_AT@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 06:22:04 +0000
Message-Id: <20260604062204.E3B791F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 16 potential issue=
(s) to consider:
- [Critical] Timeout handling in I2C read/write lacks synchronization, leav=
ing a dangling pointer accessible by the interrupt handler.
- [Critical] Unbinding the driver causes a NULL pointer dereference if `bus=
-enable` is false or missing.
- [Critical] The `clock-frequency` DT property expects kHz and causes a div=
ide-by-zero panic if correctly configured.
- [Critical] Control register fields are bitwise ORed without clearing prev=
ious state, allowing I2C target isolation bypass.
- [High] The `master_xfer` implementation unilaterally drops or misroutes t=
he first message of any 2-message transfer.
- [High] Virtual memory mapping leaked during initialization due to missing=
 `iounmap()`.
- [High] The driver advertises SMBus Quick support but explicitly rejects 0=
-length messages.
- [High] The ISR returns `IRQ_NONE` without clearing device interrupts if n=
o transfer is active, causing an unhandled interrupt storm.
- [High] Device interrupts are not disabled during driver removal, risking =
a shared IRQ storm.
- [High] The driver interacts with hardware registers without ensuring cloc=
ks and power domains are enabled.
- [Medium] The driver hardcodes physical memory addresses to access system-=
level control registers.
- [Medium] The driver parses custom, non-standard Device Tree properties to=
 handle core subsystem state.
- [Medium] Unconditional assignment of PM callbacks causes dead code when P=
M features are disabled.
- [Medium] The commit message contains a corporate confidentiality notice.
- [Medium] Device tree node reference acquired via `of_node_get()` is never=
 released.
- [Medium] The driver uses `writel()`/`readl()` with manual byte-packing fo=
r FIFO access instead of stream accessors.
--

commit 57029ad0ef0636d7917520387b5868dcfc696f11
Author: SP_ISW1_AT@novatek.com.tw <SP_ISW1_AT@novatek.com.tw>
Subject: i2c: Add i2c-nt726xx.c i2c driver for Novatek NT726xx SoCs.

This patch introduces the i2c bus controller driver for Novatek NT726xx SoC=
s,
supporting basic read/write functions in Standard and Fast modes.

> CONFIDENTIALITY NOTICE: This message, including attachments, contains inf=
ormation which may be confidential and privileged, and is intended only for=
 use by the addressees designated above. Unless you are the intended recipi=
ent, any use, copying, disclosure, or distribution is prohibited. If you ha=
ve received the message in error, please immediately delete the message and=
 destroy all copies thereof and notify the sender by reply email. =E6=9C=AC=
=E9=83=B5=E4=BB=B6=E5=8F=8A=E4=BB=BB=E4=BD=95=E9=99=84=E4=BB=B6=E5=9D=87=E5=
=B1=AC=E6=A9=9F=E5=AF=86=EF=BC=8C=E5=83=85=E4=BE=9B=E5=85=B6=E4=B8=8A=E6=8C=
=87=E5=AE=9A=E5=9C=B0=E5=9D=80=E4=B9=8B=E6=94=B6=E4=BB=B6=E4=BA=BA=E4=BD=BF=
=E7=94=A8=E3=80=82=E9=99=A4=E9=9D=9E=E6=82=A8=E6=98=AF=E6=8C=87=E5=AE=9A=E4=
=B9=8B=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=8C=E5=90=A6=E5=89=87=E8=AB=8B=E5=8B=
=BF=E4=BD=BF=E7=94=A8=E3=80=81=E8=A4=87=E8=A3=BD=E3=80=81=E6=8F=AD=E9=9C=B2=
=E6=88=96=E6=95=A3=E5=B8=83=E6=9C=AC=E9=83=B5=E4=BB=B6=E4=B9=8B=E4=BB=BB=E4=
=BD=95=E9=83=A8=E4=BB=BD=E3=80=82=E8=8B=A5=E6=82=A8=E9=8C=AF=E8=AA=A4=E5=9C=
=B0=E6=94=B6=E5=88=B0=E6=AD=A4=E9=83=B5=E4=BB=B6=EF=BC=8C=E8=AB=8B=E7=AB=8B=
=E5=8D=B3=E5=9B=9E=E8=A6=86=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E9=80=9A=E7=
=9F=A5=E5=AF=84=E4=BB=B6=E4=BA=BA=EF=BC=8C=E4=B8=A6=E8=AB=8B=E5=AE=8C=E5=85=
=A8=E5=88=AA=E9=99=A4=E4=B8=94=E9=8A=B7=E6=AF=80=E6=9C=AC=E9=83=B5=E4=BB=B6=
=E5=8F=8A=E5=85=B6=E8=A4=87=E6=9C=AC=E3=80=82

This isn't a regression, but the commit message contains a corporate
confidentiality notice.

> diff --git a/drivers/i2c/busses/i2c-nt726xx.c b/drivers/i2c/busses/i2c-nt=
726xx.c
> new file mode 100644
> index 0000000000000..b0e79722a85b0
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt726xx.c
[ ... ]
> +static void nvt_i2c_use_case_feature(struct nvt_i2c_bus *i2c)
> +{
> +	void __iomem *reg_tmp;
> +
> +	if (i2c->stbc_i2c) {
> +		reg_tmp =3D ioremap(STBC_PASSWORD, 4);

[Severity: Medium]
Is it safe to hardcode physical memory addresses like STBC_PASSWORD to acce=
ss
system-level control registers, rather than using standard Device Tree
bindings or resource management?

> +		writel(readl(reg_tmp) | STBC_PASSWORD_DATA1, reg_tmp);
> +		writel(readl(reg_tmp) | STBC_PASSWORD_DATA2, reg_tmp);
> +
> +		reg_tmp =3D ioremap(STBC_KEYPASS, 4);

[Severity: High]
Does this code leak the first virtual memory mapping? The pointer assigned
to reg_tmp from ioremap is overwritten here without a corresponding iounmap=
(),
creating a persistent leak.

[ ... ]
> +static void nvt_i2c_set_clk(struct nvt_i2c_bus *i2c)
> +{
> +	unsigned int duty =3D 0;
> +	unsigned int clk_div =3D 0;
> +	unsigned int source_speed =3D i2c->stbc_i2c ?
> +		i2c->comp_data->stbc_clock : i2c->comp_data->sys_clock;
> +
> +	clk_div =3D (source_speed / i2c->bus_clk_rate) / 1000;

[Severity: Critical]
Does this assume the clock-frequency property is in kHz?

The device tree standard mandates it is specified in Hertz. If a standard
value like 400000 is provided, could this integer division result in 0,
locking up the hardware or causing a divide-by-zero kernel panic?

[ ... ]
> +static void nvt_i2c_set_subaddr(struct nvt_i2c_bus *i2c, struct i2c_msg =
*msg)
> +{
[ ... ]
> +		for (i =3D 0; i < msg->len; i++)
> +			subaddr |=3D msg->buf[i] << (8 * (msg->len - 1 - i));

[Severity: High]
Could this read from uninitialized memory if the first message in a
transfer is a read command?

[ ... ]
> +static void nvt_i2c_write_fifo(struct nvt_i2c_bus *i2c,
> +			       unsigned int fifo_reg,
> +			       const unsigned char *buf,
> +			       unsigned int buf_offset,
> +			       unsigned int length)
> +{
> +	unsigned int reg_idx =3D 0, copy_bytes =3D 0, j =3D 0, value =3D 0;
> +
> +	while (length > 0) {
> +		value =3D 0;
> +		copy_bytes =3D length >=3D FIFO_WORD_BYTES ? FIFO_WORD_BYTES : length;
> +		for (j =3D 0; j < copy_bytes; j++)
> +			value |=3D ((unsigned int)buf[buf_offset + j]) << (j * 8);
> +
> +		writel(value, i2c->base + fifo_reg + reg_idx * 4);

[Severity: Medium]
Would it be better to use stream accessors like writesl() instead of manual=
ly
byte-packing into a writel() call? The standard register accessors perform
implicit byte-swapping which may be unintended for FIFO data streams.

[ ... ]
> +static irqreturn_t nvt_i2c_isr(int irq, void *dev_id)
> +{
> +	struct nvt_i2c_bus *i2c =3D dev_id;
> +	struct i2c_msg *msg =3D i2c->current_msg;
> +	unsigned int status =3D readl(i2c->base + I2C_REG_INTR);
> +	unsigned int clr =3D 0;
> +	int do_complete =3D 0;
> +
> +	if (!(status & I2C_IRQ_FLAG) || !i2c->current_msg)
> +		return IRQ_NONE;

[Severity: High]
If an interrupt is active but i2c->current_msg is NULL, could returning
IRQ_NONE without clearing the hardware interrupt flag cause an unhandled
interrupt storm on a shared, level-triggered line?

[ ... ]
> +	} else if (status & I2C_IRQ_TX_EMPTY) {
> +		if (i2c->remaining > 0)
> +			nvt_i2c_handle(i2c, msg, 0);

[Severity: Critical]
Can this result in a use-after-free regression if the wait_for_completion
expires?

If wait_for_completion_timeout() times out in nvt_i2c_write(), it sets
i2c->current_msg to NULL and returns, leaving the stack-allocated msg
to be freed. If an interrupt fires at that exact moment, the asynchronous
ISR might have already copied i2c->current_msg to the local msg variable
before it was cleared, leading to nvt_i2c_handle() accessing freed
stack memory.

[ ... ]
> +static int nvt_i2c_check_msg(const struct i2c_msg *msg)
> +{
> +	if (!msg || !msg->buf || msg->len =3D=3D 0 || msg->len > 4096)
> +		return -EINVAL;

[Severity: High]
Will this reject 0-length messages explicitly? The adapter advertises
I2C_FUNC_SMBUS_EMUL later on, which implies support for SMBus Quick
commands that rely on 0-length transactions.

[ ... ]
> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
[ ... ]
> +	ctrl_mask =3D readl(i2c->base + I2C_REG_CTRL);
> +	ctrl_mask |=3D (((msg->addr << 1) << 8) | I2C_ENABLE |
> +			I2C_CLOCK_DUTY_ENABLE | I2C_CLOCK_STRETCH_ENABLE |
> +			I2C_MASTER_CLK_STRETCH_ENABLE | I2C_TRIGGER);
> +	writel(ctrl_mask, i2c->base + I2C_REG_CTRL);

[Severity: Critical]
Does this bitwise-OR the target address without first clearing the existing
address bits in the control mask?

During a sequence of multiple messages in a single transfer, the previous
address might not be cleared, causing subsequent messages to transmit a
corrupted, logically-combined address on the bus. This could potentially
bypass I2C target isolation checks.

[ ... ]
> +static int nvt_i2c_xfer(struct i2c_adapter *adap,
> +			struct i2c_msg msgs[],
> +			int num)
> +{
> +	struct nvt_i2c_bus *i2c =3D i2c_get_adapdata(adap);
> +	int ret =3D 0, i =3D 0;
> +	struct i2c_msg *msg =3D NULL;
> +
> +	nvt_i2c_ctrl_init(i2c);
> +
> +	if (num =3D=3D 2) {
> +		nvt_i2c_set_subaddr(i2c, &msgs[0]);
> +		msg =3D &msgs[1];

[Severity: High]
Does this unilaterally drop the first message of any 2-message transfer and
treat it as a hardware subaddress? This could break standard 2-message I2C
sequences, such as interacting with two separate targets or consecutive wri=
tes.

[ ... ]
> +static int nvt_i2c_parse_dts(struct nvt_i2c_bus *i2c)
> +{
[ ... ]
> +	/* read DTS(nvt,hwmods) and set bus number */
> +	ret =3D of_property_read_string(np, "nvt,hwmods", &hwmods_val);
[ ... ]
> +	/* read DTS(bus-enable) */
> +	ret =3D of_property_read_u32(np, "bus-enable", &i2c->bus_enable);

[Severity: Medium]
Is there a reason to parse custom properties like nvt,hwmods and bus-enable
instead of relying on standard I2C core bindings like aliases and the
standard status =3D "disabled" flag?

[ ... ]
> +static int nvt_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D nvt_i2c_parse_dts(i2c);
> +	if (ret || !i2c->bus_enable)
> +		return ret;

[Severity: Critical]
If bus-enable is false, this returns 0 (success) before calling
platform_set_drvdata(). Could this cause a NULL pointer dereference
later during unbind when nvt_i2c_remove() fetches the empty drvdata?

> +
> +	nvt_i2c_init(i2c);

[Severity: High]
Does nvt_i2c_init() access hardware registers before ensuring the system bus
clocks and I2C power domain are enabled? Accessing a clock-gated or
powered-down peripheral can trigger an imprecise external abort.

[ ... ]
> +	i2c->adapter.dev.of_node =3D of_node_get(pdev->dev.of_node);

[Severity: Medium]
Is this of_node reference ever released? There doesn't appear to be a
matching of_node_put() in the teardown paths, which would cause a memory
leak across bind/unbind cycles.

[ ... ]
> +static void nvt_i2c_remove(struct platform_device *pdev)
> +{
> +	struct nvt_i2c_bus *i2c =3D platform_get_drvdata(pdev);
> +
> +	i2c_del_adapter(&i2c->adapter);
> +}

[Severity: High]
Should device hardware interrupts be disabled before unregistering the
adapter and removing the driver? Since a shared IRQ line is requested,
an interrupt fired during or after teardown could cause an unhandled
interrupt storm.

> +
> +static const struct dev_pm_ops nvt_i2c_pm_ops =3D {
> +	.resume_early =3D nvt_i2c_resume,
> +	.suspend_late =3D nvt_i2c_suspend,
> +};

[Severity: Medium]
Would it be better to wrap these callback assignments with pm_sleep_ptr()
to avoid generating dead code when PM features are disabled?

> +
> +static struct platform_driver nvt_i2c_driver =3D {
> +	.probe =3D nvt_i2c_probe,
> +	.remove =3D nvt_i2c_remove,
> +	.driver =3D {
> +		.name =3D "nvt_i2c",
> +		.owner =3D THIS_MODULE,
> +		.pm =3D &nvt_i2c_pm_ops,

[Severity: Medium]
Similarly, should the pm structure pointer be wrapped with pm_ptr()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604060430.3557=
33-1-SP_ISW1_AT@novatek.com.tw?part=3D3
