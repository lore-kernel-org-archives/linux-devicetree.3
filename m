Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037606;
	b=2DBg0LXV4TkSN4ZCPA/BE503QnCS57maMMW9cV+zqzMCxK8jdXtXpIJofMZv1q3GzAeH
	 lkhVB4hSJf+UgwJ3mKalSo8S6AjOW0l96eZ4lzOqxKi3qJ1JMrCx7nOncpCVouwA8cJXW
	 Shxpn1p4j+irVk9GSLvMDxH3O73DWE4hrfLnvvDnZOrcMRhO75Ms5Z9bEFHUcADjzyYoJ
	 aZbvA97x0StgleFnAxp4uExizlzeEu1fZWggShKl6IBKny4ea9jifZf7836jrsOKNwjcV
	 0QJ/yK/HZ9+vvYkEDbZlhWdt9/rkKZfcl8B80WPzSJYuthLD+XH+p7LyUAziXHpSMNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5DkqskpnPLC6pb1aw1d7dZfHzY+pFqtqTbU0/UjtrR0=;
	b=SfE6b8bNnN4i/10mmc4KGWz/Qn3UOpc0ZnDD/275HxOL3Cx5k9RBsRe+qpC2EnbZYGNz
	 /J1Bp4A5w2iwOzwaLOSdiI+R8b0YNAh7H1rYR3eSBLVGEmDMoab86K7+XNtPnEe6jeOWL
	 kCZYYkzDvrcsZ6/lLsq5BfBKZU1mUnOVnBrJKu6euG/pMpTrlKTehbu27RHpwHHqvKjGL
	 VN8wYOV1t1xM9Q7aAf+JjAe8mIRyHVJKWCN6kX0GPfwR2OhHnIkqwO04NTjZX4EiXthxy
	 mDWIj9znzvhJ4I7d7Z6796yMKyh6rW1TIcpTlUJ+UqmhA4j6PHr57wQELwNcBKHIAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+kTOIof;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C58606A32D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 18:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+kTOIof
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F3A1F01829;
	Mon, 26 Oct 2026 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793037605;
	bh=5DkqskpnPLC6pb1aw1d7dZfHzY+pFqtqTbU0/UjtrR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+kTOIof/jCr9wC2rybfcIHS6U/NEnp08eKO5+u/wyj3NcmTCt7QugamjLAq4X5Zy
	 M98PUbs0Eo6mXWseaf56E8MxKlmUVE992RI2Q/zNF/51L+18+duXjQP0nIKDLp81P5
	 ZcXsMHfJyEb/EiXOQBSmOygA9nPcV+wAw2IWfrj97pcF3nY37EEDzWqg7o30D4QzzZ
	 yy12YyLlWSRXeC3LpRQ9HwnZisgEcWs67qbICrScrOZetptCKCZgzqBXpZvpjBu8WY
	 ErJ+wVjAUT231hheNmIi01aysN9x+r+Gs6yI3fWK+EmkL6L2RwT57wyedzZzvWSyfD
	 mRFjkMo2jtYdw==
Message-ID: <sashiko-outbox-185604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] power: supply: rk817-charger: Clear SYS_CAN_SD
 register by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026174834.1652309-6-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
 <20261026174834.1652309-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 18:00:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] power: supply: rk817-charger: property read on node-less charger->=
dev in rk817_battery_init()
- [High] power: supply: rk817-charger: gate-function-disable read from NULL=
 dev fwnode
--

commit 925404edbf883b384fffee5ff2dad1b5fbad4340
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: rk817-charger: Clear SYS_CAN_SD register by default

This commit clears the RK817_SYS_CAN_SD bit in the RK817_PMIC_CHRG_TERM
register during battery initialization unless the
rockchip,gate-function-disable property is present, in order to prevent
persistent power drain while the device is powered off.

>     power: supply: rk817-charger: Clear SYS_CAN_SD register by default
>    =20
>     The BSP driver for the rk817 charger by default sets the SYS_CAN_SD
>     register unless a specific attribute is set in the device tree. This
>     register tells the PMIC that the system voltage can be shut down in
>     battery off mode.
>    =20
>     Though the BSP sets this value by default, it also has a device tree
>     value to override it.
>    =20
>     When this value is not set, it can result in a persistent power
>     drain while the device is off, as observed by users.
>    =20
>     Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip =
RK817")
>     Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>     Suggested-by: Zetarancio <zetarancio@users.noreply.github.com>

[Severity: Low]
This isn't a bug in the code, but the commit message body says the driver by
default sets the SYS_CAN_SD bit and that power drain occurs when this value
is not set, whereas the commit subject and the code call regmap_clear_bits()
to clear RK817_SYS_CAN_SD. Should the commit message body say "clears"
instead of "sets"?

> diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/=
rk817_charger.c
> index b6714d8e4fed9..6971f572c68d0 100644
> --- a/drivers/power/supply/rk817_charger.c
> +++ b/drivers/power/supply/rk817_charger.c
> @@ -1148,6 +1148,15 @@ static int rk817_battery_init(struct rk817_charger=
 *charger,
>  	regmap_write_bits(rk808->regmap, RK817_PMIC_CHRG_IN, RK817_USB_ILIM_EN,
>  			  (0x01 << 3));
> =20
> +	/*
> +	 * Shutdown the system voltage in bat_off mode, unless
> +	 * gate-function-disable is set.
> +	 */
> +	if (!device_property_read_bool(charger->dev,
> +				       "rockchip,gate-function-disable"))
> +		regmap_clear_bits(rk808->regmap,
> +				  RK817_PMIC_CHRG_TERM, RK817_SYS_CAN_SD);

[Severity: High]
Will device_property_read_bool(charger->dev, "rockchip,gate-function-disabl=
e")
ever find the property here?

In drivers/mfd/rk8xx-core.c, the mfd_cell entry in rk817s[] for
rk817-charger does not set .of_compatible (and the charger child node in
Documentation/devicetree/bindings/mfd/rockchip,rk817.yaml has no compatible
property):

drivers/mfd/rk8xx-core.c:
	{
		.name =3D "rk817-charger",
		.num_resources =3D ARRAY_SIZE(rk817_charger_resources),
		.resources =3D &rk817_charger_resources[0],
	},

Because of this, mfd_add_device() leaves pdev->dev.of_node and
pdev->dev.fwnode as NULL.

In rk817_charger_probe(), the driver manually looks up the child node from
the parent PMIC and only attaches its fwnode to pscfg.fwnode for the
registered power_supply devices, while reading all other charger properties
directly from node:

drivers/power/supply/rk817_charger.c:rk817_charger_probe() {
	node =3D of_get_child_by_name(dev->parent->of_node, "charger");
	if (!node)
		return -ENODEV;
	...
	charger->dev =3D &pdev->dev;
	platform_set_drvdata(pdev, charger);

	rk817_bat_calib_vol(charger);

	pscfg.drv_data =3D charger;
	pscfg.fwnode =3D &node->fwnode;
	...
	ret =3D of_property_read_u32(node, "rockchip,resistor-sense-micro-ohms",
				   &of_value);
}

Since dev_fwnode(charger->dev) is NULL when rk817_charger_probe() calls
rk817_battery_init(), device_property_read_bool(charger->dev, ...) always
returns false and RK817_SYS_CAN_SD is cleared unconditionally even when
rockchip,gate-function-disable is present in the charger Device Tree node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026174834.1652=
309-1-macroalpha82@gmail.com?part=3D5
