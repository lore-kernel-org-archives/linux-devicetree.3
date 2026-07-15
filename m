Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FF621C16A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101648; cv=none; b=r1VhMVBUL0gxI0xq9XasoY0affWbLdKpeRj6MazMfO43MymAaUxE4S0ov+qM2wf8UqWXBm+3V+4R7SkdaXTBYSf8PdRx4effpt9VhTwxx9KtNBz0bZPCkjDn7wD8BIe9+556pI3evgTAngcKf2FSFzLkgLk0/+xYBy1Q0cC0LU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101648; c=relaxed/simple;
	bh=DBEnLqJhSrcCjhowyIQiXb3Vk96KmEALcHBkzL7YBYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iv2LuiQGyCW4ra3e8g8VV9VHuZn+Tu2LTO8pdc2EukOK2/Hd+Rpkmrg9zT33GfTeUt9G3Okyf20zIe9s9L8lWktjVppm1Yf0G9n8OrpPOGya1kkLezZxHV3TBYtawueypGBE3IzEzuaNgi8/peksCqfc88JQlYUsQey/ck+fL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dujenUn4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dujenUn4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593981F000E9;
	Wed, 15 Jul 2026 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784101646;
	bh=ScAOAQKR7MAWcMIAIP83dk5Wnzycc3mZ5k0ddeOI0uY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dujenUn4GeLLXK/tldlrsn0DoaEbXIcH0MQFymRxIR/UTbb1Cq/ip6cZLRsUiY4rL
	 1JE/hkqhL3BCF+c0Bi9Sw4YA6Y38oJZUn6GRwVsH/fjub3w/6B3yPBI4jJc3ViOQWY
	 xPpf/+cj40ojLWUpKNVH+NUZLETHQZ2p9Wpp/KKxzhTTSHZaBkIid1JaS9UY1rUKM0
	 VmzMatV29ZolDoribQXgJqkhwaAR7v3mMXjbLgk8/zdimb5UjZWic4aZhTrEY7Dlxy
	 cauNbcSEigVy4Ko7nwq77bCwCHW9tTdbIug0em2lp6x8RQwhscDZT6QBL1x7e1RE7s
	 9NFBSlphZJOmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] i2c: Add i2c-nt726xx.c I2C driver for Novatek
 NT726xx SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: Nina_Kuo@novatek.com.tw
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715073534.147663-1-Nina_Kuo@novatek.com.tw>
References: <20260715073521.147610-1-Nina_Kuo@novatek.com.tw>
 <20260715073534.147663-1-Nina_Kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 07:47:25 +0000
Message-Id: <20260715074726.593981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] The driver bypasses Device Tree abstractions by mapping hardcoded =
physical MMIO addresses, and triggers a sleep-in-atomic panic during system=
 resume.
- [High] The master transfer function improperly intercepts 2-message seque=
nces, silently dropping the first message and potentially leaking uninitial=
ized kernel memory to hardware.
- [High] The interrupt handler returns IRQ_NONE without clearing asserted I=
RQ flags on unhandled events, leading to a hard lockup.
- [High] A race condition between the transfer timeout path and the ISR lea=
ds to a use-after-free of the I2C message buffer.
- [High] Hardware interrupts are enabled before the driver state is initial=
ized or the adapter is registered.
- [High] Hardware and interrupts are disabled before unregistering the I2C =
adapter in `remove`, forcefully stalling ongoing transfers.
- [High] `I2C_REG_CTRL` accumulates target addresses and operation flags ac=
ross multiple messages without clearing previous states.
- [Medium] Device tree node reference leak in the probe error path.
- [Medium] The driver uses a custom string property 'novatek,hwmods' to ass=
ign the I2C adapter number instead of standard DT aliases.
- [Low] PM callbacks and `dev_pm_ops` are unconditionally assigned, produci=
ng dead code when PM is disabled.
- [Low] Missing Kconfig OF dependency leads to unused variable warnings.
--

--- Patch [3]: [PATCH v3 3/3] i2c: Add i2c-nt726xx.c I2C driver for Novatek=
 NT726xx SoCs ---
commit fffdbc67de89a90f8a40ad053da0475e89a835d6
Author: Ben Huang <Ben_Huang@novatek.com.tw>
Subject: i2c: Add i2c-nt726xx.c I2C driver for Novatek NT726xx SoCs

This patch introduces the I2C bus controller driver for Novatek NT726xx SoC=
s,
supporting standard and fast modes.

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index d354569942803..52ee2c82e9d5e 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -962,6 +962,16 @@ config I2C_NPCM
>  	  controllers.
>  	  Driver can also support slave mode (select I2C_SLAVE).
> =20
> +config I2C_NT726XX
> +	tristate "Novatek NT726xx Driver"
> +	default n

[Severity: Low]
Does this need a "depends on OF" directive? Without it, of_match_ptr() can
evaluate to NULL when CONFIG_OF is disabled, causing a compiler warning for
an unused nvt_i2c_of_match variable.

[ ... ]
> diff --git a/drivers/i2c/busses/i2c-nt726xx.c b/drivers/i2c/busses/i2c-nt=
726xx.c
> new file mode 100644
> index 0000000000000..ac3fd7ccc68cb
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt726xx.c
[ ... ]
> +static void nvt_i2c_use_case_feature(struct nvt_i2c_bus *i2c)
> +{
> +	void __iomem *reg_tmp;
> +
> +	if (i2c->stbc_i2c) {
> +		reg_tmp =3D ioremap(STBC_PSWD, 4);

[Severity: High]
Is it safe to call ioremap() on a hardcoded physical address here? Since
this is called from nvt_i2c_resume() via the resume_early PM hook,
interrupts might be disabled. ioremap() can sleep, which could trigger a
scheduling-while-atomic panic during early resume.

Also, should this physical address be managed via standard device tree
resources instead?

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
If an interrupt fires while current_msg is NULL, this returns IRQ_NONE
without clearing the hardware interrupt status in I2C_REG_INTR. Since the
IRQ is requested as IRQF_TRIGGER_HIGH (level-triggered), won't the
uncleared interrupt keep the IRQ line asserted and lead to an interrupt
storm?

[ ... ]
> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
[ ... ]
> +	ctrl_mask =3D readl(i2c->base + I2C_REG_CTRL);
> +	ctrl_mask |=3D (((msg->addr << 1) << 8) | I2C_ENABLE |
> +			I2C_CLOCK_DUTY_ENABLE | I2C_CLOCK_STRETCH_ENABLE |
> +			I2C_MASTER_CLK_STRETCH_ENABLE | I2C_TRIGGER);
> +	writel(ctrl_mask, i2c->base + I2C_REG_CTRL);

[Severity: High]
Since this uses a bitwise OR to set the address and flags (like
I2C_READ_OPERATION) into ctrl_mask, and the previous state is not cleared,
won't subsequent messages bitwise OR their target address with the previous
message's address? Could this also cause a write message to be executed as
a read if the previous message was a read?

> +
> +	ret =3D wait_for_completion_timeout(&i2c->msg_complete, i2c->adapter.ti=
meout);
> +	if (ret =3D=3D 0) {
> +		i2c->error_code =3D -ETIMEDOUT;
> +		nvt_i2c_reset(i2c);
> +	}
> +	if (i2c->error_code)
> +		I2C_ERR_LOG("[%s.%d]: write failed (err:%d);"
> +			    " SA[0x%X]\n",
> +			    dev_name(i2c->dev), i2c->adapter.nr, i2c->error_code,
> +			    msg->addr);
> +
> +	i2c->current_msg =3D NULL;
> +
> +	return i2c->error_code;
> +}

[Severity: High]
When a transfer times out, this sets i2c->current_msg to NULL and returns,
which allows the caller to free the message buffer. What happens if the ISR
is running concurrently on another CPU and has already cached current_msg?

Could the ISR proceed to access the freed msg->buf, causing a
use-after-free?

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
> +
> +		if (msg->flags & I2C_M_RD)
> +			ret =3D nvt_i2c_read(i2c, msg);
> +		else
> +			ret =3D nvt_i2c_write(i2c, msg);

[Severity: High]
Is it intentional to unconditionally pass msgs[0] to nvt_i2c_set_subaddr()
and only execute the transfer for msgs[1]?

If msgs[0] is actually a read request, its buffer could be uninitialized
memory, which nvt_i2c_set_subaddr() might then read and write to the
hardware register, potentially leaking kernel memory. Additionally, wouldn't
this break the API contract by silently dropping the first message of a
valid 2-message sequence?

[ ... ]
> +static int nvt_i2c_parse_dts(struct nvt_i2c_bus *i2c)
> +{
> +	int ret;
> +	struct device *dev =3D i2c->dev;
> +	struct device_node *np =3D dev->of_node;
> +	const char *hwmods_val =3D NULL;
> +
> +	/* read DTS(novatek,hwmods) and set bus number */
> +	ret =3D of_property_read_string(np, "novatek,hwmods", &hwmods_val);
> +	if (ret =3D=3D 0) {
> +		i2c->adapter.nr =3D nvt_i2c_get_hwmods(hwmods_val);

[Severity: Medium]
Is there a specific reason to use a custom property like 'novatek,hwmods'
for assigning the I2C bus number? Typically, fixed indices for I2C
controllers are assigned using standard device tree aliases, like this:
aliases { i2c0 =3D &i2c_node; };

[ ... ]
> +static int nvt_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	nvt_i2c_init(i2c);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		I2C_ERR_LOG("No IRQ resource\n");
> +		return irq;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, nvt_i2c_isr,

[Severity: High]
The nvt_i2c_init() function enables hardware interrupts before the handler
is registered by devm_request_irq(). If the controller already has a
pending interrupt on boot, won't this trigger an immediate interrupt storm,
especially since the ISR returns IRQ_NONE when current_msg is NULL?

[ ... ]
> +	ret =3D i2c_add_numbered_adapter(&i2c->adapter);
> +	if (ret) {
> +		I2C_ERR_LOG("[%s] failed to add adapter\n", dev_name(&pdev->dev));
> +		return ret;
> +	}

[Severity: Medium]
If i2c_add_numbered_adapter() fails, does this error path need to call
of_node_put() to release the reference to i2c->adapter.dev.of_node
acquired earlier via of_node_get()?

[ ... ]
> +static void nvt_i2c_remove(struct platform_device *pdev)
> +{
> +	struct nvt_i2c_bus *i2c =3D platform_get_drvdata(pdev);
> +
> +	writel(I2C_IRQ_DISABLE_SETTING, i2c->base + I2C_REG_INTR);
> +	writel(readl(i2c->base + I2C_REG_CTRL) & ~I2C_ENABLE,
> +	       i2c->base + I2C_REG_CTRL);
> +	of_node_put(i2c->adapter.dev.of_node);
> +	i2c_del_adapter(&i2c->adapter);
> +}

[Severity: High]
By disabling the I2C controller and its interrupts before calling
i2c_del_adapter(), couldn't we interrupt active I2C operations?

If a transfer is ongoing concurrently, disabling the hardware out from under
it will cause it to stall and time out. Should i2c_del_adapter() be called
first to cleanly block new transfers and wait for active ones to finish?

> +
> +static const struct dev_pm_ops nvt_i2c_pm_ops =3D {
> +	.resume_early =3D nvt_i2c_resume,
> +	.suspend_late =3D nvt_i2c_suspend,
> +};

[Severity: Low]
Should these callbacks be wrapped with pm_sleep_ptr()? When CONFIG_PM_SLEEP
is disabled, these functions and the struct assignment below will become
dead code and might trigger compiler warnings.

> +
> +static struct platform_driver nvt_i2c_driver =3D {
> +	.probe =3D nvt_i2c_probe,
> +	.remove =3D nvt_i2c_remove,
> +	.driver =3D {
> +		.name =3D "nvt_nt726xx_i2c",
> +		.owner =3D THIS_MODULE,
> +		.pm =3D &nvt_i2c_pm_ops,

[Severity: Low]
Can we wrap the pm_ops pointer with pm_ptr() to ensure it compiles away cle=
anly
when CONFIG_PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715073521.1476=
10-1-Nina_Kuo@novatek.com.tw?part=3D3
