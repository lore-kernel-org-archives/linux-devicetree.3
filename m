Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A44B337E
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596266; cv=none; b=Wp+hcOM2IEiV/fbMzVffLT29BptsBDnGiP1oPglARfLSU5d/MlqA3jL9/dhfnEIFkoycXpZpRCnMLh7NMXwjNJ0y7Hxbe0VkBPHkXjeNMAf9NSF68BGFWmrLo++N6xY8w1Nq871XlU/PMoq3b60gr/wdGj9RqmKfrVnnNqCvVzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596266; c=relaxed/simple;
	bh=Cy6z7lNJBNiSP8dVqIieOlrGtv4CZT1/1e1mvUydpfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=duMIVLmLrqD7wK9ZZg45GrUeUgbj1Nbkr4++bgc0mx/W3y2M/jgsrFgqnW/pwHAurZITP8qqFuHK4MYSF/4goCM6G13bZWQT/dubA5JgFwrV/fhzo9du48h9+SR21semTFKf7L9gkXcFmSAB/brP+cOdiuXC0hu6WBQpvn5L7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kjmyx32r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kjmyx32r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE7A1F00893;
	Mon, 28 Sep 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790596265;
	bh=u1Kq8nA50TuB4xq/APO59JdJuMB9WtMLSoI0/MtnY/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kjmyx32rLKJdzWSa4dLtsoTehQJcEgg7fmZeIsY7cFZM1QuwPRh+YlT1lww3fz6+b
	 3l3LcWJVe6gB+HkFxtna/sn2rgLgffixJdtRWkZslBe8je3zdBHR9FPNR/bXyKvIcI
	 IlrYHV3Sjv3xX1NMRlJdG5BMo/izCrStMz5TJegE/kUJ43qpcrY1YKDdXOiwfeaUzb
	 IFJcVp/mxDT9h5LuZG8xsDQiEYbbsJD1eRWU9Dh/RvhznJT27vkGKcb1E7vrfcZpj2
	 H+ywyO92VDHm48WSImN68/BTWgYBb/on/ODIV41MbXaabndfwaPN6Y1fA0yVKqysTL
	 inCX+mtx8qbgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: ak4619: Add optional PDN pin support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koch" <mail@alexanderkoch.net>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260928114019.1441752-2-mail@alexanderkoch.net>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-2-mail@alexanderkoch.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:51:04 +0000
Message-Id: <20260928115105.4FE7A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] gpio: API semantic violation via incorrect PDN logical polarity
- [High] sound: missing 10ms hardware wake delay in resume path
- [Medium] sound: resource leak due to missing physical power-down
--

commit 8cb28b5bd3bb703c3fa3ae908ee58f9cf02df5c7
Author: Alexander Koch <mail@alexanderkoch.net>

ASoC: codecs: ak4619: Add optional PDN pin support

This commit adds optional device tree binding to support the PDN pin on the
ak4619 codec. If defined, it asserts the PDN pin during driver probe and
waits 10ms before the first register access.

> diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
> index 5252b30669d48..776199489db79 100644
> --- a/sound/soc/codecs/ak4619.c
> +++ b/sound/soc/codecs/ak4619.c
> @@ -894,6 +895,12 @@ static int ak4619_i2c_probe(struct i2c_client *i2c)
> =20
>  	i2c_set_clientdata(i2c, ak4619);
> =20
> +	ak4619->pdn_gpio =3D devm_gpiod_get_optional(dev, "pdn", GPIOD_OUT_HIGH=
);

[Severity: High]
Does this code use the incorrect logical polarity for the power-down pin?

If a device tree correctly defines the PDN (power down, active-low) pin with
GPIO_ACTIVE_LOW, requesting GPIOD_OUT_HIGH (logical assert) will translate
to a physical LOW state. This permanently powers down the codec instead of
waking it up, causing probe to fail.

To work around this, the commit message example forces DT authors to
incorrectly define the active-low pin as GPIO_ACTIVE_HIGH.

Should this use GPIOD_OUT_LOW to logically deassert the power-down state,
which correctly yields a physical HIGH when paired with an ACTIVE_LOW DT
definition?

> +	if (IS_ERR(ak4619->pdn_gpio))
> +		return PTR_ERR(ak4619->pdn_gpio);
> +	if (ak4619->pdn_gpio)
> +		msleep(10);
> +

[Severity: High]
Does the addition of this PDN pin and 10ms hardware wake delay also require
an update to the resume path?

If power is cut or the GPIO controller loses context during system suspend,
the codec resets and loses state. Upon resume, the GPIO controller restores
the physical PDN pin to HIGH.

Shortly after, the ASoC core invokes ak4619_resume():

sound/soc/codecs/ak4619.c:ak4619_resume() {
    ...
	regcache_cache_only(regmap, false);
	return regcache_sync(regmap);
}

Because ak4619_resume() immediately executes regcache_sync() to burst-write
restored registers over I2C, it violates the mandatory 10ms hardware wake
delay specified by the datasheet.

Could this cause the codec to fail initialization on resume, leading to
NACKed I2C transfers and permanently silent audio?

>  	ak4619->regmap =3D devm_regmap_init_i2c(i2c, &ak4619_regmap_cfg);
>  	if (IS_ERR(ak4619->regmap)) {
>  		ret =3D PTR_ERR(ak4619->regmap);
>  		dev_err(dev, "regmap_init() failed: %d\n", ret);
>  		return ret;
>  	}

[Severity: Medium]
Does this error path leak power by failing to physically power down the cod=
ec?

If devm_regmap_init_i2c() or devm_snd_soc_register_component() fails during
probe, the devm framework calls gpiod_put() to release the GPIO. By design,
gpiolib frees the descriptor but intentionally leaves the physical pin in i=
ts
currently driven HIGH state, keeping the codec powered up.

Should devm_add_action_or_reset() be used to register a custom cleanup acti=
on
that calls gpiod_set_value_cansleep() to properly power down the device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928114019.1441=
752-1-mail@alexanderkoch.net?part=3D1
