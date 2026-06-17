Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE212BE7A7
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695068; cv=none; b=D2dlyh3EZwxRBvBQSFG95vL4SN/nGOsz7sAc+l3dCXXKN/OtQ2zb90Ii10VZ2J9MURMiod9w6jK9fWVkrFvD4RcE2b6WJ0F1hCApcqpyZMMScSfGDwWtC1871yuwEncJ2P7WjrZB469wAmzuXWFfD2IyU0bRvGj5bGhwY/33VUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695068; c=relaxed/simple;
	bh=Dn7givp6qpmywtrsbSaiJVt0X3+3bO+y71LrxiMJc28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g6ugIxw7AYezdOT6ecTrdbkwkNfhigB5qVm3M7YmRteB9CJry66/FVQnvw68nP3NHosbsp1slN6dwBqxzkREMDXdaEOXiZY6Y9QeCxGhUgE2eTMkXAxZSG8CQIyINb606YhtpoSTXxddu5UfNYlcMUNiIHWL/7XMG+WHz9MPkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/v1u8te; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/v1u8te"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0971F000E9;
	Wed, 17 Jun 2026 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781695064;
	bh=rt5MZHZ9w6MWDmQ5xmHXLkHiw1XPTomDmnzykaiUDKQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/v1u8te6LCdj+zOO8xBnHtXbH8hXdX5kNopX9VVUxrm7c+ZXJ222qGYaVz2JR1mO
	 /MBbY1vJ/RSkhbqPj162aSmxlAk33qBKuzxlZiNfkKTvtC2Ifn5YJnnnhFO5pQWQm+
	 I3P0lHI0qaJFvVt0nndC9TonqmN+6BDdkfDVLvKJ+ejvbwSWDNoh0eg2fTPeVszr8a
	 Q0/7l24rzs0mIy3ZjlfA6DKM1cx2IXGd3lRT49ud5fonOLUZFq6q7r89P2i/T7xDEc
	 UqK18SvgH5ylACEUlbmWCgDUn7+2uIN1XsCTof3FjNL+aZn0vUkZJzlGgEzRWeaMiD
	 oavfVmF72b6hQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 4/7] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617110355.1591844-5-lakshay.piplani@nxp.com>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 11:17:43 +0000
Message-Id: <20260617111744.1A0971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Concurrent regulator operations race on the shared device-level pr=
otection register, leading to silent hardware configuration failures.
- [Medium] The driver module will not auto-load because it lacks a MODULE_A=
LIAS or platform_device_id table.
- [Medium] If regmap_read or the unlock sequence fails in the guard constru=
ctor, the driver proceeds with the regulator operation on locked registers.
- [Low] Typo in regulator config assignment assigns dev->of_node to itself =
instead of rcfg.of_node.
--

commit e68081b58005a2422d441a5611dac29f8cffe2f4
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
functionality. This driver registers the regulators using the MFD
framework and exposes them via the regulator subsystem.

> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c

[ ... ]

> +static void p3h2x4x_reg_guard_enter(struct regulator_dev *rdev,
> +				    struct p3h2x4x_reg_state *state)
> +{
> +	state->restore =3D false;
> +
> +	if (regmap_read(rdev->regmap,
> +			P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			&state->orig))
> +		return;

[Severity: Medium]
If regmap_read() fails here, the function returns early and swallows the
error since the guard constructor returns void. Will this cause the caller
to proceed with regulator operations on locked hardware, potentially
resulting in silent hardware configuration failures?=20

If the device ACKs the transaction despite ignoring the write, wouldn't
the driver incorrectly report success to the regulator core?

> +
> +	if (state->orig !=3D P3H2X4X_REGISTERS_UNLOCK_CODE) {
> +		regmap_write(rdev->regmap,
> +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			     P3H2X4X_REGISTERS_UNLOCK_CODE);
> +		state->restore =3D true;
> +	}
> +}
> +
> +static void p3h2x4x_reg_guard_exit(struct regulator_dev *rdev,
> +				   struct p3h2x4x_reg_state *state)
> +{
> +	if (state->restore)
> +		regmap_write(rdev->regmap,
> +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			     state->orig);
> +}
> +
> +DEFINE_LOCK_GUARD_1(p3h2x4x_reg, struct regulator_dev,
> +		    p3h2x4x_reg_guard_enter(_T->lock, &_T->state),
> +		    p3h2x4x_reg_guard_exit(_T->lock, &_T->state),
> +		    struct p3h2x4x_reg_state state);

[Severity: High]
Does this guard provide mutual exclusion across the four different regulato=
rs
on the same device?=20

The regmap lock protects individual I/O operations, but since there is no
device-level lock held across the unlock/modify/lock sequence, can concurre=
nt
operations on different regulators interleave?

For example, could one thread re-lock the device in p3h2x4x_reg_guard_exit()
while another thread is just about to write its configuration, causing the
hardware write to be silently ignored? Is a shared device-level mutex needed
to serialize these sequences?

[ ... ]

> +static int p3h2x4x_regulator_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x_dev *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> +	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
> +	struct regulator_config rcfg =3D { };
> +	struct device *dev =3D &pdev->dev;
> +	struct regulator_dev *rdev;
> +	int i;
> +
> +	p3h2x4x_regulator =3D devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP=
_KERNEL);
> +	if (!p3h2x4x_regulator)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, p3h2x4x_regulator);
> +
> +	p3h2x4x_regulator->regmap =3D p3h2x4x->regmap;
> +	device_set_of_node_from_dev(dev, dev->parent);
> +
> +	rcfg.dev =3D dev;
> +	rcfg.dev->of_node =3D dev->of_node;

[Severity: Low]
Should this be rcfg.of_node =3D dev->of_node? Since rcfg.dev is assigned to=
 dev
on the previous line, this just assigns dev->of_node to itself.

> +	rcfg.regmap =3D p3h2x4x_regulator->regmap;
> +	rcfg.driver_data =3D p3h2x4x_regulator;

[ ... ]

> +static struct platform_driver p3h2x4x_regulator_driver =3D {
> +	.driver =3D {
> +		.name =3D "p3h2x4x-regulator",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe =3D p3h2x4x_regulator_probe,
> +};
> +module_platform_driver(p3h2x4x_regulator_driver);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB Regulator driver");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
Since the driver is registered as a platform driver with the name
"p3h2x4x-regulator" but the module is compiled as
"p3h2840_i3c_hub_regulator.ko", will this module fail to auto-load?=20

Without a MODULE_ALIAS("platform:p3h2x4x-regulator") or an exported
platform_device_id table, udev may not be able to load the module when the
MFD core creates the child platform device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617110355.1591=
844-1-lakshay.piplani@nxp.com?part=3D4
