Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927224BBEB
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786055840; cv=none; b=hbvUezM82saFTjWvGtOtPLWYZHd+wZQJHw4INnRuCIJyXLe8/Gnm4jvniwRiUfAKgmWiYrKoMiXMzMzeUDZFw6U8PnhUctXN/zDvgLYFVZcPuyw8S/+Noc8yq/9s7QisKr0ecnvsz0RCrOD4VhOYo/5HQF88G7XfXzfVStnI6Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786055840; c=relaxed/simple;
	bh=pZj8iebXIslIGTtjRKD4zjYGLSXY1ZFM5SjkS+1y2Ms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EYO9oSMBsKU+dNf71DVNzx/IyUhaDuCxF+EtXhnqtk2ICjo+XX6AhcocvRVBMXFVxiD7BQ77YYtif3vbC28h8PiOPzLvukao3a9utyAiMoRok1Pis9y6DF3phk8+KeA5jRhIYMZ0Fpg5sXSp6rA85yTb3Ubrd0aaeomJ3LdAy2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdf2RpZ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdf2RpZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0353E1F000E9;
	Thu,  6 Aug 2026 22:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786055838;
	bh=RvRcqzsjQPSw+gYzT4Q4IHEP91bgquFqmTkHDjGNW8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hdf2RpZ+JagWQRkzH9UOr1KCj9JCMr866NA/Eq9FWTKgQ6xdZbc0+1L6V0E2O6H73
	 KvFGYOng2j+zsS43T9hwSQfgYf7AE79Ur1JI4dvOWgRmprDn5pzNcfFF3qhmCo9xT6
	 i+kvLes2QzQEefil8s+8HJrkhZ2X4S8DOoZp+SdDJggmqx9hDc0Mu48RC8bX68/OLA
	 1PwSW0G16SJlN0koI/SQ07rNrV2ZGr9g9eRbJ34Rn0ituk5Zwdkb1sJiaOaO53C2by
	 LITMwqwQxS2K78Mo+4ncFUI21F/0bmcbLW3eS1yDE6mDz19+HqskluNG8pKu4vwChE
	 J7Hq+SVVvVhpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 25/37] pinctrl: airoha: split driver on shared code
 and SoC specific drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806220615.4078303-26-mikhail.kshevetskiy@iopsys.eu>
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
 <20260806220615.4078303-26-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 22:37:16 +0000
Message-Id: <20260806223718.0353E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Undocumented Feature Additions / Silent Fixes

Pre-existing issues:
- [High] Race Condition leading to Use-After-Free during teardown
- [High] Race Condition in IRQ handler dropping edge interrupts
- [High] Lock nesting violation on PREEMPT_RT due to syscon regmap operatio=
ns in atomic context
--

--- Patch [25]: [PATCH v11 25/37] pinctrl: airoha: split driver on shared c=
ode and SoC specific drivers ---
commit 43427b8e37815dccb451d5575c676158386beaf8
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
pinctrl: airoha: split driver on shared code and SoC specific drivers

This patch refactors the Airoha pinctrl driver by splitting the combined
source file into shared common code and SoC-specific drivers. It extracts
the pin controller and GPIO logic into a common file and creates separate
driver files for the AN7581 and AN7583.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
> @@ -0,0 +1,1476 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[ ... ]
> +static const int pon_pins[] =3D { 15, 16, 17, 18, 19, 20 };
> +static const int pon_alt_pins[] =3D { 36, 37, 38, 39, 40 };
> +static const int olt_pins[] =3D { 36, 37, 38, 39, 40 };
> +static const int pon_tod_1pps_pins[] =3D { 32 };

[Severity: Medium]
The commit message describes this patch purely as a structural split of the
combined driver into shared and SoC-specific parts. However, this appears
to add new functional features like the pon_alt and olt pin groups for
AN7583.

Could the commit message be updated to mention these functional additions,
or should they be split into a separate feature patch?

[Severity: High]
This is a pre-existing issue, but while looking at the initialization
flow in airoha_pinctrl_add_gpiochip() in
drivers/pinctrl/airoha/pinctrl-airoha.c:

	err =3D devm_request_irq(dev, irq, airoha_irq_handler, IRQF_SHARED,
				dev_name(dev), pinctrl);
	if (err) {
		...
	}

	return devm_gpiochip_add_data(dev, gc, pinctrl);

Does requesting the shared IRQ before adding the gpiochip create an
inverted cleanup order?

Since devres cleans up in reverse, the gpiochip (and its irq_domain) would
be freed before the IRQ is released.

If the shared interrupt fires during this window, could the handler
dereference a freed irq_domain pointer?

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition
in drivers/pinctrl/airoha/pinctrl-airoha.c:airoha_irq_handler():

	generic_handle_domain_irq(girq->domain, offset);
	regmap_write(pinctrl->regmap,
		     pinctrl->gpio_regs->status[i], BIT(irq));

Since the interrupt status was already acknowledged inside the flow
handler before generic_handle_domain_irq() returns, does this second
unconditional regmap_write() risk silently clearing newly latched edge
interrupts that arrived in the meantime?

[Severity: High]
This isn't a bug introduced by this patch, but I observed a potential
locking violation on PREEMPT_RT systems in the irqchip callbacks
like airoha_irq_mask() and airoha_irq_ack() in pinctrl-airoha.c:

	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);

Since these callbacks execute with the raw_spinlock_t irq_desc->lock held,
and the syscon MMIO regmap operations use a sleepable spinlock_t, will
this cause a lock nesting violation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806220615.4078=
303-1-mikhail.kshevetskiy@iopsys.eu?part=3D25
