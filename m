Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7A23E342
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790435216; cv=none; b=iNPtNny3sA7Yf8EpECmVDbh0HxFY1QK15MWk/1vhAu2fNKP8D1HpQEBYaldq3UhtpJvRH2YvxIpznvw+H2Z0GYqpF6AxV4JjwS3n2HC09VJc1eTpKQ1wvuqdiqpt6JWkn3OxcqDrEDMW2+AzzjIh2WHbYZlAT3nq0GNmUw+GfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790435216; c=relaxed/simple;
	bh=+fpkm6eyoVX6ZvIevCuOMov0HOT2iUQuoIb8bNrNTsM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DC7YZli+LohhZl7w/vCyGP4GGDOzAaipJek1SIe0d8MMRg2fUPFuk/l1vlDrrgY/2l1u96hs/aGwg2wcB+a8cv0Sxw7MzWJ1Wz99qzXFvGq0oFz+mTBo1+5QoAHGoTE6fcSV5o17e/FownbVZyzkwnMFs8M49FSpw9mvwm4uiUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNbtMQDV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNbtMQDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DAA1F000FF;
	Sat, 26 Sep 2026 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790435214;
	bh=Ie73CvqlHPGgRBFQELyPNYX408milOOp2jIUmStEJnc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bNbtMQDV4+cTnO0GIecKNONeRe39WeHXJ1rPY2yU0eRorWcFqlIlFSh5A21S4YZiQ
	 RhmGxb2CNjgrjDYfBRV+UugCeOXaob8WFLB4X8dV3Y9MWIdx8oyx/p8UTatkQUZ2p8
	 u01g4WUj8LarW5gkSvxdKRuiSkc9pSJS1OpAPdZN3fQRyLxZfnJfYsbsac7VA9r8b2
	 CR9/hDMS/hn/BDIIRZv1a/JMmAvQuSioC980SSwvNuUPE94eJ/E9x+NqdOCcSZudje
	 G7kwLlWPsiZUwj5rEaHCXfN+DD57/okXQzw4odheq7TUUn4bdKoutMgN5hSeGyWS/w
	 7pRQ+tGipcIJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: apple: Add t8140-pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yureka Lilian" <yureka@cyberchaos.dev>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-2-620bd11cd2a1@cyberchaos.dev>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
 <20260926-apple-pinctrl-t8140-v2-2-620bd11cd2a1@cyberchaos.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 15:06:53 +0000
Message-Id: <20260926150654.28DAA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pinctrl: apple: NULL pointer deref in apple_gpio_set_reg() due to =
lazy init
- [High] pinctrl: apple: unhandled ERR_PTR from failed regmap init causes c=
rash
--

commit e83219f35e40fdd986984c342182dca31136d937
Author: Yureka Lilian <yureka@cyberchaos.dev>

pinctrl: apple: Add t8140-pinctrl support
   =20
Ensure the regmap does not attempt to read REG_GPIOx of any of the pins
marked with gpio-reserved-ranges. For this purpose, move the regmap_init
just before the first regmap_read, at which point the valid_mask has
been populated from the gpio-reserved-ranges device tree property.

> diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinct=
rl-apple-gpio.c
> index 6305b96aaa733..6b26a23d283c5 100644
> --- a/drivers/pinctrl/pinctrl-apple-gpio.c
> +++ b/drivers/pinctrl/pinctrl-apple-gpio.c
[ ... ]
> @@ -90,6 +98,13 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctr=
l *pctl,
>  	int ret;
>  	u32 val;
> =20
> +	if (!pctl->map)	{
> +		pctl->map =3D devm_regmap_init_mmio(pctl->dev, pctl->base, &regmap_con=
fig);
> +		if (IS_ERR(pctl->map))
> +			return dev_err_probe(pctl->dev, PTR_ERR(pctl->map),
> +					"Failed to create regmap\n");

[Severity: High]
If devm_regmap_init_mmio() fails here, pctl->map is assigned an ERR_PTR but
is never cleared.

Will subsequent calls to apple_gpio_get_reg() bypass this lazy
initialization check since pctl->map is no longer NULL, and dereference
the unhandled ERR_PTR in the following regmap_read() call?

[Severity: High]
Since pctl->map is now lazily initialized only in apple_gpio_get_reg(), what
happens if apple_gpio_set_reg() is called first?

If the device tree contains pinctrl hogs, or a consumer device requests a
pinmux before the first GPIO read triggers this lazy initialization,
apple_gpio_pinmux_set() can call apple_gpio_set_reg().

apple_gpio_set_reg() will then blindly pass the NULL pctl->map to
regmap_update_bits():

drivers/pinctrl/pinctrl-apple-gpio.c:apple_gpio_set_reg() {
	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
}

Could this result in a NULL pointer dereference causing a kernel panic?

> +	}
> +
>  	ret =3D regmap_read(pctl->map, REG_GPIO(pin), &val);
>  	if (ret)
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-apple-pinc=
trl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev?part=3D2
