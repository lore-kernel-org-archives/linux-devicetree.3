Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39038340403
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 04:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780632491; cv=none; b=cVF5Wif1kP51Q5QRovwKX/m1NbXweoqtLWmFuHRKj2BecJasxj07mHILeodoaIaCDjOaiHfZJf/q/LtHGpx3IGhJKaAVHGGLI/OcmeUNQn3Oi8/X46DpX9WjXsjKSgyOnJJ4QuQ1Cde7mezF0lS0DqqajL7aRsxnTuivMo7g1xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780632491; c=relaxed/simple;
	bh=UcoBvl/wnimxVl4VgfaiuFOGs7Vohv/r7K7M7eo4WCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D137VGLEd1uumdnfxAVq1eGXwlrTOd8topfhnGAfirNR234Uh5d1icZT9Z89gMZt3me1yOIZj1b7HAQNi/PAT44SYyF97DNtTCi0O/y32NMXCqg8TzL1rUW3wBDAEwLQmOhs1EkH7blaBWB0dBQaVqD88ZTP1TXIDqUN0no+9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK+raqrF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK+raqrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F10B1F00893;
	Fri,  5 Jun 2026 04:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780632487;
	bh=nfXLFDdwH8rvNomqL2WSuz2+Q9SyI7f1ZUNCB5G93wc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JK+raqrFOUQOvMMwkY66VV95Ev9YpOKWapABTKmHIT0U0mcj3cB9nnjQyWxLdY71j
	 AA8pTLv/AnwceQSQTJM1b/TyImOmONkBMU1THucR7D5n39RKPyeM59QkIVL//Jj2st
	 ZO4m/2VZ2aqzjnxKp6ADl9+Dk416XzWSpYPJE+2PaTkPkba8ZNkunmNH9m3pK1UQkZ
	 SaCUnDyD6cU/wd1LyESZSH08puZzJ5ul8prvSIRC46QhJBVePYrWfXru6L/rHoMR5A
	 RyumncUnuLee/QeVPntpsp673bp1iRVzejeuVvMr+sKAS8bcMO+mo7VbdZsYfm9CA2
	 SEfnVm4YYSNJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i2c: Add i2c-nt726xx.c i2c driver for Novatek
 NT726xx SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: SP_ISW1_AT@novatek.com.tw
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605035629.383439-1-SP_ISW1_AT@novatek.com.tw>
References: <20260605035629.383439-1-SP_ISW1_AT@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 04:08:07 +0000
Message-Id: <20260605040807.8F10B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Hardcoded physical addresses mapped via ioremap() without NULL che=
cks, and unprotected read-modify-write on shared global registers.
- [High] Driver breaks generic I2C transfers by unconditionally hijacking a=
ny 2-message array.
- [High] The ISR returns IRQ_NONE without clearing the hardware interrupt s=
tatus when current_msg is NULL.
- [High] Missing synchronization between the transfer timeout path and the =
ISR leads to a use-after-free.
- [High] Interrupts are enabled in hardware before the IRQ handler is regis=
tered, and are leaked enabled on probe failure paths.
- [High] The I2C hardware and interrupts are disabled before the adapter is=
 unregistered in the remove function.
- [Medium] Using a custom Device Tree property to statically assign the I2C=
 bus number.
- [Medium] Device Tree node reference is permanently leaked on the adapter =
registration error path.
- [Low] Unconditional assignment of PM callbacks causes dead code when PM i=
s disabled.
--

commit 2b999343fc99d6d31a3c1ef33d691ee2f0f37f51
Author: Ben Huang <Ben_Huang@novatek.com.tw>

i2c: Add i2c-nt726xx.c i2c driver for Novatek NT726xx SoCs

This patch introduces support for the I2C bus controller of Novatek
NT726xx SoCs. It performs fundamental read/write functions and supports
Standard-mode and Fast-mode.

> diff --git a/drivers/i2c/busses/i2c-nt726xx.c b/drivers/i2c/busses/i2c-nt=
726xx.c
> new file mode 100644
> index 0000000000000..921f47b7dd551
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt726xx.c
[ ... ]
> +static void nvt_i2c_use_case_feature(struct nvt_i2c_bus *i2c)
> +{
> +	void __iomem *reg_tmp;
> +
> +	if (i2c->stbc_i2c) {
> +		reg_tmp =3D ioremap(STBC_PASSWORD, 4);
> +		writel(readl(reg_tmp) | STBC_PASSWORD_DATA1, reg_tmp);
> +		writel(readl(reg_tmp) | STBC_PASSWORD_DATA2, reg_tmp);

[Severity: High]
Does this code map a hardcoded physical address without checking the return
value of ioremap()? If the mapping fails, readl() will dereference a NULL
pointer. Additionally, is it safe to perform an unprotected read-modify-wri=
te
on these shared global registers, or could it corrupt state if other drivers
concurrently access the Standby Controller?

> +		iounmap(reg_tmp);
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
If the hardware asserts an interrupt and i2c->current_msg is NULL, does
this early return skip clearing the hardware interrupt status? The write
to clear the interrupt at the end of the ISR is bypassed, which could leave
the IRQ line asserted and cause an infinite interrupt loop.

> +
> +	if (status & I2C_IRQ_NACK) {
[ ... ]
> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
[ ... ]
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

[Severity: High]
Can a use-after-free happen here if the timeout path races with the ISR?
If a transfer times out, nvt_i2c_reset() is called and current_msg is set
to NULL, but there is no synchronization (like a spinlock or
synchronize_irq()) to wait for a concurrently running ISR to finish. If the
ISR checks current_msg before it is set to NULL, the thread could return and
free msg->buf while the ISR continues to execute nvt_i2c_handle().

> +
> +	return i2c->error_code;
> +}
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
Does this code unconditionally intercept all 2-message arrays? By consuming
msgs[0] as a subaddress and only transmitting msgs[1], this breaks standard
I2C semantics if a user-space application or generic kernel driver issues a
regular 2-message transfer. If the first message is a read, could it lead
to reading from an uninitialized buffer and writing it to the register?

> +
> +		if (msg->flags & I2C_M_RD)
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
Is it appropriate to use a custom Device Tree property like novatek,hwmods
to statically assign the I2C adapter number? The standard Linux mechanism
for assigning bus numbers relies on the aliases node in the Device Tree
rather than custom properties.

> +		if (i2c->adapter.nr >=3D 0) {
[ ... ]
> +static int nvt_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D nvt_i2c_parse_dts(i2c);
> +	if (ret)
> +		return ret;
> +
> +	nvt_i2c_init(i2c);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		I2C_ERR_LOG("No IRQ resource\n");
> +		return irq;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, nvt_i2c_isr,
> +			       IRQF_SHARED | IRQF_TRIGGER_HIGH, I2C_NAME, i2c);

[Severity: High]
Does nvt_i2c_init() enable hardware interrupts before devm_request_irq()
registers the software handler? If the hardware has a pending interrupt,
the kernel might receive it prematurely. Furthermore, if probe fails on
subsequent calls like devm_request_irq(), are these interrupts left enabled
in the hardware, potentially causing an unhandled interrupt storm on a
shared line?

> +	if (ret) {
> +		I2C_ERR_LOG("devm_request_irq fail\n");
> +		return ret;
> +	}
> +
> +	/* Setup I2C adapter */
> +	i2c->adapter.owner =3D THIS_MODULE;
> +	i2c->adapter.class =3D I2C_CLASS_HWMON;
> +	i2c->adapter.algo =3D &nvt_i2c_algo;
> +	i2c->adapter.dev.of_node =3D of_node_get(pdev->dev.of_node);
> +	i2c->adapter.dev.parent =3D &pdev->dev;
> +	i2c->adapter.timeout =3D 3 * HZ;
> +	strscpy(i2c->adapter.name, I2C_NAME, sizeof(i2c->adapter.name));
> +	i2c_set_adapdata(&i2c->adapter, i2c);
> +
> +	ret =3D i2c_add_numbered_adapter(&i2c->adapter);
> +	if (ret) {
> +		I2C_ERR_LOG("[%s] failed to add adapter\n", dev_name(&pdev->dev));
> +		return ret;

[Severity: Medium]
If i2c_add_numbered_adapter() fails, does this return path leak the OF node
reference? The node was acquired just above with of_node_get(), and
returning directly here skips calling of_node_put().

> +	}
> +
> +	platform_set_drvdata(pdev, i2c);
> +
> +	return 0;
> +}
> +
> +static void nvt_i2c_remove(struct platform_device *pdev)
> +{
> +	struct nvt_i2c_bus *i2c =3D platform_get_drvdata(pdev);
> +
> +	writel(I2C_IRQ_DISABLE_SETTING, i2c->base + I2C_REG_INTR);
> +	writel(readl(i2c->base + I2C_REG_CTRL) & ~I2C_ENABLE,
> +	       i2c->base + I2C_REG_CTRL);
> +	of_node_put(i2c->adapter.dev.of_node);
> +	i2c_del_adapter(&i2c->adapter);

[Severity: High]
Is the teardown order reversed here? The code disables the I2C hardware and
interrupts before calling i2c_del_adapter(). If an active transaction is
running, this will forcefully break it. Additionally, i2c_del_adapter()
ensures synchronization by draining and blocking transfers, so it should
be called first before shutting down the hardware.

> +}
> +
> +static const struct dev_pm_ops nvt_i2c_pm_ops =3D {
> +	.resume_early =3D nvt_i2c_resume,
> +	.suspend_late =3D nvt_i2c_suspend,
> +};

[Severity: Low]
Are the pm_sleep_ptr() wrappers missing here? Without wrapping the callbacks
in the dev_pm_ops structure, this will result in dead code being compiled
into the kernel when CONFIG_PM_SLEEP is disabled.

> +
> +static struct platform_driver nvt_i2c_driver =3D {
> +	.probe =3D nvt_i2c_probe,
> +	.remove =3D nvt_i2c_remove,
> +	.driver =3D {
> +		.name =3D "nvt_i2c",
> +		.owner =3D THIS_MODULE,
> +		.pm =3D &nvt_i2c_pm_ops,

[Severity: Low]
Does this assignment need a pm_ptr() wrapper to avoid dead code when PM is
disabled?

> +		.of_match_table =3D of_match_ptr(nvt_i2c_of_match),
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605035614.3833=
87-1-SP_ISW1_AT@novatek.com.tw?part=3D3
