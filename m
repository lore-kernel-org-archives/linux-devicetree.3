Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B9483BD8
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842496; cv=none; b=JDusHULT21X8J5jnKJogpX5gdgr0gf1zwieoRDriWY8UYYKhmswSWKEZx5gnYBFsgg87y6dNbirsmOnR3iXNtPNMyfBbYcU5w8qL+Ae3RgYSbCZdnWBLHqIcTI+QSviukjX6kyVQfN0pr8mfmZVCdtBvEZ1QmILUQm+9nGuk9nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842496; c=relaxed/simple;
	bh=wV8Tdr+3o2ldCeZZGWe6b0OPnYN0YfcAS6hhwx9CQyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g5Bf8rZy/XCduSgC15FnoXNIxCNXAYwhaYpOL4iDzjzP/ykuF6Pz8zWk8htPjalkh2yXo7+QFOHmTqauMexJNaZIklNN8ThUQ2w3vF3tpB/yhCKVe9wDarlR5dxIJeNmkekwmSkSiLHU1J0gBe7nMfjyfuW+iQq6P6ik0HugXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ow2ehcD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ow2ehcD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250BF1F000E9;
	Thu, 27 Aug 2026 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787842489;
	bh=F9gjmLNztO+Z/em0rHGVpXoK9dQ4tzH36wyde5fjfd4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ow2ehcD9IvLYds6oHm7Scp1LBPMJvoYqfdaBEycnplnxk8PZfwdD/KTsmvKOEHaEy
	 Gz5luigghr6yvzRhwNJr3qsrewWqr+3SiM9OBnkCX1sXmatBa3CPsbzoqHhi3fsrNQ
	 gB6QqxLVF88Tp2SqELUfzFVrlnjQd/BTGl0TH5VL/L9NDjMyV0fjm++xNVELaPuDwD
	 IBSK6W9ClReLn5e/xXVjqiVlhFn+EZQ6rhbuwjUrfQysFCml0J0p+Q2ND6aZqeOj8Z
	 /wI6daf+B+bITRg58VHnC4bGomYVpC3WX4TLNUQpvfKB6/7IALJPLs0H89hlMgrQMv
	 3WHu5B8Q1vZPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] gpio: realtek-otto: add pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Zavertkin" <misha.zavertkin@mail.ru>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
References: <cover.1787830440.git.misha.zavertkin@mail.ru>
 <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787830440.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 14:54:48 +0000
Message-Id: <20260827145449.250BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional use of GPIO_GENERIC_PINCTRL_BACKEND breaks GPIO requ=
ests and direction configuration on SoCs without a pinctrl driver.
--

commit e286232a1c082edc58e67d8d4c62156ff41a0294
Author: Michael Zavertkin <misha.zavertkin@mail.ru>

gpio: realtek-otto: add pinctrl support

This commit adds pinctrl backend support to the realtek-otto GPIO driver
so that RTL9607C can use pinctrl to request pins.

> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-otto.c
> index 37ef56f453187..b53c2a9a04c76 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -394,13 +394,14 @@ static int realtek_gpio_probe(struct platform_devic=
e *pdev)
> =20
>  	raw_spin_lock_init(&ctrl->lock);
> =20
> +	gen_gc_flags =3D GPIO_GENERIC_PINCTRL_BACKEND;
> +

[Severity: High]
Does unconditionally setting GPIO_GENERIC_PINCTRL_BACKEND break GPIO
functionality for SoCs that lack a pinctrl driver?

When a GPIO is requested or its direction is set on an SoC without a pinctrl
driver, gpio_generic_chip_init() routes the calls to pinctrl_gpio_request()=
 and
pinctrl_gpio_direction().=20

Because pinctrl_gpio_direction() calls pinctrl_get_device_gpio_range(), it =
will
return -EPROBE_DEFER when no pinctrl device overlaps with the GPIO chip. Th=
is
would cause all GPIO requests and direction configurations to fail indefini=
tely,
rendering GPIO unusable and breaking dependent devices on hardware like RTL=
8380
or RTL9300, which the commit message acknowledges might have pinctrl drivers
implemented later.

Should this backend flag only be set conditionally, perhaps by checking for
gpio-ranges in the device tree?

>  	if (dev_flags & GPIO_PORTS_REVERSED) {
> -		gen_gc_flags =3D 0;
>  		ctrl->bank_read =3D realtek_gpio_bank_read;
>  		ctrl->bank_write =3D realtek_gpio_bank_write;
>  		ctrl->line_imr_pos =3D realtek_gpio_line_imr_pos;
>  	} else {
> -		gen_gc_flags =3D GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
> +		gen_gc_flags |=3D GPIO_GENERIC_BIG_ENDIAN_BYTE_ORDER;
>  		ctrl->bank_read =3D realtek_gpio_bank_read_swapped;
>  		ctrl->bank_write =3D realtek_gpio_bank_write_swapped;
>  		ctrl->line_imr_pos =3D realtek_gpio_line_imr_pos_swapped;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787830440.gi=
t.misha.zavertkin@mail.ru?part=3D2
