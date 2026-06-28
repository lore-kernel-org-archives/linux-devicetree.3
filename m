Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A349126BF1
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658625; cv=none; b=hZgrBAsD9bBFVbmZ97wcQjigX8toH05g6mPGN6OWk5Ms1sxZiJB60zS52IzeJ5EsGcQc19sXFtw+GkIloJlYVeiqFvsMXlGKiF5o5njtEi1BplfOVLsUqgiHD8t0L4AhO5XFuToYXjiw+k4nbztoV3XrManet7muGqP62I3Cn+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658625; c=relaxed/simple;
	bh=yZVmV5uVWujE3Vz6TiUlps2d8hiteBYyjII95qCP3PU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GsugTqHQhj/J8MhS2u/v8Pu0+iyXxQH1Ogg1aEFgJz6hGkKExxSTncFHKKT0u1O/Ss25iRaXe0cb4/NyBU52+fUPdShJ2+PxA85n1o0GUqmFube22a1gJP7qmnMmnxGejaZNHypeUdV7TU2UwvQilACu2EvKFy6hrd8In5rJ5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT9WaV9g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT9WaV9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CA81F000E9;
	Sun, 28 Jun 2026 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658624;
	bh=v4cE4llI//5Yo17hBq8fyXwjewmbllFyys/urSlBMOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IT9WaV9gIk55w8c4QDRV9UhVoOPBHOUr2WHERm0GdnaWISwVtJ1nLaQfZgI4oRaTH
	 /DDuaN/MzMwbrgs/frdruTIq8dBcNx+opxuA0+drDFv8UyuQqoM3ARRMFwP0KTkbAL
	 XQG6lKnn/09Bd3xxM5xWWmiGPdf/9nix3Y9rAmZ9Acmr5/jVISEj50TLqQ9WNBOMOS
	 x2fYkqtbSFALE0GFbr25RjzXLtlJSslmlP1z6gIUXzSVa95YUTzcCycKTAHstT5pbn
	 lH3KXL+3kks10mPyExqyHCM2Zv/c0G62opPpRzJV3BNWI+TelkrAECwc3qFSbagRZI
	 FXIX4XwYbKzUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/17] pinctrl: airoha: split driver on shared code
 and SoC specific drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628143733.273651-9-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-9-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:57:03 +0000
Message-Id: <20260628145703.B2CA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Dynamic allocation of `irq_chip` violates `IRQCHIP_IMMUTABLE` W^X =
protection and lacks `GPIOCHIP_IRQ_RESOURCE_HELPERS`.

Pre-existing issues:
- [High] Race condition and Use-After-Free during teardown due to early `de=
vm_request_irq()` registration.
- [High] Missing `gpiochip_disable_irq()` and `gpiochip_enable_irq()` calls=
 in `irq_chip` callbacks breaks pin locking.
--

commit 39c02a07ea03e1c882e3d925b659bdbc86446b63
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: split driver on shared code and SoC specific drivers

Split combined an7581/an7583 source file into shared pinctrl code and SoC
specific pinctrl drivers. The initialization code was adapted to work prope=
rly
for shared and SoC specific cases.

> diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/air=
oha/airoha-common.h
> index bff162062b066..9a202d5bb4b13 100644
> --- a/drivers/pinctrl/airoha/airoha-common.h
> +++ b/drivers/pinctrl/airoha/airoha-common.h
> @@ -150,9 +150,12 @@ struct airoha_pinctrl {
>  	struct regmap *regmap;
> =20
>  	struct airoha_pinctrl_gpiochip gpiochip;
> +	struct irq_chip gpio_irq_chip;
>  };

[Severity: High]
Does dynamically allocating the irq_chip struct here defeat the purpose of
IRQCHIP_IMMUTABLE?

By dynamically allocating the irq_chip structure within airoha_pinctrl, it
resides in writable heap memory rather than read-only .rodata, which bypass=
es
the W^X protection.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index e67c19df9f457..543475d23fde3 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -2552,9 +256,16 @@ static int airoha_pinctrl_add_gpiochip(struct airoh=
a_pinctrl *pinctrl,
>  	gc->base =3D -1;
>  	gc->ngpio =3D AIROHA_NUM_PINS;
> =20
> +	irq_chip->name =3D "airoha-gpio-irq";
> +	irq_chip->irq_unmask =3D airoha_irq_unmask;

[Severity: High]
This is a pre-existing issue, but does airoha_irq_unmask() fail to invoke
gpiochip_enable_irq()?

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call gpiochip_disable_irq(=
).

Without these calls, gpiolib never sets the GPIOD_FLAG_IRQ_IS_ENABLED bit.
Because this bit is missing, gpiod_direction_output() will not realize the =
pin
is actively used as an interrupt, allowing it to be successfully reconfigur=
ed
into an output pin, which can cause a hardware short-circuit.

> +	irq_chip->irq_mask =3D airoha_irq_mask;
> +	irq_chip->irq_mask_ack =3D airoha_irq_mask;
> +	irq_chip->irq_set_type =3D airoha_irq_type;
> +	irq_chip->flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE;

[Severity: High]
Should GPIOCHIP_IRQ_RESOURCE_HELPERS be included here?

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output,
potentially causing a hardware short-circuit.

> +
>  	girq->default_type =3D IRQ_TYPE_NONE;
>  	girq->handler =3D handle_simple_irq;
> -	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
> +	gpio_irq_chip_set_chip(girq, irq_chip);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0)

[Severity: High]
This is a pre-existing issue, but can the sequence of allocations here cause
a use-after-free during teardown?

Since devm_request_irq() is called with IRQF_SHARED before adding the
gpiochip and its irqdomain later in airoha_pinctrl_add_gpiochip(), the devm
cleanup will destroy the gpiochip and irqdomain before unhooking the
interrupt.

If a shared interrupt fires from another device on the same IRQ line during
removal or probe failure, airoha_irq_handler() will dereference girq->domain
after it has been freed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628143733.2736=
51-1-mikhail.kshevetskiy@iopsys.eu?part=3D8
