Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332D937269F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702672; cv=none; b=mCqQcAwf1yGvkNR7SIbRuEDnq3WuVKoLPnpX/MYaWb7VbgbqDMS1d9hnox6jklHkTR3ylDPnlN1wV1dII4hzB6WKhZJzl2fnIgQScqq9Az4Yh+/gaiD87DM1SzRu1tShBKW5t8vfabIzSBboZZMmtQZ75KKwxjD/xnTX1b3ma5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702672; c=relaxed/simple;
	bh=ROcZsXK8gVxEAw5MDe9aaLeaQ86jW2glFDAIL0ebQu8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CsHE05QpXw+uGjT1WE+Ty4HewP//oPA9BcWMFr6DWp1MvJGfsrnauO0ekapHDesny6tbmtgidgwwIuF9o3ujS5nWXL6bonrf71uCVanOnsRQXGBP4c7tA++9jnPHULm6WDygiMACJqFCpIHeJLn1V3Sz2m3GMjrl1ctPchzCUv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojzu61Eu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojzu61Eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DFD1F000E9;
	Mon, 25 May 2026 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779702670;
	bh=j8ORBJXyM3BvGK1oDjwPVTE9dnKaS3Qk6LmVQGA1Xg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ojzu61Eub9cCzcsFQCojGp/bD+h2cipoPwS+m3gMnt18ORCwkAFPiV5OsQAhhpq0I
	 hz6kcWcB+fIeMbDjuqCbiDawb5ymT1Lhs0BIzfG2KCXkgOiiOta1oKbhrxwq1x24Dt
	 LwaPW+D4Bj0NAcXLzKjnnQGFNArezdCnPDyUX5mZksqc4V55nzLno3HVOTi3W7qhld
	 dwP2FFk992ukOwbmzc8u+Z6ifbQl8JHou086RdE5e1ejW9rG7Yo2ZnAyssAQisO4Ku
	 WVIjpY8/PE5/DTMIIJ8oyFWy0cmTGo6BTjArkqFCUcOGJDUqlk7ACbLYie64oiG1Bc
	 hRto/HHpOiqfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8822: add support for supply
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525-nau8822-reg-v2-2-7d37ae393e46@flipper.net>
References: <20260525-nau8822-reg-v2-2-7d37ae393e46@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:51:10 +0000
Message-Id: <20260525095110.A5DFD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Manually disabling regulators in the I2C `remove` callback breaks =
the LIFO teardown order, causing I2C operations to fail during `devm` compo=
nent teardown.
- [Medium] Unconditional regulator disable in the `remove` callback can cau=
se an unbalanced disable if the device is removed following a resume failur=
e.
--

commit 9b4fbe6b13298617ee870787131ce69e29d799b3
Author: Alexey Charkov <alchark@flipper.net>

ASoC: codecs: nau8822: add support for supply regulators

This commit adds support for the four power supply pins on the NAU8822
codec by requesting and enabling them at init time. It also adds a brief
delay after power up to allow the device to stabilize before register acces=
s.

> diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> --- a/sound/soc/codecs/nau8822.c
> +++ b/sound/soc/codecs/nau8822.c
[ ... ]
>  	ret =3D devm_snd_soc_register_component(dev, &soc_component_dev_nau8822,
>  						&nau8822_dai, 1);
>  	if (ret !=3D 0) {
>  		dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret);
> -		return ret;
> +		goto err_reg;
>  	}
> =20
>  	return 0;
> +
> +err_reg:
> +	regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);
> +	return ret;
> +}
> +
> +static void nau8822_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct nau8822 *nau8822 =3D i2c_get_clientdata(i2c);
> +
> +	regulator_bulk_disable(NAU8822_NUM_SUPPLIES, nau8822->supplies);

[Severity: High]
Can this manual regulator disable cause I2C bus errors during teardown?

The ASoC component is registered with devm_snd_soc_register_component(),
which means the subsystem will unregister the component during the devres
cleanup phase. This happens after nau8822_i2c_remove() has already
returned.

Because the regulators are disabled here, the hardware will be unpowered
while the ASoC component is still active. During devres cleanup, the
subsystem will call snd_soc_dapm_shutdown() and transition the bias level
to SND_SOC_BIAS_OFF.

Will the resulting I2C register writes to the unpowered codec fail or
time out, potentially stalling the driver unbind?

[Severity: Medium]
Could this unconditional regulator disable also result in an unbalanced
disable warning?

If the system resumes but nau8822_resume() fails to re-enable the
regulators, they will remain in the disabled state set during
nau8822_suspend().

If the driver is later unbound, this call will execute again. Will this
attempt to drop the regulator reference count below zero and trigger a
kernel warning?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-nau8822-re=
g-v2-0-7d37ae393e46@flipper.net?part=3D2
