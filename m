Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C34734C1
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524524; cv=none; b=PJuB4Xx+9fjSlQY53ri/OImHU5W4Q9QcJMgbIcrEe4aiGeXLoxXPGbNfA0pYdsmhJNXtQQn7bDmfaDz52N4xPIOshVzve9CktwBRvz14b20gIl06bP5X6Db6SQnqynovh6voFDaUX70PbOIDhpkZQWYaoORBgO3MSrsjXYKXlG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524524; c=relaxed/simple;
	bh=cxUCm27Cmn2DV/uhLw5yWrN3OHr1cV6cFH6Tl0O2/Ao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RpEJbuKUsXLZqDiEozCLjlOGPDxHq1V3R3n+0hgbmzPyht2shU7h4Xbj2xmeTINCKPhWEN/jZUQik+dbKNk6mpgn+G7ael1KswWfF26y64ROofZx8NSYQ7FQsjpjypb17ujBQ06iaM09xwjnwUYaADj2mmBPGj5rqxUwfqf4WCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZZJeoL9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZZJeoL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3CF1F00A3F;
	Fri,  4 Sep 2026 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788524522;
	bh=FiT4XlNpRTw/kt2Nm8NyEGfp0QWUefaxb8lqPsLHYyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GZZJeoL9HXKNa4PcGU7qK4ShZ0R28ynqMXm9Z1cZ6GF1wqJhpK5OYKS3U9ZD3t7tw
	 x/EbBhq6ejBqIN4pSxjyoESoc9EfNg0cpd3gBVW1/O6CbSOdGy/3B4GGyhiWcE9B+a
	 7z+TzZISDKE/MBGRyxrxEAoymnhdNZIEAbgZATb0EKRS2Y7+UExsoIVVe7QHfH+1vb
	 QLZncTlqy21a4U0QQmSA/+OTH1ObhvPUhqmlTcu97YfKSFYmwffxeZ/lZ7ceBjTf/3
	 TFvvWpZwO3TmKwdG7N0kZRJDRSJSsMYem/LgqrNxwyrOaQjFq9qifNpUYIwttGfzI7
	 NjzDokuNb8DRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/3] net: mdio: realtek-rtl9300: Support
 non-default clock frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903122119.2638354-4-markus.stockhausen@gmx.de>
References: <20260903122119.2638354-1-markus.stockhausen@gmx.de>
 <20260903122119.2638354-4-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:22:02 +0000
Message-Id: <20260904122202.9A3CF1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Using an uninitialized `bus->dev` pointer for logging before the=
 MDIO bus is registered, resulting in a '(null)' prefix.
- [Low] The `global_freq` variable is overloaded as both an initialization =
flag and frequency storage, failing if `clock-frequency` is explicitly set =
to 0.
--

commit 9b57074cdf8cafdf9765568d20f29655308463cf
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

net: mdio: realtek-rtl9300: Support non-default clock frequency

This commit enhances the realtek-rtl9300 MDIO driver to allow setting the
MDC clock frequency via device tree. For the RTL839x series, which only
supports global frequency selection, the driver configures the global
speed based on the first probed bus and issues warnings for conflicts.

> diff --git a/drivers/net/mdio/mdio-realtek-rtl9300.c b/drivers/net/mdio/m=
dio-realtek-rtl9300.c
> --- a/drivers/net/mdio/mdio-realtek-rtl9300.c
> +++ b/drivers/net/mdio/mdio-realtek-rtl9300.c
[ ... ]
> @@ -749,6 +766,34 @@ static int otto_emdio_8380_setup_controller(struct o=
tto_emdio_priv *priv)
>  	return regmap_set_bits(priv->regmap, RTL8380_SMI_GLB_CTRL, RTL8380_SMI_=
PHY_PATCH_DONE);
>  }
> =20
> +static int otto_emdio_8390_set_bus_frequency(struct mii_bus *bus, u32 fr=
eq)
> +{
> +	u32 val =3D FIELD_PREP(RTL8390_SMI_FREQ_SEL, min_t(u32, freq / 2500000,=
 2U));
> +	struct otto_emdio_priv *priv =3D otto_emdio_bus_to_priv(bus);
> +
> +	if (priv->global_freq) {

[Severity: Low]
Does this logic correctly handle a scenario where the device tree explicitly
sets the clock-frequency to 0?

Since priv->global_freq is used as both an initialization flag and for
storing the frequency, a frequency of 0 would evaluate to false here.
This could bypass the conflict detection for subsequent buses and silently
overwrite the global hardware frequency.

Would a dedicated initialization flag or sentinel value (like -1) be more
robust to handle all integer inputs?

> +		/* With only one global frequency available skip setup for second bus.=
 */
> +		if (freq !=3D priv->global_freq)
> +			dev_warn(&bus->dev, "Only one frequency for all buses supported");

[Severity: Medium]
Will this dev_warn() print a (null) device name prefix?

Looking at otto_emdio_probe_one(), set_bus_frequency() is called before the
bus is registered via devm_of_mdiobus_register():

	err =3D priv->info->set_bus_frequency(bus, freq);
	if (err)
		return dev_err_probe(...);

	err =3D devm_of_mdiobus_register(dev, bus, node);

Because dev_set_name() hasn't been called on bus->dev yet, the logger won't
have a valid name to display. Could this be resolved by logging with
bus->parent instead?

> +		return 0;
> +	}
> +	priv->global_freq =3D freq;
> +
> +	return regmap_update_bits(priv->regmap, RTL8390_SMI_GLB_CTRL, RTL8390_S=
MI_FREQ_SEL, val);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903122119.2638=
354-1-markus.stockhausen@gmx.de?part=3D3
