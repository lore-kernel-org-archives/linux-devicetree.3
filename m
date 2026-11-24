Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522011;
	b=ZuNe0c43yg+adm9CojktK4dz+353a8zRifUyW2m+uD5crn0gPe5hVnfDCokOPDTnejq5
	 6Fo/q37jTOxeJGOKNMrnvVQZDmBDeBDJn/bDLpPUd/Hgb/VMO2z2cXPBZSzFZhUXeFjJT
	 9+iMib3qEkQvsnMNVwMVZgIdo6S7lzBsTPwFiyN5dTtEoOefY14g6MbaBGUs2cXGRXrtx
	 ymL1KGD6g58SA5A4YHCionkepKrDkCmZTu6y0BC/YjqTkBWfE00VBIcFqTsVT+0PDcO+D
	 XiQyGdF1qyOyBq+9m1MS2C74XVl2CH8wsYiOu+kg7QFPEqVwofBMEEaxskRwqdqSmiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522011;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JKT+SrwlQG14Zxpxl2Pk5goSaHfcBqsRsszCkqpUgdg=;
	b=vMSOwhjMQEvOOHtGw+GN6MMr/l1Pky+tbbR3e5FbtMQa0FMpScNfZPsSqGdxAhRv43o8
	 lOkLh8/D5wLAQGULQe62OfZQlFsIWn3P7OVHxCIdeKtgj1fNnahr64g9guarxaDps05Yj
	 7z+4UUELP6nHYIcOg29TpblOlrniIWUkBGueTv4ZqzaiJ3Jw1seXH5gJpanDy0Dhiq4JG
	 GxUTXDshWjovtQ8hpxv2y6V/yThDn1P8ctrwx32fkHOuCLEkb9DPRKfORUT4ph4wvanEo
	 5ja+Uv2qdNptPHdLU0cVcVhSEHcUyXC/OzzaK7H29NnxUSvbfMO7gvlqiLTKaOYvGsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qf8KrlDZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A258606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qf8KrlDZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9C41F000C0;
	Tue, 24 Nov 2026 12:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522010;
	bh=JKT+SrwlQG14Zxpxl2Pk5goSaHfcBqsRsszCkqpUgdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qf8KrlDZKu5phSh0vpugB3ZZ5CmCJ+oEK4dgg/TKS1keGsRqTzom8h59FF8vQlefi
	 80RQ6bshK3r3L4yn/9F70dwDuEW2PVnX1BSRgH5VobOEf5ROeh07uwup9WMOlAPvwb
	 +xd3tSyFbLV448aJF2v7MLh9p3eXBCWVE200DutXlUOYscdFHPgEIDOVsJM9pSvcOr
	 N2FjWn3tePtpvko1vkZSE9YJEbFsZxnny+d9QThJ8b91YcvNl/BaYGlVD9RK5LkOM2
	 2WG4PRK6sNsN2El+rrmsWVOr0slpqV81pphpNLSP9g/xibxY6yR/cjCkYPwk89hodj
	 1fC/ySsmb3s6A==
Message-ID: <sashiko-outbox-231098@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: tc358762: fix reset gpio handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-tc3-reset-v1-1-a5d27fe4b5de@kemnade.info>
References: <20261124-tc3-reset-v1-0-a5d27fe4b5de@kemnade.info>
 <20261124-tc3-reset-v1-1-a5d27fe4b5de@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:06:49 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/bridge: tc358762: logical GPIOD_OUT_LOW in
  tc358762_parse_dt() breaks reset
- [Low] drm/bridge: tc358762: missing Fixes trailer and unclear commit
  message wording
--

commit 9028d6282d51dd304edf7f4805b90948cbd05227
Author: Andreas Kemnade <andreas@kemnade.info>

> drm/bridge: tc358762: fix reset gpio handling
>
> Reset gpio is asserted when the chip should be active, deasserted when
> the chip is enabled. That is the wrong way. Apparently users are working
> around this by using GPIO_ACTIVE_HIGH to compensate for that bug but that
> is not correcly describing the hardware. Ignore GPIO polarity for now
> to ease transition hoping that nobody has an inverter in the signal path.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

[Severity: Low]
Should this bug fix include a Fixes tag:

  Fixes: 3355f4ee561d ("drm/bridge: tc358762: Add reset GPIO support")

Also, the first sentence says "asserted when the chip should be active,
deasserted when the chip is enabled", where both clauses describe the
active/enabled state rather than enabling vs. disabling the chip.

> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/t=
c358762.c
> index 76564d5e4f69f..404420c7b517e 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -164,7 +164,7 @@ static void tc358762_post_disable(struct drm_bridge *=
bridge,
>  	ctx->pre_enabled =3D false;
> =20
>  	if (ctx->reset_gpio)
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +		gpiod_set_raw_value_cansleep(ctx->reset_gpio, 0);
> =20
>  	ret =3D regulator_disable(ctx->regulator);
>  	if (ret < 0)
> @@ -182,7 +182,7 @@ static void tc358762_pre_enable(struct drm_bridge *br=
idge,
>  		dev_err(ctx->dev, "error enabling regulators (%d)\n", ret);
> =20
>  	if (ctx->reset_gpio) {
> -		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +		gpiod_set_raw_value_cansleep(ctx->reset_gpio, 1);
>  		usleep_range(5000, 10000);
>  	}

[Severity: High]
Does requesting ctx->reset_gpio with logical GPIOD_OUT_LOW in
tc358762_parse_dt() drive the physical reset pin high during probe when the
Device Tree specifies GPIO_ACTIVE_LOW?

drivers/gpu/drm/bridge/tc358762.c:tc358762_parse_dt() {
	...
	/* Reset GPIO is optional */
	ctx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(ctx->reset_gpio))
		return PTR_ERR(ctx->reset_gpio);
	...
}

With GPIO_ACTIVE_LOW in Device Tree, GPIOD_OUT_LOW (logical 0) is inverted
by gpiolib to physical 1 at probe time while vddc-supply is still disabled.
On standalone reset GPIOs, the bridge is not held in reset during power-up
and gpiod_set_raw_value_cansleep(ctx->reset_gpio, 1) in
tc358762_pre_enable() becomes a 1-to-1 no-op.  On the Raspberry Pi 7-inch
panel unit (drivers/regulator/rpi-panel-attiny-regulator.c), driving the
reset line to physical 1 at probe sets PC_RST_BRIDGE_N in REG_PORTC, which
causes attiny_lcd_power_is_enabled() to report the regulator as already
enabled so regulator_enable(ctx->regulator) in tc358762_pre_enable() skips
enabling panel and bridge power.

Instead of using raw GPIO accessors, should tc358762 use logical active-low
reset values (GPIOD_OUT_HIGH at probe, 0 in tc358762_pre_enable(), and 1 in
tc358762_post_disable()) and add a polarity quirk for "toshiba,tc358762"
"reset-gpios" in of_gpio_try_fixup_polarity() to handle older Device Trees?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-tc3-reset-=
v1-0-a5d27fe4b5de@kemnade.info?part=3D1
