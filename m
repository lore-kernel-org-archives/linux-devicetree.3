Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B91453A55
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934352; cv=none; b=tqtU0LgDWzEY44pVaKxvpXDcPEHefC/WvHCEj5++RFPiKdZqU8YRYs6OcTzrkfyt2FJjbX+8278jikc1BnIInjV3cIqzsr/EbFhp/EVzVRPiUy4WHHqb4uvua1wWRA0txIGRtxjKBtXutHOqt5FwzQ7KgvwFNllpQlO8RvcQVZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934352; c=relaxed/simple;
	bh=bHo+EV06Y69iI4g0OGwlPcx7j5s/zDOdONptloNffVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ts9KN/I+3JxZVKVjhxStjdvm1DLjRgo+SS/4OCaPastyuN7I69LIJapVNYUgWervzjC9d/fXPpYymO1jvheXL7MglV0/8UL531iL92QLFBDS7+FDqTuAnXAqz/d45Gkm/YCp+Duq0SMh5+gVKaROLnSbWfNJWsnax9RiY5b/DtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ubx5RVYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ubx5RVYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC521F000E9;
	Wed,  5 Aug 2026 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934348;
	bh=G917ve+zJY1/MjR9m3qO8oVB6zxSGiYnyydYt4wBpMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ubx5RVYkyHm4HRWDOjlh9gZNQ/0fJYZsmFGt0C+pcog5VuKaNYfXBHNAwUcAxrLag
	 tot+9ybg0r0mvth0v2IAyFkwNpEaPsF50TzW46ce4sqlZi2EUn/yKdmXydkNzggu9U
	 EKQCG9urp78K+a5hFhxvTyBSuhnA8RsIebtVYTrhLF5+Y6/KZxcdgSDnWGBR0YZNxh
	 kYKKh8sjmF4P4VT7/JfHWlByQSkakJtONEINy9YpRTzzkX9zgaaxVFoRRRIk1MdM+M
	 9Px/vtRy4/3TWJBYZY7If5ifX2EQJm/SA9cyodEM5PLmkD9p9EhwMXhwsp0xQY6f2r
	 HpBGtoDSwi7HQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 14/36] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805123408.3767648-15-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-15-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:52:27 +0000
Message-Id: <20260805125228.6BC521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] NULL pointer dereference in `airoha_gpio_get_direction` due to uni=
nitialized `gpio_chip` data.
--

--- Patch [14]: [PATCH v10 14/36] pinctrl: airoha: add missed get_direction=
() function for gpio_chip ---
commit a28e04a43e47b35e64952416f2914df3c7e0801d
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed get_direction() function for gpio_chip
   =20
This patch adds missed get_direction() function for gpio_chip.
Also it reimplements pinconf's get_direction() function using
newly defined function.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index a1044babb2823..df1694296046c 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2523,6 +2523,22 @@ static int airoha_gpio_get(struct gpio_chip *chip,=
 unsigned int gpio)
>  	return err ? err : !!(val & BIT(pin));
>  }
> =20
> +static int airoha_gpio_get_direction(struct gpio_chip *chip, unsigned in=
t gpio)
> +{
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(chip);

[Severity: High]
Can this cause a NULL pointer dereference during early probe?

The comments added in airoha_pinctrl_probe() explicitly mention that pinctrl
operations like get_direction() might run before the gpio chip abstraction =
is
completely initialized.

If airoha_pinconf_get_direction() is called during this window, it passes
the unregistered &pinctrl->gpiochip.chip into this function. However,
gpiochip_get_data() unconditionally dereferences chip->gpiodev:

drivers/gpio/gpiolib.c:gpiochip_get_data() {
        ...
        return gc->gpiodev->data;
}

Since gpiodev is allocated later during gpiochip registration, it will be
NULL here and crash. Could we use container_of() to derive the
airoha_pinctrl pointer directly from the embedded chip member to avoid this?

> +	u32 val, mask;
> +	u8 index;
> +	int err;
> +
> +	index =3D gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
> +	err =3D regmap_read(pinctrl->regmap, pinctrl->gpiochip.dir[index], &val=
);
> +	if (err)
> +		return err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D14
