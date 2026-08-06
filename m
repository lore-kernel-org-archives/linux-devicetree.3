Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8045422532
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055035; cv=none; b=rX1Cr0hZi8PahQ+1QW/tCp7NiLl52vNt5xA+Mb8n8/UTVS9+1saJgE8xWBABQI2cs/JGiGscg5igrgR8erBtt8gqpgE+iQfl151ona+WlMqwctff0BB7h4FOK/UxNB1cbHPvA+AhknXyp45vo8wYYnlG/8X0qKfVOf6zOGn+Uy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055035; c=relaxed/simple;
	bh=LAJ/NaDRmib61uHCyayQpS6zFVbP5j4WXHUS0ZXproI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jiMRKGYu/VzKe2rI1+GfBMDZcaPo0BUcdauEqQR1wUgVek/5u90DYWVIMJk6pSQIS/8XMWqXWvuFnz/J4CdGq3FVFUYzsZKL6FY5Bj5iDucmJaL/SHoignl35+VIXHfTuNOLfrXvwYcRLhC3ddaZ4w72D7bwcqj14hJ81x7sCMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWo44GiV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWo44GiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE7F1F000E9;
	Thu,  6 Aug 2026 22:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055033;
	bh=rtyfxuJR16brLO99p4k8fCHDYHoH1W3LR0fxLQcTtV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nWo44GiVJ9VxwiuVJKPV8FAEoDU5I2/hosgi891IKb3HssQoIXPq6uY0rmUwVRJ03
	 ZhEEKPFPTc2sNlGCrZvEDocgFI57bXCbMEetV1xzNZtNKwds6W2ENU91Aq9eOJC7o6
	 7pF9oE7KDHl98fvJ4OIJyIZXkAbwEwQwhXK8Gh84fZaUXDwx11mcREwguhs4nnk+o+
	 JojWI5tiygRqmBw7rdsAP+xutA30fu/EGxBJCY3BLQujoYr+poXtECvQ7i8XgQSNFR
	 okUNv+xWYiBt72rvELXN2R8YSbrf3ROecZCg5PFf7V1hetGxPJUfVjJuPo9sWnozhD
	 KCN8H6Zo/Gd1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 21/37] pinctrl: airoha: fix edge-triggered
 interrupts handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806220615.4078303-22-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-22-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:23:52 +0000
Message-Id: <20260806222353.1FE7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Double-clearing of the interrupt status creates a race condition t=
hat leads to permanently lost edge interrupts.
- [High] Accessing a syscon regmap from within IRQ flow handler callbacks v=
iolates raw lock nesting rules, causing deadlocks on PREEMPT_RT.
--

--- Patch [21]: [PATCH v11 21/37] pinctrl: airoha: fix edge-triggered inter=
rupts handling ---
commit 1d404909643557ff6d1ca5162d1185d537256a4a
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
pinctrl: airoha: fix edge-triggered interrupts handling

This patch updates the airoha pinctrl driver to correct edge-triggered=20
interrupt handling. It introduces a custom irq_ack callback and explicitly=
=20
configures the flow handlers for edge and level interrupts.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 4859fcebac7de..960b0731459cd 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

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
Does this regmap_write call violate wait-type lock nesting rules on
preempt-rt systems?

With the changes to airoha_irq_type setting the flow handler to
handle_edge_irq, airoha_irq_ack is now invoked from the fast-path where a
raw_spinlock_t is held.

However, regmap_write on a syscon regmap acquires a standard spinlock_t,
which is a sleepable lock on preempt-rt kernels. Can this lead to
deadlocks or lockdep warnings?

> +}
> +
>  static int airoha_irq_type(struct irq_data *data, unsigned int type)

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
Is it possible for this manual regmap_write to cause newly latched edge=20
interrupts to be permanently lost?

Because handle_edge_irq now correctly calls airoha_irq_ack to clear the
status bit early, a new edge interrupt can latch during handler execution.

After generic_handle_domain_irq returns, this trailing regmap_write clears
the same status bit again unconditionally. If a new edge interrupt arrives
while the domain handler is executing, won't this second clear wipe it out?

>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D21
