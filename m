Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93793EF643
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589884; cv=none; b=HgW/Hx7IezmiCA5fG6RM7U84zRtGJGQM5fTgG4oXNHSzbaP7NYdJ3KageXFPDE2q6YY3p13rGPj101f/L3/CEy/aJFu1XExlavQbaetZuxQ4OOhAxfWlTVdelnYC1qizC3kcuTJiXmrkQChWawC4ZXNwF990nw2JICboiKNxKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589884; c=relaxed/simple;
	bh=GO6W6lPMul1Qby7Npqbb/ZNWsMDXm5uppLrzLmLrctQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xde3DUfv7Fa/DEqA9yyITY8q3oYPB2nT23bv3EnCe6xj0c/X4aISVbVaLZ/vJfrOwKs62QfaLmg0kHuifHPd4cgzFH5vKOCPPpvyH97xgRi6pxex+/PGKAamcRXz/kpyITQyLMoY5K+1mhZt915g/2LGgDS/QuTxfAkasUNW5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XG/pyJI7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XG/pyJI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE5B1F000E9;
	Thu,  9 Jul 2026 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589883;
	bh=gtgKr4iPHc75U1XUx17l7HofAG9xVJptl+XVw3yUv+k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XG/pyJI7KaIOYteR4lfU8o8DWz7Ujf+LAHjv7bJxT17ra3HcxQM0xvmqtUXvM46O+
	 fq7NI0b70OEnha3uB1DwwroRe6MgmmTqHL0NibuGnlLEnvaMdP5aL+wQ9oe4y8N4m3
	 +lYjhF+Q/pMlvK4IsgH/ljwXewBRRG6e2XpKhTHzftJDanPE/gGvWy51igoyR/8KVG
	 c5xkb7hLQ6jQIl0NwLO4gCeNlRbONPPwXQEAfy5wKOr0yh7812Do3la0wa1Ggx7BiS
	 vrAU+Jxiet1svxYyurkJtQD5I2xr05GiKGl2IK42GwjY/efPbGXGQIKc0cDqJ9XuPP
	 nZbcOSkXzBbIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:38:02 +0000
Message-Id: <20260709093803.2BE5B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Configuring GPIO direction to output before setting the intended=
 output value causes a transient hardware glitch.
--

--- Patch [5]: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver -=
--
commit 0fd38c3af385be1ae0dc21601c951d0e8f32ade5
Author: Janani Sunil <janani.sunil@analog.com>

gpio: ad7768: Add AD7768 GPIO auxiliary driver

This commit adds an auxiliary bus driver to expose 5 general-purpose I/O
pins on the AD7768/AD7768-4 ADC as a GPIO controller. The driver handles pin
direction and value configuration by sharing a regmap with the parent IIO
device.

> diff --git a/drivers/gpio/gpio-ad7768.c b/drivers/gpio/gpio-ad7768.c
> new file mode 100644
> index 0000000000000..c2f01b1abd7c9
> --- /dev/null
> +++ b/drivers/gpio/gpio-ad7768.c

[ ... ]

> +static int ad7768_gpio_direction_output(struct gpio_chip *chip,
> +					unsigned int offset, int value)
> +{
> +	struct ad7768_gpio_state *st =3D gpiochip_get_data(chip);
> +	int ret;
> +
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(st->parent, pm);
> +	ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D regmap_update_bits(st->regmap, AD7768_REG_GPIO_CONTROL,
> +				 BIT(offset), AD7768_GPIO_OUTPUT(offset));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(st->regmap, AD7768_REG_GPIO_WRITE,
> +				  BIT(offset), value << offset);

[Severity: Medium]
Will this sequence cause a transient hardware glitch on the GPIO pin?

By configuring the pin direction to output in AD7768_REG_GPIO_CONTROL before
setting the intended output value in AD7768_REG_GPIO_WRITE, the hardware
could briefly drive the line with whatever stale value is currently held in
the write register.

Would it be safer to write the intended value to AD7768_REG_GPIO_WRITE firs=
t,
and only then switch the pin direction to output?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ad7768-dri=
ver-v1-0-44e1194fd96a@analog.com?part=3D5
