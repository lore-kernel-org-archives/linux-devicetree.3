Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C13343D7F
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945749; cv=none; b=Scy0oiT7OjGJTUy6TqbzEaxhJeNknEuy4yaUMyg2AGKojSuIgxgMKGiZTvfQjAxuOaAKNUZZvmJOyI2Y2ZkFbyTJ4fL8MEJQExzJzlgtn5PrzazWF0Z3uwF8h2rPmEddSN0tAlByk26dWgCl2FNqFELRPepMtn2LlYpNa5uA03s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945749; c=relaxed/simple;
	bh=4/mv+sJLDfY2fJ0an1a45ML9wMBsZpoweWbWqNHieik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qJ4woLZO7j3Is7AZlocJSCZB9V5lYDJ28YElBLUpQh74yEOYQfBq3Cpq7upNf0i61imTRxc8/DLGxoXX2rKX4gGmGcpX9XqjUmlC/vhV/9Lb7S+Gaoh+vhPPg6u4FKwhkVzXFj2nzgbhfFbH/qhmYVBbHuCMbdqZrM4bmTZ5cQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUcgN07+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUcgN07+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8341F000E9;
	Fri, 28 Aug 2026 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787945747;
	bh=nbNMfePVJR9CI5tQ+37IJV6hYXrZnkLK9bNwv1DFARo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OUcgN07+A9Tdtqw6i95f7eQodFCtoAyP1/0bDrdTWdFYRf81cOeW50X7jqLNdr14A
	 8fJPewWGd86NVcjotRbo78cIPBhkawNdAg2FQyADQZ0qy1P4wjr1uUgYC9J3ufE1fJ
	 d4NPWWGxvrPLCz8OOvHySm8lrAIOUm5DFeCvrOYDWhupdyOcAuevARu406tjzVl8fH
	 E373njJHSaeGJe3KWmm8tdTrutUm2OO4zo2Vu04IeSsnUmZuXsOf+5WwK81bzjdVFh
	 dTW2SrNs0qNKsN36shuJ9Z38Kqwqx3qo2ooiu/ukk/MO79vsbgNLGyNUtOhc53iAZ4
	 fnJCTa/g508tA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: renesas: Add Renesas Multi-Protocol PHY driver
 for R-Car X5H
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260828192223.402422-2-marek.vasut+renesas@mailbox.org>
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
 <20260828192223.402422-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 19:35:46 +0000
Message-Id: <20260828193546.AB8341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] Regmap readable and writable ranges specify inverted address bound=
s and omit valid registers, preventing the driver from initializing hardwar=
e registers.
- [High] Runtime PM usage counter leaks when `mp_phy_init()` encounters an =
error or returns early.
- [High] Missing firmware size validation leads to out-of-bounds memory acc=
esses and memory-mapped I/O corruption.
- [High] Inconsistent use of `phy->id` in PCIe initialization leads to inco=
rrect port configuration and out-of-bounds register accesses.
- [High] `mp_phy_suspend()` clears `chan->initialized` without dropping PM =
domains, permanently bricking PHY channels after a suspend/resume cycle.
- [High] Unconditional register access in `mp_phy_resume()` for all channel=
s without checking if their respective power domains are turned on.
- [Medium] Memory and resource leaks in `mp_phy_probe()` error paths: firmw=
are buffer and attached power domains are not released on subsequent initia=
lization failures.
- [Medium] Asynchronous `pm_runtime_put()` is immediately followed by `pm_r=
untime_disable()` during device removal, violating PM subsystem guidelines.
- [Medium] Missing bounds check on device tree index in `mp_phy_xlate()` le=
ads to an out-of-bounds array access.
- [Medium] `reset_control_bulk_deassert()` iterates sequentially, violating=
 the hardware requirement to deassert `mpphy02` last.
- [Medium] PHY provider is exposed to consumers before PHY instances are cr=
eated and hardware is powered on.
--

commit 54820191afa1ae9e0aa531e1706a7cd7acbab1ca
Author: Thanh Quan <thanh.quan.xn@renesas.com>
Subject: phy: renesas: Add Renesas Multi-Protocol PHY driver for R-Car X5H

This commit introduces a new Renesas Multi-Protocol PHY driver for the R-Car
X5H SoC. It supports multiplexing five input IPs (PCIe4, USB 3.2, Ethernet)
to four separate IO blocks based on the device tree configuration.

> diff --git a/drivers/phy/renesas/phy-rcar-gen5-mpphy.c b/drivers/phy/rene=
sas/phy-rcar-gen5-mpphy.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/renesas/phy-rcar-gen5-mpphy.c
[ ... ]
> +#define MPPHY_PX_RD_RANGE(n)						\
> +	regmap_reg_range(MPPHY_PXCNTXT1(n), MPPHY_CHAN_BASE(n)),	\
> +	regmap_reg_range(MPPHY_PXREFCLK(n), MPPHY_PXREFCLK(n)),		\
> +	regmap_reg_range(MPPHY_PXRXREQ1(n), MPPHY_PXRXREQ1(n)),		\
> +	regmap_reg_range(MPPHY_PXRXCNT(n), MPPHY_PXRXCNT(n)),		\
> +	regmap_reg_range(MPPHY_PXSRAMCNT(n), MPPHY_PXTXREQ(n))

[Severity: High]
Does this inverted range cause regmap to reject accesses?
MPPHY_PXCNTXT1(n) is defined as (MPPHY_CHAN_BASE(n) + 0x4).
Since range_min > range_max, regmap_reg_range will set a range where the
minimum is greater than the maximum, preventing the driver from reading
these hardware registers during initialization.

[ ... ]
> +static void mp_phy_update_firmware(struct phy *phy)
> +{
> +	struct mp_phy_priv *priv =3D phy_get_drvdata(phy);
> +	int i;
> +
> +	for (i =3D 0; i < priv->fw->size; i +=3D 2) {
> +		writew(priv->fw->data[i] | (priv->fw->data[i + 1] << 8),
> +		       priv->base + MPPHY_FW_BASE + (MPPHY_FW_CH_OFFSET * phy->id) + i=
);
> +	}
> +}

[Severity: High]
Does this code risk an out-of-bounds read or memory corruption if the
firmware size is odd or larger than expected?
Since mp_phy_parse_dt() doesn't validate priv->fw->size, a large firmware
file could write beyond the allocated MPPHY_FW_CH_OFFSET (0x20000) or outsi=
de
the I/O region completely. If the size is odd, reading priv->fw->data[i + 1]
will result in an out-of-bounds access.

[ ... ]
> +static int mp_phy_init_pcie4(struct phy *phy)
> +{
> +	struct mp_phy_priv *priv =3D phy_get_drvdata(phy);
> +
> +	if (priv->num_lanes[phy->id] =3D=3D 1 || priv->num_lanes[phy->id] =3D=
=3D 2) {
> +		if (phy->id =3D=3D 0) {
> +			regmap_set_bits(priv->map, MPPHY_PXCNTXT1(0), 0x2010002);
> +			regmap_set_bits(priv->map, MPPHY_PXCNTXT2(0), 0x2020201);
> +			regmap_set_bits(priv->map, MPPHY_PXTXREQ(0), 0x80004);
> +			regmap_set_bits(priv->map, MPPHY_PXREFCLK(0), 0x30);
> +			regmap_set_bits(priv->map, MPPHY_PXREFCLK(0), 0x4);
> +			regmap_set_bits(priv->map, MPPHY_PXREFCLK(0), 0x1);
> +			regmap_set_bits(priv->map, MPPHY_PXRXCNT(0), 0x202);
> +			regmap_clear_bits(priv->map, MPPHY_PXRXCNT(0), 0x202);
> +		} else if (phy->id =3D=3D 1) {
> +			regmap_set_bits(priv->map, MPPHY_PXCNTXT1(2), 0x2010002);

[Severity: High]
Is phy->id used consistently here?
The code seems to treat phy->id as a controller index rather than a port in=
dex,
ignoring cases where phy->id is 2 or 3. This could lead to incorrect port
configuration if phy->id maps directly to the port being initialized.

[ ... ]
> +static int mp_phy_init(struct phy *phy)
> +{
> +	struct mp_phy_priv *priv =3D phy_get_drvdata(phy);
> +	struct mp_phy_chan_priv *chan =3D &priv->chan[phy->id];
> +	int ret;
> +
> +	/*
> +	 * Note: Current source code support for Ethernet, PCIe
> +	 * initialization is based on the bare metal code shared
> +	 * by the board team.
> +	 */
> +	ret =3D pm_runtime_get_sync(priv->pd_list->pd_devs[phy->id]);
> +	if (ret < 0) {
> +		dev_err(priv->dev,
> +			"Failed to power on domain for channel %d: %d\n",
> +			phy->id, ret);
> +		return ret;
> +	}
> +
> +	/* Check if initialized with same protocol then skip */
> +	if (chan->initialized)
> +		return 0;

[Severity: High]
Does this code leak the power management usage counter?
If chan->initialized is true, the function returns directly without dropping
the reference acquired by pm_runtime_get_sync().

> +
> +	if (chan->protocol_id =3D=3D PHY_MODE_PCIE)
> +		ret =3D mp_phy_init_pcie4(phy);
> +	else if (chan->protocol_id =3D=3D PHY_MODE_ETHERNET)
> +		ret =3D mp_phy_init_ethernet(phy);
> +	else
> +		ret =3D mp_phy_init_usb(phy);
> +	if (ret)
> +		return ret;

[Severity: High]
Could this error path also leak the PM usage counter?
If protocol initialization fails, the function returns without decrementing
the usage counter, preventing the power domain from ever suspending.

[ ... ]
> +static int mp_phy_power_on(struct phy *phy)
> +{
> +	struct mp_phy_priv *priv =3D phy_get_drvdata(phy);
> +	struct mp_phy_chan_priv *chan =3D &priv->chan[phy->id];
> +	int ret;
> +
> +	if (!chan->initialized) {
> +		dev_err(priv->dev, "Channel %d not initialized\n", phy->id);
> +		return -EINVAL;
> +	}

[Severity: High]
Will this unconditionally fail after a suspend/resume cycle?
Since mp_phy_suspend() clears chan->initialized for all channels without
dropping their associated PM domain references, subsequent calls to
phy_power_on() after resume will hit this condition and fail.

[ ... ]
> +		} else if (priv->num_lanes[phy->id] =3D=3D 4) {
> +			ret =3D mp_phy_reg_wait(priv, MPPHY_PXSRAMCNT(2 * phy->id), 0x20, 0x2=
0);
> +			if (ret)
> +				return ret;
> +			ret =3D mp_phy_reg_wait(priv, MPPHY_PXSRAMCNT((2 * phy->id) + 1), 0x2=
0, 0x20);

[Severity: High]
Can this result in an out-of-bounds regmap access?
If phy->id is 2, (2 * phy->id) + 1 evaluates to 5, which exceeds the
maximum channel index (MPPHY_NUM_CHANNELS is 4).

[ ... ]
> +static struct phy *mp_phy_xlate(struct device *dev,
> +				const struct of_phandle_args *args)
> +{
> +	struct mp_phy_priv *priv =3D dev_get_drvdata(dev);
> +	int id;
> +
> +	if (args->args_count > 1) {
> +		dev_err(dev, "Invalid args_count: %d\n", args->args_count);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (args->args_count >=3D 1)
> +		id =3D args->args[0];
> +	else
> +		id =3D 0;
> +
> +	return priv->chan[id].phy;
> +}

[Severity: Medium]
Does this code overflow the priv->chan[] array?
If a consumer passes an id >=3D MPPHY_NUM_CHANNELS via the device tree,
this will result in an out-of-bounds array access since there is no
bounds checking on the raw argument before indexing the array.

[ ... ]
> +static int mp_phy_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D mp_phy_parse_dt(pdev, priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return dev_err_probe(dev, PTR_ERR(priv->base), "Failed to map PHY regi=
sters\n");

[Severity: Medium]
Does this error path leak the allocated firmware?
mp_phy_parse_dt() can successfully allocate priv->fw via request_firmware().
If devm_platform_ioremap_resource() fails, the function returns directly
without calling release_firmware().

[ ... ]
> +	/*
> +	 * The reset ID order here does matters, reset_control_bulk_assert()
> +	 * asserts these resets in this order, with mpphy02 reset being
> +	 * asserted first, reset_control_bulk_deassert() deasserts these
> +	 * resets in reverse order, with mpphy02 being reset being
> +	 * deasserted last. This is the behavior the hardware expects.
> +	 */
> +	priv->resets[0].id =3D "mpphy02";
> +	priv->resets[1].id =3D "mpphy01";
> +	priv->resets[2].id =3D "mpphy11";
> +	priv->resets[3].id =3D "mpphy21";
> +	priv->resets[4].id =3D "mpphy31";
> +	ret =3D devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(pr=
iv->resets),
> +						    priv->resets);

[Severity: Medium]
Will reset_control_bulk_deassert() actually deassert these resets in reverse
order?
The reset_control_bulk_deassert() API processes the array sequentially unle=
ss
it is unwinding from a failure. This would mean mpphy02 is deasserted first
rather than last, violating the hardware expectation described in the comme=
nt.

[ ... ]
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable PHY runtime PM\n");

[Severity: Medium]
Could this error path leak priv->fw and the power domains?
If devm_pm_runtime_enable() fails, the function returns without calling
release_firmware() or dev_pm_domain_detach_list().

> +
> +	provider =3D devm_of_phy_provider_register(dev, mp_phy_xlate);
> +	if (IS_ERR(provider))
> +		return dev_err_probe(dev, PTR_ERR(provider), "Failed to register PHY p=
rovider\n");
> +
> +	for (i =3D 0; i < MPPHY_NUM_CHANNELS; i++) {
> +		priv->chan[i].phy =3D devm_phy_create(dev, NULL, &mp_phy_ops);
> +		if (IS_ERR(priv->chan[i].phy)) {
> +			return dev_err_probe(dev, PTR_ERR(priv->chan[i].phy),
> +					     "Failed to create PHY %d\n", i);
> +		}
> +
> +		priv->chan[i].phy->id =3D i;
> +		phy_set_drvdata(priv->chan[i].phy, priv);
> +	}

[Severity: Medium]
Does registering the provider here expose the PHY to consumers prematurely?
The provider is registered before the PHY objects (priv->chan[i].phy) are
created. If a consumer probes immediately, mp_phy_xlate() would return a
NULL pointer.

[ ... ]
> +static void mp_phy_remove(struct platform_device *pdev)
> +{
> +	struct mp_phy_priv *priv =3D dev_get_drvdata(&pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +
> +	pm_runtime_put(dev);
> +
> +	dev_pm_domain_detach_list(priv->pd_list);
> +
> +	pm_runtime_disable(&pdev->dev);

[Severity: Medium]
Can this result in an aborted power state transition?
According to PM subsystem rules, calling pm_runtime_disable() immediately
after an asynchronous pm_runtime_put() can cancel pending suspend work.
Should pm_runtime_put_sync() be used here instead?

[ ... ]
> +static int mp_phy_suspend(struct device *dev)
> +{
> +	struct mp_phy_priv *priv =3D dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i =3D 0; i < MPPHY_NUM_CHANNELS; i++)
> +		priv->chan[i].initialized =3D false;
> +
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
> +	dev_info(dev, "Multi-Protocol PHY suspended\n");
> +
> +	return 0;
> +}

[Severity: High]
Will clearing chan->initialized here break the PHY on resume?
This flag is cleared without decrementing the associated PM domain usage
counter. On resume, it is never restored to true, causing subsequent calls
to mp_phy_power_on() to fail unconditionally.

[ ... ]
> +static int mp_phy_resume(struct device *dev)
> +{
[ ... ]
> +	for (i =3D 0; i < MPPHY_NUM_CHANNELS; i++) {
> +		regmap_set_bits(priv->map, MPPHY_PXTEST(i), MPPHY_PXTEST_BIT);
> +		regmap_write(priv->map, MPPHY_PXSRAMCNT(i), priv->sramcnt[i]);
> +
> +		if (priv->write_cntxt1 & BIT(i)) {
> +			regmap_write(priv->map, MPPHY_CHAN_BASE(i) + 0x10c, 0xff0ff);

[Severity: High]
Are we guaranteed that the power domains for all 4 channels are turned on h=
ere?
If a channel is unused and its power domain is off, accessing its registers
blindly in this loop could lead to a bus fault and system crash.

[Severity: High]
Also, will regmap reject this write to 0x10c?
This register offset does not appear to be declared in the
mp_phy_writeable_range table, meaning the regmap core will return an -EIO
error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828192223.4024=
22-1-marek.vasut+renesas@mailbox.org?part=3D2
