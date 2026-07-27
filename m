Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBA842BE99
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175762; cv=none; b=teEEjJtjD8H2qwmNRgQ9lFdI7CeoFkmVwiNCeQbu75smTvWLoN4/UZsgmXJ8bsFvM9+m8FWGyymzxmULCd9owdi90a4txk5CucGvmXrxJbXK8whK5TglzeKhJfVgFG5mxNEO63y2OLero7xaPleIX4B73cxE9xT454OOaqyyctI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175762; c=relaxed/simple;
	bh=huRumKohYUAH28vJ3gRorf26vWbXzYqRPfr1aW39Y0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=okiC7KSr81I+f1WtxOaqcjTJ04AdoTHgbPAdw1EKdo/iOStEVpEORXwFyJFL7uOmhwYKj9RKq93hGglPq1RcuBNTmFSM2sdai0YPIFktpFbpCZ8WlpyAMG3dKEKmATruLZOJCOCnsCWl3yY+ELK40zkwLEgikEDxDo+UCCdGCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXyUv18F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXyUv18F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D2B1F00A3A;
	Mon, 27 Jul 2026 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175761;
	bh=MeAvwp5DvZfbereReiznd9RKP8comtWcQQ6Gozh92Cs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KXyUv18FJ1t6IiVVehv/GKDN3acEice9fkUNPPNdrdziD97WIxaDwkcu5TbNugQyn
	 uu8aioc8tqrZXDaVMEhaWC2moYV7whlryYyxdfV7u72X3LpLZD2X2lLjYERlwxybS8
	 0AoSupTcbmyxq64DPKceRHuPTNBM+RjHLTxUJ8Kw8zJ28bRELEJ+v376qxoHdQevG4
	 BcabEx0GIaqVKUYNRnALPJ6Knvay6hJQvWFQrBEyUjnczhyVVIdntQC8uxPr9cajiy
	 /XvVr5px47DVfCwJdJ7Zuc2DukLuy7860awteYEDqjQ0xX77NpulRgeQpPDEPtwwgY
	 nenCY92PNq7rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 21/35] pinctrl: airoha: split driver on shared code
 and SoC specific drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727174141.664933-22-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-22-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:09:20 +0000
Message-Id: <20260727180920.B9D2B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessary dynamic duplication of the immutable airoha_gpio_irq_ch=
ip structure.
--

--- Patch [21]: [PATCH v8 21/35] pinctrl: airoha: split driver on shared co=
de and SoC specific drivers ---
commit f869e493675daeefed57a5b2a9793621932f6025
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: split driver on shared code and SoC specific drivers

This commit splits the combined an7581/an7583 source file into shared pinct=
rl
code and SoC-specific pinctrl drivers. The initialization code was also ada=
pted
to work properly for shared and SoC-specific cases.

> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> index 721b2a53ab8a9..cfa6603aee33a 100644
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -128,9 +128,12 @@ struct airoha_pinctrl {
>  	struct regmap *regmap;
> =20
>  	struct airoha_pinctrl_gpiochip gpiochip;
> +	struct irq_chip gpio_irq_chip;
>  };

[ ... ]

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index c45b0637cf69b..34485cc29624c 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2601,6 +332,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha=
_pinctrl *pinctrl,
>  					struct platform_device *pdev)
>  {
>  	struct airoha_pinctrl_gpiochip *chip =3D &pinctrl->gpiochip;
> +	struct irq_chip *irq_chip =3D &pinctrl->gpio_irq_chip;
>  	struct gpio_chip *gc =3D &chip->chip;
>  	struct gpio_irq_chip *girq =3D &gc->irq;
>  	struct device *dev =3D &pdev->dev;
> @@ -2625,9 +357,11 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->base =3D -1;
>  	gc->ngpio =3D AIROHA_NUM_PINS;
> =20
> +	memcpy(irq_chip, &airoha_gpio_irq_chip, sizeof(struct irq_chip));

[Severity: Low]
Is this memcpy() necessary? The gpiolib IRQCHIP_IMMUTABLE flag is designed
specifically to allow sharing a single const static struct irq_chip across
all instances without modification.=20

Dynamically duplicating the immutable airoha_gpio_irq_chip struct defeats
the purpose of the immutable API contract and uses more per-instance memory.

> +
>  	girq->default_type =3D IRQ_TYPE_NONE;
>  	girq->handler =3D handle_bad_irq;
> -	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> +	gpio_irq_chip_set_chip(girq, irq_chip);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D21
