Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB9D431A32
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175026; cv=none; b=VjOgIoTGk+Ike8n7dG/Xot5WyOIBTYVlE37X6XLX+uqX2eJtJsmAw4ooD9erChEiR3IEeU11ktWoq2y4+0Vp7scsdAelegGf8Y3bUFoFGXSVRfCla+asOzGwdhGk3x/H6mwf8thaGsjTDdyTThgRKsRDvn5nEJNIktpfgwuAyRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175026; c=relaxed/simple;
	bh=HXYEcw/IXH6S5qQ1ffYSEmuhlZFdMaF+YZvf2wCo5DE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SEVR7t3Dt6UiNf5sHWIpFZ2WwCnguKKZHXMngK+y9jt4iRa8VbFTt5WrPgel9757kvcY+AfVbxcKxxDMXweQykGBvra2xZjk5X65RTlShOJpaYy06WmwRP+tsOEn8V4ftuFVJV68Yr9cueZ7o3TP1zIZvzv0L1SZ8YugL1m9ZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4dxrQ2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4dxrQ2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BB71F000E9;
	Mon, 27 Jul 2026 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175018;
	bh=bTnh0iHWgdN7M/hdaUlGRbyPRrSve+y0RtiB/ajUSTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4dxrQ2zWLoXwn+tk3zf0YzHRSfH+23t7w3vx3XvAc20bPua4JPil8m57kpBMV+8E
	 5tHMIn0QvKjoV2wF+Foa/Z0/nXR0s0ugsMZoNP2Or9WhqX1+Zx4P0DPiQV8adLq5Mt
	 DNxOzoFQ8fLKk3KpY3ouAfUpSH/kDLMzh33mR70vKG4kmKrvDnhxsX9eTaoWQbUJot
	 R0TKwGQbm+RmF/zI9ddI9zpN8SNQdnOYhkRVNgtosIqi+PdSCJNrQa0UvETJRB7+ZB
	 m4VQj3y6fPK0EYX+2Awu1OR1Exox9LObILqRfztgTiKisn2QdKUOpbVzGjE4sPlUA8
	 bSK5HVIkkQejw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 15/35] pinctrl: airoha: fix getting gpiochip/pinctrl
 pointers in the IRQ handling code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727174141.664933-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-16-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:56:57 +0000
Message-Id: <20260727175658.68BB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver incorrectly uses `handle_simple_irq` for all GPIO inter=
rupts and manually clears the interrupt status after the handler runs. This=
 causes a race condition where edge-triggered interrupts that occur during =
handler execution are permanently lost.
--

--- Patch [15]: [PATCH v8 15/35] pinctrl: airoha: fix getting gpiochip/pinc=
trl pointers in the IRQ handling code ---
commit 62d50e3b85fb87d9a4b824ca2d986441454c0ea4
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

    pinctrl: airoha: fix getting gpiochip/pinctrl pointers in the IRQ handl=
ing code
   =20
This patch fixes the initialization logic for the gpiochip and pinctrl=20
pointers in the IRQ mask, unmask, and type callbacks. It corrects the=20
previous logic which assigned a pointer of struct gpio_chip to a variable=20
of struct airoha_pinctrl_gpiochip.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 67ee205e2b5b4..3feddec2e29e3 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2616,9 +2613,10 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)
>  {
> -	struct airoha_pinctrl_gpiochip *gpiochip;
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
> =20
> -	gpiochip =3D irq_data_get_irq_chip_data(data);
>  	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
>  		return -EINVAL;
> =20

[Severity: High]
This is a pre-existing issue, but is it possible that edge-triggered interr=
upts
are being lost due to incorrect flow control?

Looking at airoha_irq_type(), it doesn't call irq_set_handler_locked() to=20
configure handle_edge_irq or handle_level_irq based on the trigger type:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_type() {
    ...
	gpiochip->irq_type[data->hwirq] =3D type & IRQ_TYPE_SENSE_MASK;

	return 0;
}

Because of this, airoha_pinctrl_add_gpiochip() forces all interrupts to use
handle_simple_irq:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_pinctrl_add_gpiochip() {
    ...
	girq->default_type =3D IRQ_TYPE_NONE;
	girq->handler =3D handle_simple_irq;
    ...
}

This lacks proper edge/level flow control. When an interrupt fires,
airoha_irq_handler() manually clears the status after generic_handle_irq():

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
    ...
			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));
    ...
}

If a second edge occurs on the same GPIO while the handler is executing, the
status register is latched again. However, the regmap_write() clears this
newly latched status before it can be handled.

Should airoha_irq_type() set the appropriate IRQ flow handler, and could
the driver rely on the core IRQ framework rather than manually clearing the
status after the handler runs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D15
