Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3103146D2DC
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934471; cv=none; b=RtcSiHF5TMjbSzoN71CS9Vt1MKgs5ng9j4jZWflKlco8LT1tfH+1vN7pqjs+lUkTUwJKdOStsohUcblfNfXyq5nITTX1QMc6oUnIPGUqk1fOfsEBKjrjMTU5jdM4ab/fjWXyMCXm/M7fyERnkvP79O+NZBz68E0dxafEav5RtuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934471; c=relaxed/simple;
	bh=LnNGT/SCvMBDWwt5pdlAfYW8oLBYUCfjYh30yTxuBX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mISbbROWciIPEXyNCIvIjPt9rOi/7gAypfOMw1zTZUU9Mfa8/tJ9SmG+32T0NDj4PLpH556A/qMmRFQ8ZDr3lQxP9XhxHUwFt5hQzcGq7Do0B14btufzWsUgkB4SqvF+m22cdlZ2MUu4bwmsRqQv4VcrpcZvygkM8FEW4KXrHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlycruDE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlycruDE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3791F000E9;
	Wed,  5 Aug 2026 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934469;
	bh=LbL5zHdBthWqURCuK4SyGVWEZEee3g8ohbaA2go27BQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FlycruDEaxJ0r3VywJU+0A3J9tNWnE5LOGZHv8ZWpI/3W5o4OKlK5tkPse+BX3BFW
	 MZR9hWO4P02G6L12kNqHFs0vIqySoy2akWXicQAIAM8bew09MQtOAh61FyD0L6gnIw
	 g4a63HUadV8u0p5DYhUMA6vGLwQDW7qWbT1BnbQpF66yhra49Q8mdFJCNZdX5gSXpf
	 RU2JIRUZU6OawHwTVMlMRhGfW2xT/O9l18mu9Llpxsc7eLsyDMcsZSvgGE+SbzeMgE
	 IssXVILgUTTHAv3t6+3qgvp+uxvEWX/a7Qd7jVLvbdvh5P4h3XnTCdWeIWZMeON3XD
	 m5rNoRgU6NCPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 20/36] pinctrl: airoha: fix edge-triggered
 interrupts handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805123408.3767648-21-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-21-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:54:29 +0000
Message-Id: <20260805125429.8D3791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Double-acknowledgment of edge-triggered interrupts creates a race =
condition that silently drops newly latched interrupts.

Pre-existing issues:
- [High] Wait context violation on PREEMPT_RT kernels due to regmap accesse=
s under raw spinlock.
--

--- Patch [20]: [PATCH v10 20/36] pinctrl: airoha: fix edge-triggered inter=
rupts handling ---
commit 7e706f8c932e62aa6b87e6e27e1079c9773a3952
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix edge-triggered interrupts handling
   =20
This patch fixes the handling of edge-triggered interrupts in the Airoha
pinctrl driver. It defines an irq_ack() handler and configures the correct
high-level interrupt handlers based on the interrupt type.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 4859fcebac7de..960b0731459cd 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
[ ... ]
> @@ -2628,11 +2628,28 @@ static void airoha_irq_mask(struct irq_data *data)
[ ... ]
> +static void airoha_irq_ack(struct irq_data *data)
> +{
> +	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(data);
> +	struct airoha_pinctrl *pinctrl =3D gpiochip_get_data(gc);
> +	struct airoha_pinctrl_gpiochip *gpiochip =3D &pinctrl->gpiochip;
> +	u8 offset =3D data->hwirq % AIROHA_PIN_BANK_SIZE;
> +	u8 index =3D data->hwirq / AIROHA_PIN_BANK_SIZE;
> +
> +	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +		return;
> +
> +	regmap_write(pinctrl->regmap, gpiochip->status[index], BIT(offset));

[Severity: High]
This is a pre-existing issue, but will this regmap access cause a wait
context violation on preempt-rt kernels?

The .irq_ack callback is invoked by handle_edge_irq() while holding
the irq descriptor's raw_spinlock_t. If this syscon-based regmap does not
have use_raw_spinlock explicitly enabled, its standard spinlock_t becomes
a sleepable rt_mutex on preempt-rt, which is illegal to acquire under a
raw spinlock.

> +}
[ ... ]
> @@ -2673,8 +2702,7 @@ static irqreturn_t airoha_irq_handler(int irq, void=
 *data)
>  		for_each_set_bit(irq, &status, AIROHA_PIN_BANK_SIZE) {
>  			u32 offset =3D irq + i * AIROHA_PIN_BANK_SIZE;
> =20
> -			generic_handle_irq(irq_find_mapping(girq->domain,
> -							    offset));
> +			generic_handle_domain_irq(girq->domain, offset);
>  			regmap_write(pinctrl->regmap,
>  				     pinctrl->gpiochip.status[i], BIT(irq));

[Severity: High]
Does this introduce a regression by double-acknowledging the interrupt,
creating a race condition that could silently drop newly latched edge
interrupts?

For edge interrupts, generic_handle_domain_irq() calls handle_edge_irq(),
which calls airoha_irq_ack() to clear the hardware status bit before
executing the device action handler. If a new edge interrupt arrives during
the action handler, the hardware latches the event by setting the status bit
again.=20

Once generic_handle_domain_irq() returns, this unconditional regmap_write()
clears the status bit a second time, which would wipe out the newly latched
interrupt before the interrupt subsystem can process it.

>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D20
