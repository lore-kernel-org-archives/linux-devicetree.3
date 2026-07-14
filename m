Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1235BDC7
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028714; cv=none; b=JtO7OA2W2rfqrtb5xLxQoPyT5KZv/zuefvAv9G6dq1OeTJLkh5p6IBKC/IjdiZF3eHyo1mndRjir9eZs8MCtzUK2I7v6DEP0tln8o675EuT9BV0cYYqHgsLrKZtKcVResGoJa7YCxbveu7VM5TOEmXReYU3zbF3pIGPtbmEiD1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028714; c=relaxed/simple;
	bh=FfOPjnuz7QtdM4YS/c6xrKtzHCqvsdCzBb/9HRmTy4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qOS4YWiDXYmqaoTldwvP+Xf4yNT8EgTR2G5gGeuj4TCXZZUEC43QOzYJEF5aMHIeOhVLSLs3/81HDhcAEYcZyTi2q5KCCRk8a1xx0QMirCI45P8dHgdHM0CuSUspApPGg+wAn9Xk8GdfqgA4T2LJwuuHqSbNiyV47eokaWB/z68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJdgzk24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJdgzk24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE771F000E9;
	Tue, 14 Jul 2026 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784028712;
	bh=QQeoHKLcjTnsjCJVP09/mJ0h3b2GJCBITeElAgPA3k0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJdgzk24p4YXxXPCDdbJygRyBbCuWkpOw2ur6bS4iRtHXJuSCxPKg1TwtrZm8SASZ
	 FycsuVREg81bk817vysadpedV/E+clRyeMoW5xl/qaaKPhzUWBZynyEK08cX7g2F36
	 ZoG/PzaBcoO14kyKxSL0SE0SNJD6KO6i6Gwu16r4saM7BVhZFoDPGAQ+5Swl1fRHYk
	 7Xx0auLAab10AxYMvTxjimlLWEVMyZyEhrQ49qGXJUmpVp2d8pVUZJVuSguh2dozY1
	 kR3KjCTUzipu5zUjRbpNSG07FvyHWeUx/qEaZpvJTx5mZPntweIpqaO/in1UD2gy26
	 iaIGIlovzLkKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, conor+dt@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260714092053.2461482-8-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 11:31:51 +0000
Message-Id: <20260714113152.0DE771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Child driver illegaly overwrites the parent MFD device's private d=
ata, causing type confusion and kernel panics.
- [High] The SMBus timeout formula underestimates minimum physical wire tim=
e, causing large block transfers to inevitably fail with -ETIMEDOUT.
- [High] Target ports configured as "i2c" are left completely disconnected =
and functionally dead.
- [High] Use-After-Free of device structure embedded in devm-allocated memo=
ry during driver unbind.
- [Medium] Missing I2C adapter quirks causes undocumented rigid transfer si=
ze limits.
--

--- Patch [7]: [PATCH v14 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x=
4x I3C hub functionality ---
commit cfe07c5ef0a917e7757bc31fa34e458df22a78ed
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
These devices support downstream target ports that can be configured
as I3C, I2C, or SMBus.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_=
i3c_hub.h
> index 0000000000000..e7ab243bbfff6
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
[ ... ]
> +/* Hub SMBus transaction time */
> +#define P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(x)		((20 * (x)) + 80)

[Severity: High]
Is this timeout formula sufficient for large SMBus block transfers?

At 400kHz, each 9-bit I2C byte takes 22.5 us. For a 32-byte payload plus a
1-byte address, the minimum physical wire time is 33 * 22.5 =3D 742.5 us.
However, the formula 20 * x + 80 allocates only 720 us for a 32-byte payloa=
d.

If a large payload message is sent, the timeout will trigger in
p3h2x4x_read_smbus_transaction_status() before the transfer can complete on
the wire, causing it to fail with a timeout.

[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> index 0000000000000..2fd9723da60d9
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
[ ... ]
> +static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *node;
> +	int ret, i;
> +
> +	p3h2x4x_i3c_hub =3D devm_kzalloc(dev, sizeof(*p3h2x4x_i3c_hub), GFP_KER=
NEL);

[Severity: High]
Could this lead to a use-after-free during driver unbind?

The p3h2x4x_i3c_hub structure is allocated via devm_kzalloc() and contains
struct i3c_master_controller instances, which in turn embed struct device.

When the devm action calls i3c_master_unregister() on driver unbind, it
invokes device_unregister(). Because device_unregister() does not block to
wait for all sysfs references to drop, userspace might still hold reference=
s.
When devm subsequently frees the containing p3h2x4x_i3c_hub_dev structure,
accessing those remaining references will cause a use-after-free.

> +	if (!p3h2x4x_i3c_hub)
> +		return -ENOMEM;
[ ... ]
> +	/* Register virtual I3C master controllers for I3C target ports */
> +	if (p3h2x4x->i3cdev) {
> +		p3h2x4x_i3c_hub->i3cdev =3D p3h2x4x->i3cdev;
> +		i3cdev_set_drvdata(p3h2x4x->i3cdev, p3h2x4x_i3c_hub);

[Severity: High]
Does this code safely manage the parent device's private data?

By calling i3cdev_set_drvdata() on p3h2x4x->i3cdev here in
p3h2x4x_i3c_hub_probe(), it replaces the MFD parent's drvdata with the child
driver's context. If any parent callbacks try to retrieve their data, they
will incorrectly cast struct p3h2x4x_i3c_hub_dev to struct p3h2x4x, leading
to type confusion and data corruption.

> +		ret =3D p3h2x4x_tp_i3c_algo(p3h2x4x_i3c_hub);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to register i3c bus\n");
> +	}
[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> index 0000000000000..0e5bf7eb3cf7f
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
[ ... ]
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
[ ... ]
> +	for (tp =3D 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_I3=
C)
> +			continue;

[Severity: High]
Will target ports configured as i2c in the device tree be registered?

The p3h2x4x_tp_i3c_algo() function explicitly skips ports unless they are in
I3C mode. Similarly, p3h2x4x_tp_smbus_algo() skips ports unless they are in
SMBus mode. As a result, ports configured as i2c are ignored entirely and
never registered or enabled in the hardware's network configuration mask.

> +
> +		struct i3c_hub_controller *hub_controller =3D
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index 0000000000000..b991c46f3ed59
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
[ ... ]
> +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg =
*msgs, int num)
> +{
[ ... ]
> +	for (msg_count =3D 0; msg_count < num; msg_count++) {
> +		if (msgs[msg_count].len > P3H2X4X_SMBUS_PAYLOAD_SIZE) {
> +			dev_err(p3h2x4x_i3c_hub->dev,
> +				"Message nr. %d not sent - length over %d bytes.\n",
> +				msg_count, P3H2X4X_SMBUS_PAYLOAD_SIZE);
> +			return -EINVAL;
> +		}

[Severity: Medium]
Would it be better to expose this size limitation to the I2C subsystem?

By enforcing a hard boundary here dynamically in p3h2x4x_tp_i2c_xfer()
without populating the i2c_adapter_quirks structure, the I2C subsystem
cannot automatically split up oversized reads and writes for the client.
This will result in unexpected failures for standard transactions that exce=
ed
84 bytes.

> +
> +		rw =3D (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714092053.2461=
482-1-lakshay.piplani@nxp.com?part=3D7
