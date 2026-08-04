Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0A46EF72
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860595; cv=none; b=e0YZuDNUXtcfFHvMIzwT/S+6yq1iGvfCuK9gXGhWW150DsMdj7MLEOojsxyaJWFwRsb7DEJu0/MTLqkasoP2N8cA/lNuFp0ek3+HufTyK/FZ2hgrGbAnAA+4IXy/tLVxf0S+LgA2bfa7TsnV6z/GUMH5Pm/n8tM80LSiJkZ8Y84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860595; c=relaxed/simple;
	bh=LycYmcKK6V8kPlXq6PSeYAJZU7z45uoQaxxZf/5SblA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cqy/Xj53+RtC/BtVoMmFB9ma1IcMv0xbqzeOTax0h1UOzu40OLDo51hMtmTYYXY29GJLrbpCHOpWwlxd4lt5y3SP0Ks/Sl4aev5CEJP19mb9vhnOEJSsSIAVDERVd51eFQXYdoT8fEN7v1u4rmvHjkkiciFaU74EHjWpfdFzGLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJvEW+MQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJvEW+MQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E211F000E9;
	Tue,  4 Aug 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860593;
	bh=f+rNPF0bOlVCBvCVLdhwp/insfQqgn4bzOwl1qjfXhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YJvEW+MQEIfzp60V1p8nUStjs9wgiV2HFjj0k5F/LWzKBHy/GGfOw+DCoKeTjry6r
	 oNthIOzIv7VCp6PMFp8WklFaqRALASS/iQZ+kOIe4r6+An7l4KuhVyI5jjA+4VVc7y
	 zu2gzg4C4fQWWjvHA7SAPJ63Vcoh21KugZS+rjL2/pmRcnkuhv5H9aZLdSAFYfNjaC
	 oM3yQWNWrDGzzocc9FjVfgmHtJncO3VNMTlc+zUVhf9QcOibfdXUgUKMhavRd+ihkH
	 FQStwexrEwxzkt5qVU3iA9c95FVMv8LDY005SXjHyWoY54WowIUrokTb5maVbla7mg
	 wHbbXecyizRGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 20/36] pinctrl: airoha: fix edge-triggered interrupts
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804160419.3592327-21-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-21-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:23:13 +0000
Message-Id: <20260804162313.93E211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Double-acknowledgment of edge-triggered interrupts in `airoha_irq_=
handler` causes permanently lost interrupts.

Pre-existing issues:
- [High] Calling `regmap_write()` / `regmap_clear_bits()` under a raw spinl=
ock leads to invalid lock nesting and sleep-in-atomic on PREEMPT_RT.
--

--- Patch [20]: [PATCH v9 20/36] pinctrl: airoha: fix edge-triggered interr=
upts handling ---
commit 1e0dfc059b036a31732f2260cc6e2e46d9e2bedf
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix edge-triggered interrupts handling

This patch adds an irq_ack handler and configures edge-triggered
interrupts to use handle_edge_irq instead of the simple handler.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 42ae588e6343b..4929e90d19a82 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2628,11 +2628,28 @@ static void airoha_irq_mask(struct irq_data *data)
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
> +	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +		return;
> +
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);
>  	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }
> =20
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
This is a pre-existing issue, but does using regmap_write() inside
irq_ack() (and similarly in irq_mask()) cause an invalid lock nesting on
preempt-rt systems?

The irq core invokes these callbacks with the descriptor's raw spinlock
held. Since pinctrl->regmap is a standard syscon, it uses a standard
spinlock_t internally. On preempt-rt systems, spinlock_t becomes a
sleepable rt_mutex, which could lead to sleeping while holding a raw
spinlock.

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
Does this trailing regmap_write() clear newly latched interrupts?

Since this patch introduces airoha_irq_ack() which acknowledges the
hardware interrupt early during handle_edge_irq(), clearing the status bit
again here could wipe out new edge events that latched while the
handler was running.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804160419.3592=
327-1-mikhail.kshevetskiy@iopsys.eu?part=3D20
