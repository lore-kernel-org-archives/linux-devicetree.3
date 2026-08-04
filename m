Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3503D380FFB
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860792; cv=none; b=Goj6ayX9JnWviCm5QvXysIOZ3x7LE9PzcmkVfuig/ardsipCGQ4YfhhcrAAVon0ggoIEasIDbEkbauuGnUrhNuNt0KKHgESyGs6vsrdkVbx0vmAnQVhVt0iS2Hb/eglhyeWsnPRpLGrvHObBaMgtdvzS9M+rysNh5T6DfoGFFSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860792; c=relaxed/simple;
	bh=maKYxFUzOyINnCo+bFwewKRmb0hPpYqHPg6NmZWWwWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OQc6k/M0Dllz4ASvADCCH0vuw05TpZXVCL5z+JfB7x8O93+mLV668P0rujhYUzL7udyq8u9FeD5x33ZfCMgcFm9HqJnADrfFNQwfWL6DcsK/n6W4XFbhdjix2K+lmQ9+OmgKam8YqtyCSzLYgGU0K6VUOg+BEmlxN8XjbeavkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbWQgR2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbWQgR2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F191F000E9;
	Tue,  4 Aug 2026 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860791;
	bh=iYf7UFzbvbkjAkdaP1vnTDXjWm1Jp+b1pgIfvh8Milo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PbWQgR2cyOmSDkTq4laWKHRqbK2Q6cZEZtRgOWy0MA0sYUCOme6swNXHBIuSSrZes
	 8BIG1EgF3lwkBvNPxATHA41XpDWbDsjs+bP1rjBwFZSfqa+LIxm5yyaGmVNupIlKpv
	 eQbk0zZSwsbMi3YyykgzzQkjzr4uyUfIUmsSc16DJIAWANw1YbqYlZb9MkURLUOORx
	 QMbNa+il1IqqMRVigH5C/L/E0SWd4LRKey+ib8L5JV3H8e9oGRzUmxydeQbq69CPs6
	 zROLDKaWHLSaSpRYg9dY/0YorEUcjk+ruG8RlH+DQXDC3q0CWz9H4D317vi1mCrO7r
	 zac1J/pnEr9AQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 14/36] pinctrl: airoha: add missed get_direction()
 function for gpio_chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-15-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-15-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:26:30 +0000
Message-Id: <20260804162630.C3F191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Calling `gpiochip_get_data()` before the `gpio_chip` is registered=
 causes a guaranteed NULL pointer dereference.
--

--- Patch [14]: [PATCH v9 14/36] pinctrl: airoha: add missed get_direction(=
) function for gpio_chip ---
commit bbd3ee4d01c65dc100b15681639e2141c5e673a0
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed get_direction() function for gpio_chip

This commit adds the missing get_direction() function for the airoha
gpio_chip. It also reimplements the pinconf get_direction() function
to utilize this newly added function.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index a1044babb2823..df1694296046c 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
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
Will this result in a NULL pointer dereference if called early during boot?

When early pinctrl operations are executed (such as applying pin
configuration hogs during pinctrl_enable(), or via debugfs reads before
GPIO chip registration), airoha_pinconf_get_direction() is called.

This delegates to airoha_gpio_get_direction() passing the partially
initialized and unregistered gpio_chip:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinconf_get_direction() {
    ...
    ret =3D airoha_gpio_get_direction(&pinctrl->gpiochip.chip, pin);
    ...
}

Because devm_gpiochip_add_data() has not been called yet in this path,
chip->gpiodev is strictly NULL. This causes a crash when
gpiochip_get_data() attempts to access gc->gpiodev->data.

Could this be restructured to avoid relying on the gpiochip_get_data()
accessor before the gpio_chip is fully registered?

> +	u32 val, mask;
> +	u8 index;
> +	int err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D14
