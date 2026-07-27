Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4908942E8C6
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176125; cv=none; b=p/SZazhrt56bmerT+9nfp23lgNjejFryGhp6AAfl3FBoclfctpQDyGL3anLGNFhH/nSbLZmy8EesTbUmx+R10fOu+78gGMSIMT/7HCTdObb1S8HXZaGXr6y2YoST0ozte6D+C9ZJ6c6kFYfccMwZUip6mlh68WnyLjhDQVJfivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176125; c=relaxed/simple;
	bh=X5u0CE1ennLvznLxn6zJGH54Wf23Znivn2mR4xu13RY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q9cgeJtLgzKAKuFuMDyXsppC6NQCxeRD6La9ZeVCz8l4+yAFbq0sPDUs55Eo8WW9SPrjSGCNF9ig1lS0RuglXX1E7TT/k/qGtV+DlS27fHseD9gKGoGz8LUIUCfhG73kxBdMWwqjoCHAN9huNBtFP9jtxTTKBd0Hw3MbZN3ZSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+RPD8In; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+RPD8In"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B231F000E9;
	Mon, 27 Jul 2026 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785176124;
	bh=pUmjgCretEq+CAXuxwiOlhQtclND5mJz+EDmwke6H3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I+RPD8InPZzKQBpbguJwcW4S3Ma16Qw4014HLyaNmxsroOg8rCI1barGjyX4z7cJl
	 usfmQjCIl40QzSIvjoVemaZtjIqOzzEWNKahS206ErPVEkzcDV6c2bDQl/hzuA/2jo
	 Xa5P+d39Agbs+wNc5VPt+Pwyiw1INJ6WBG3dBGt0ByB9Ifnc4CJMwKOmp0VH9a6eGf
	 be2g3rLfg712h2PctkoDNMRxcz9fTmU4XTARKf7o1Mlhc4wmi/0sw+UXTdbVqCEjn8
	 uHB6vImzX8amEO6Ib2m2jZ9NWiyEuSd+DfI3lGtZr8UjNkPis3jr3yPGdxwX0bAaE+
	 n4sUDxaVyChQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 16/35] pinctrl: airoha: fix IRQ mask/unmask code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727174141.664933-17-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-17-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:15:22 +0000
Message-Id: <20260727181523.22B231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The newly added `gpiochip_enable_irq()` and `gpiochip_disable_irq(=
)` calls will continuously trigger kernel warnings and fail to set their fl=
ags because the driver lacks `GPIOCHIP_IRQ_RESOURCE_HELPERS`.

Pre-existing issues:
- [High] Lock nesting violation in IRQ callbacks causing a 'sleeping in ato=
mic context' bug on PREEMPT_RT.
- [High] Race condition leading to permanently lost edge-triggered interrup=
ts.
--

--- Patch [16]: [PATCH v8 16/35] pinctrl: airoha: fix IRQ mask/unmask code =
---
commit ccf67b0bce7e44b6db4c8d2e60b3cba3f820c9f4
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix IRQ mask/unmask code

When using IRQCHIP_IMMUTABLE, airoha_irq_unmask() must manually call
gpiochip_enable_irq() and airoha_irq_mask() must call
gpiochip_disable_irq(). Without these calls, gpiolib never sets the
GPIOD_FLAG_IRQ_IS_ENABLED bit. Because this bit is missing,
gpiod_direction_output() will not realize the pin is actively used
as an interrupt.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 3feddec2e29e3..6561f288dbf05 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2575,6 +2575,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
>  		return;
> =20
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(data));

[Severity: High]
Will this cause continuous warning spam on every unmask operation?

The gpiochip_enable_irq() function enforces a WARN_ON check to verify
that GPIOD_FLAG_USED_AS_IRQ is set. Because airoha_gpio_irq_chip specifies
IRQCHIP_IMMUTABLE but omits GPIOCHIP_IRQ_RESOURCE_HELPERS, the
gpiochip_irq_reqres() setup is never invoked. As a result, the required flag
is missing and the flag updates bypass being set entirely.

[ ... ]

> @@ -2609,6 +2610,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);

[Severity: High]
This is a pre-existing issue, but could calling regmap_clear_bits() here
cause a lock nesting violation on PREEMPT_RT systems?

The core IRQ subsystem invokes airoha_irq_mask() with the raw
irq_desc->lock held. The regmap operations use a standard spinlock,
which becomes a sleepable rt_mutex on PREEMPT_RT, leading to a sleep in
atomic context.

> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }

[ ... ]

[Severity: High]
This is also a pre-existing issue, but is there a race condition in the
interrupt handler that could cause permanently lost edge-triggered interrup=
ts?

Looking at airoha_irq_handler() in the same file:

drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler() {
	...
	generic_handle_irq(irq_find_mapping(girq->domain, offset));
	regmap_write(pinctrl->regmap, pinctrl->gpiochip.status[i], BIT(irq));
	...
}

If a new edge interrupt arrives while generic_handle_irq() is executing,
it is latched by the hardware. The subsequent Write-1-to-Clear via
regmap_write() would then inadvertently clear this newly latched edge
without servicing it. Should the status be cleared before invoking the
handler?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D16
