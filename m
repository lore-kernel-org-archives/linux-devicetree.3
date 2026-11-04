Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780216;
	b=fWDmeufyOOgbPayJf39WgVWt3nOdk6C5J1rM1CotSVwXHh7qa4ZtQ+6yOvB1k7gSwJwV
	 F8/EvuWif5VjJwFnObzwzB2Wwy0D2FwhDHivAkBhyDoKgC+2372D9TCmjO3kUor8Bjc8r
	 miq/1YXyZ2zr9UCVtv7BE48amTUTJQQNTV/KOTECsEQV5HUXcGk/UwrRlTj9yy7LteL/V
	 e3nsn8gWIjJz24WcWdIhZQ7j4LfCrifRjwqArOuk7XdUwaTjfN3hC66Cw1nni+Vma7wGY
	 QFED0yK5ndBCJB5EcVpbPT/8grcDjrvf0E7+9Tzo4RpsCI39BoP1D5lMDAnzzstlbMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780216;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Coqy+iAD8WVkeesIkQ0IfjNDo5a16hBPODLZiHIQ7yM=;
	b=sbyJSa74o2BTohaZ5dCu0sb+Wg8Yl6/LDCsHNXuheGY2TXLZECiTnR2RLDqvgEuv+k3K
	 9Y3B//E82LPFOdXG8q1/W98clZCQsi1bU9zu4HA5yNRTfsPv+Si0/mbIpYCEGoL6ox2gu
	 2zefvtf9gfJlOlpT0AF7aTrq1doaEF8Fty7KoauS859MyXqGuJZBFqY42yYJxQCY+q0K7
	 P7XyIjIPRtVZAfV4+Eh6989BzNa5Hgql7jIOfhnLEIPwFo2wYasKHoX7Sv9gXKUTJMJCp
	 R9RNxCsY063rWfQmH2+/E3BWPlq9/+dfRZAQCtcmZnLb5dRmuHeBdUKoMpgMv7SjM3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWvvtbkG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E327606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gWvvtbkG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A231F000C1;
	Wed,  4 Nov 2026 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780215;
	bh=Coqy+iAD8WVkeesIkQ0IfjNDo5a16hBPODLZiHIQ7yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gWvvtbkGHYBBMWCLLv9rByERgb57KczeeD2wKxx7npNGG7nCOPXZ/vXsU888vw9mK
	 YeEgmDThUk9qpanKb19qkLFb13z49MuPqHKn7YZUS753/LYfzSZJeOHjBOZYwTiB9w
	 kJJyo8MYtBgrwg5Wj1PObSpXBw8ae0ggt5Be/IGXj2nTs/tphYHJ3kGJrorSGzs2ch
	 DSuihz3+2qBpEBZlWyIZl9ChriN7T4QM4X0juBAJwaHBtOVfcKhOf2X/zOqiOwdKbL
	 w8eUcV6RrmQ70P+tGD5SONgj/4oC46k/u82PzWj9OLouBGiABvmlEP18VDBRe52zSF
	 YHbk5rlvqEaqQ==
Message-ID: <sashiko-outbox-196869@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] regulator: rpi-panel-v2: Add vcc-supply support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shashank Maurya" <shashank.maurya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
References: <20261104-rpi_reg-v4-0-3578e794ff45@oss.qualcomm.com>
 <20261104-rpi_reg-v4-2-3578e794ff45@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:16:54 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] regulator: rpi-panel-v2: leaked enable count in rpi_panel_v2_i2c_p=
robe()
--

commit e10aa8754cb62ec300b893710f2607ab6d8e3548
Author: Shashank Maurya <shashank.maurya@oss.qualcomm.com>

regulator: rpi-panel-v2: Add vcc-supply support

This commit adds support for acquiring and enabling the vcc power supply in
rpi_panel_v2_i2c_probe() before accessing the panel MCU over I2C.

> diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulat=
or/rpi-panel-v2-regulator.c
> index 30b78aa75ee38..e54d675962e71 100644
> --- a/drivers/regulator/rpi-panel-v2-regulator.c
> +++ b/drivers/regulator/rpi-panel-v2-regulator.c

[ ... ]

> @@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *=
i2c)
>  		.parent		=3D &i2c->dev,
>  		.reg_set_base	=3D REG_POWERON,
>  	};
> +	struct regulator *vcc;
>  	struct regmap *regmap;
>  	struct pwm_chip *pc;
>  	int ret;
> =20
> +	vcc =3D devm_regulator_get(&i2c->dev, "vcc");
> +	if (IS_ERR(vcc))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> +				     "Failed to get vcc supply\n");
> +
> +	ret =3D regulator_enable(vcc);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to enable vcc supply\n");

[Severity: High]
As reported by Sashiko on v2 [1], does this leak the vcc regulator enable
count when a subsequent call in rpi_panel_v2_i2c_probe() fails (such as
devm_pwmchip_alloc(), devm_regmap_init_i2c(), devm_gpio_regmap_register(), =
or
devm_pwmchip_add()), or when the driver is unbound?

Because vcc is acquired with devm_regulator_get() and enabled with an
unmanaged regulator_enable(), devres cleanup calls:

  devm_regulator_release()
    -> regulator_put()
      -> _regulator_put()

while regulator->enable_count is still 1, triggering
WARN_ON(regulator->enable_count) in _regulator_put() and leaving the
underlying regulator_dev use_count permanently elevated.

Should rpi_panel_v2_i2c_probe() use devm_regulator_get_enable(&i2c->dev,
"vcc") instead so that a devm action is registered to disable the supply
before releasing it?

[1] https://lore.kernel.org/r/20260907055129.010E71F00A3A@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-rpi_reg-v4=
-0-3578e794ff45@oss.qualcomm.com?part=3D2
