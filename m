Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49641376A1A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397340; cv=none; b=GV7A64Xcrf16SS7ingWlQN1cLSfMhR3S3+gYFRLiUFmwQDUOloZoiru1n1ZfpSwigiy0H8H/xTGdl2YNP7E+X0xBEX4MrtXKH6888A6HAPRk9v6nTkq+542KT814RWmkNPkytVF/MI4+sD53C0CL088ufdLykbLQebI0rIKT/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397340; c=relaxed/simple;
	bh=KLTBxf0M69S8Pk3jTonJf5J/5MBZXc+AGWjWgFkP2es=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kEEbbjRISZjUTujcRZVLvcm23BKb6bhWmM61DeNqzrkBfS6QwvfStXE9aoI3MUhpaPrDy4lLCMthoWTe4uMn5bxag5DAvKh/p9lIq/yjmkCJH0lcJc+a3k+wG/AJ9AFvYSN/aqSE+gzztZ2CEqPDUZxMJEXXBokd4eEe1SjAZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFEHTAiO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFEHTAiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E711F000E9;
	Thu, 30 Jul 2026 07:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785397339;
	bh=hidy1DeoRY+clSVabRNj5bhzMp/AyXbCGjG8aqgFvpU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IFEHTAiOgnkuUtREsjCu043+cqvoyLzVqX070dV3XY1Q/G3w33P2eVVdBaZfinn0T
	 0bNLzqrMAENOPqW01DFW9h2g42G0bYRWvv54H9h5mtcHDczSzevbO5mMZXJ0y3wh6N
	 Hcx5VtChgCyc2FzZ27mK9qFiI+Rfyd7TpkiFAmJxGFOQFXlGiUtySW23VhS59VFvb3
	 vskOhRJ3hAnIpbzOwxYqUJKFOOGcOuUhZB/RQt8J6R0umJQ1o5IJ2WvgqwfZgS9lmm
	 lv4uURwyk5oGaORWVvI2r+yBaDG618vRM1Si7P5tr0EPKqVOWs46VP2PTxyNYjOcZ3
	 QxjUqoyPJfPog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i2c: nt72676: Add Novatek NT72676 I2C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: nina_kuo@novatek.com.tw
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730072529.492398-3-nina_kuo@novatek.com.tw>
References: <20260730072529.492398-1-nina_kuo@novatek.com.tw>
 <20260730072529.492398-3-nina_kuo@novatek.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 07:42:18 +0000
Message-Id: <20260730074218.D0E711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver unconditionally treats any 2-message transfer as a suba=
ddress operation, breaking I2C protocol semantics and leaking memory.
- [High] The interrupt handler improperly handles flags and active transfer=
s, causing unacknowledged hardware interrupts and infinite interrupt storms.
- [High] Incorrect teardown order in `nvt_i2c_remove()` disables the I2C co=
ntroller hardware before unregistering the adapter.
- [High] The driver fails to clear previous address and operation bits in `=
I2C_REG_CTRL` across multiple messages, corrupting I2C target addresses and=
 read/write commands.
- [High] A race condition between the transfer timeout path and the interru=
pt handler leads to a Use-After-Free (UAF) of the I2C message buffer.
- [Medium] The driver fails to disable hardware interrupts in the probe err=
or path, risking unhandled interrupts on a shared line.
- [Medium] The driver unconditionally dereferences the result of `of_device=
_get_match_data()` without checking for `NULL`, leading to a kernel crash o=
n non-Device Tree platforms.
--

--- Patch [2]: [PATCH v4 2/3] i2c: nt72676: Add Novatek NT72676 I2C control=
ler driver ---
commit 24e2f090fd92d0b0a276a1df0dc4a6e78c1ccda9
Author: Ben Huang <Ben_Huang@novatek.com.tw>

i2c: nt72676: Add Novatek NT72676 I2C controller driver

This commit adds the I2C controller driver for the Novatek NT72676 SoC.
It supports Standard-mode and Fast-mode I2C operations as a bus master.

> diff --git a/drivers/i2c/busses/i2c-nt72676.c b/drivers/i2c/busses/i2c-nt=
72676.c
> new file mode 100644
> index 0000000000000..138b01dd98a7f
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nt72676.c
> @@ -0,0 +1,683 @@
[ ... ]
> +static irqreturn_t nvt_i2c_isr(int irq, void *dev_id)
> +{
> +	struct nvt_i2c_bus *i2c =3D dev_id;
> +	struct i2c_msg *msg =3D i2c->current_msg;
> +	unsigned int status =3D nt72676_i2c_readl(i2c, I2C_REG_INTR);
> +	unsigned int clr =3D 0;
> +	int do_complete =3D 0;
> +
> +	if (!(status & I2C_IRQ_FLAG) || !i2c->current_msg)
> +		return IRQ_NONE;

[Severity: High]
Will this cause an interrupt storm?

If a spurious interrupt occurs or an interrupt fires after a timeout when
current_msg is NULL, the handler returns IRQ_NONE without clearing the
interrupt flags.

Since the interrupt is requested with IRQF_TRIGGER_HIGH, failing to clear t=
he
hardware state will leave the interrupt line continuously asserted.

[ ... ]
> +static int nvt_i2c_write(struct nvt_i2c_bus *i2c, struct i2c_msg *msg)
> +{
[ ... ]
> +	ctrl_mask =3D nt72676_i2c_readl(i2c, I2C_REG_CTRL);
> +	ctrl_mask |=3D (((msg->addr << 1) << 8) | I2C_ENABLE |
> +			I2C_CLOCK_DUTY_ENABLE | I2C_CLOCK_STRETCH_ENABLE |
> +			I2C_MASTER_CLK_STRETCH_ENABLE | I2C_TRIGGER);
> +	nt72676_i2c_writel(ctrl_mask, i2c, I2C_REG_CTRL);

[Severity: High]
Does this construct a valid control mask for subsequent messages?

The new address and flags are bitwise-ORed onto the existing I2C_REG_CTRL
value without clearing the previous bits.

In a multi-message transfer where subsequent messages have different addres=
ses
or read/write directions, the accumulated bits might corrupt the target
address and operation commands.

> +
> +	ret =3D wait_for_completion_timeout(&i2c->msg_complete, i2c->adapter.ti=
meout);
> +	if (ret =3D=3D 0) {
> +		i2c->error_code =3D -ETIMEDOUT;
> +		nvt_i2c_reset(i2c);
> +	}

[Severity: High]
Is there a race condition between this timeout path and the interrupt handl=
er?

If a transfer times out exactly as the hardware interrupt fires, the timeout
path resets the hardware and returns to the caller, which may then free the
message buffer.

Because this does not synchronize with the ISR (for instance, by disabling =
the
interrupt or taking a lock), the ISR can concurrently access i2c->current_m=
sg
and dereference a freed buffer when handling the late interrupt.

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
Does this correctly handle all two-message transfers?

The driver unconditionally treats any 2-message transfer as a subaddress
write operation. It reads from msgs[0].buf to populate the subaddress
register and then drops msgs[0].

If a client initiates a standard two-message sequence (like a sequential
read), the first message buffer might be uninitialized, and the first messa=
ge
will be dropped, breaking standard I2C protocol semantics.

[ ... ]
> +static int nvt_i2c_parse_dts(struct nvt_i2c_bus *i2c)
> +{
> +	int ret;
> +	struct device *dev =3D i2c->dev;
> +	struct device_node *np =3D dev->of_node;
> +
> +	i2c->comp_data =3D of_device_get_match_data(dev);
> +
> +	/* read DTS(novatek,stbc-syscon) for STBC I2C */
> +	if (i2c->comp_data->stbc_i2c) {

[Severity: Medium]
Can of_device_get_match_data() return NULL here?

If the driver is instantiated via sysfs bind or legacy platform matching
on a non-Device-Tree platform, this will return NULL.

Dereferencing i2c->comp_data immediately after will cause a NULL pointer
dereference.

[ ... ]
> +static int nvt_i2c_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D i2c_add_adapter(&i2c->adapter);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to add adapter\n");
> +		return ret;
> +	}

[Severity: Medium]
Should the hardware interrupts be disabled before returning here?

If i2c_add_adapter() fails, the probe function returns an error without
disabling the I2C interrupts in the hardware.

The devres cleanup will free the interrupt handler, but the hardware might
still be enabled and assert the shared IRQ line, resulting in an unhandled
interrupt storm.

[ ... ]
> +static void nvt_i2c_remove(struct platform_device *pdev)
> +{
> +	struct nvt_i2c_bus *i2c =3D platform_get_drvdata(pdev);
> +
> +	nt72676_i2c_writel(I2C_IRQ_DISABLE_SETTING, i2c, I2C_REG_INTR);
> +	nt72676_i2c_writel(nt72676_i2c_readl(i2c, I2C_REG_CTRL) & ~I2C_ENABLE,
> +			   i2c, I2C_REG_CTRL);
> +	i2c_del_adapter(&i2c->adapter);
> +}

[Severity: High]
Is this teardown order correct?

The hardware is disabled before i2c_del_adapter() unregisters the clients.

Many client drivers need to perform I2C transfers in their remove() functio=
ns
to gracefully power down devices. Disabling the controller hardware first
guarantees that these shutdown transfers will fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730072529.4923=
98-1-nina_kuo@novatek.com.tw?part=3D2
