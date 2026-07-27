Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D93DDDC1
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139148; cv=none; b=J7JWc0DrumlwK88jitKuCu6rm4591n9hokQbadCvkcZyqMyd0/gUNov7Ke0sB2J/AtOCM12p5Mopm3Pn+9QAuqcqzZzoWESwt+AwUBC5Ly4xloB8VZ65tHFlngs+0qYKdG6g3r5TgMoDK3sbSA5sdzPVAUc7FxPv3+TONJBegiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139148; c=relaxed/simple;
	bh=eVwiOxsQYjsJPNcdr92qqqIscT6qIPPM04zC98ridzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5Fwme83rrdIQg5NfYmMt7AVlvTfI5zwMnI1S/QVEHqPPe3/GLtvDG6a2wVqDuxCdf300LT12lkQ6wL9bda57t2pTQ088x7BwoJymeoWouBYfLzMfBFgkhz2uHhCd0OKZ1ppRxn4I8yBevwmmewzLo2CaSJfJlB0fpt+6UQhjMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAYuzz+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAYuzz+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044731F000E9;
	Mon, 27 Jul 2026 07:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139147;
	bh=UA2MkMnUXnfW+VqDlKqvgmN5Ye8cAB3XjUNxtYc0IT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iAYuzz+Xc78WUjHw1iTgLL5vi/4XeK/RozgWYTz1TruIHGszPXb8vu5NMq/tDwwhk
	 sSGdV4qdmfuefMvpyUAws+sFYwcTVSFUTQ2+kLXF3m4IB/ZTtRo9VJUrAUt36Xs6mI
	 A+2DdIQ2fUDRFkAjF1Oi44UwF3GIAs/FGrZ+se1VzgStBqj5P4rMmMXMvRy1G52zld
	 HRYnXJAd4bBjKRS2W4v0vrsEw+f5Q9rybay/lEpwsM/AInuZLKNlG549nXEUeALRgL
	 JvQAFrubUM815lBO4PvH1ZmJpRCboDxeYPdzl+q9/2QkMo4zgx+ypXDGxb50H0lVBx
	 /ydrW9Nvfc1yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 15/34] pinctrl: airoha: fix IRQ mask/unmask code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-16-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 07:59:06 +0000
Message-Id: <20260727075907.044731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Adding `gpiochip_enable_irq()` and `gpiochip_disable_irq()` trigge=
rs continuous WARN_ON traces and fails to set the IRQ enabled flag due to m=
issing GPIOCHIP_IRQ_RESOURCE_HELPERS.

Pre-existing issues:
- [High] Missing GPIOCHIP_IRQ_RESOURCE_HELPERS causes a module refcount lea=
k, leading to a Use-After-Free panic on module unload.
- [High] The IRQ mask and unmask callbacks call regmap functions that acqui=
re a spinlock_t while a raw_spinlock_t is held, violating lock nesting rule=
s.
--

--- Patch [15]: [PATCH v7 15/34] pinctrl: airoha: fix IRQ mask/unmask code =
---
commit f9ea4e1f8ee631522df69bbad30882277aa2e0a4
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: fix IRQ mask/unmask code

This commit adds gpiochip_enable_irq and gpiochip_disable_irq calls to
the mask and unmask callbacks. This ensures gpiolib correctly tracks when a
pin is actively used as an interrupt.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 6b881ab56d9c3..2dc97e0711003 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2580,6 +2580,7 @@ static void airoha_irq_unmask(struct irq_data *data)
>  	if (WARN_ON_ONCE(data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type)))
>  		return;
> =20
> +	gpiochip_enable_irq(gc, irqd_to_hwirq(data));

[Severity: High]
Will this trigger a continuous WARN_ON trace and fail to set the flag?

The driver defines airoha_gpio_irq_chip as IRQCHIP_IMMUTABLE but omits the
GPIOCHIP_IRQ_RESOURCE_HELPERS macro. Because of this, .irq_request_resources
is NULL, so the IRQ core bypasses gpiochip_reqres_irq.

Since gpiochip_lock_as_irq is never called, the GPIOD_FLAG_USED_AS_IRQ
bit is never set on the GPIO descriptor.

The newly added gpiochip_enable_irq call has a safety check:

WARN_ON(!test_bit(GPIOD_FLAG_USED_AS_IRQ, &desc->flags));

Because the flag is missing, does this trigger a kernel stack trace on every
mask/unmask operation, completely preventing GPIOD_FLAG_IRQ_IS_ENABLED from
being updated?

[Severity: High]
This is a pre-existing issue, but does the missing
GPIOCHIP_IRQ_RESOURCE_HELPERS macro also cause a module refcount leak?

By bypassing gpiochip_reqres_irq, the try_module_get(gc->gpiodev->owner)
call that pins the GPIO controller module in memory is skipped.

If the pinctrl-airoha module is unloaded while an IRQ is requested, will
subsequent IRQ triggers or unregister operations access freed memory and
cause a use-after-free panic?

[ ... ]

> @@ -2614,6 +2615,7 @@ static void airoha_irq_mask(struct irq_data *data)
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->edge[index], mask);

[Severity: High]
This is a pre-existing issue, but does calling regmap_clear_bits here
cause a lock nesting violation?

The IRQ core calls the .irq_mask and .irq_unmask callbacks with the irq
descriptor lock held, which is a raw_spinlock_t.

The driver calls regmap_clear_bits and regmap_update_bits on a regmap
that initializes its lock as a spinlock_t. Acquiring a spinlock_t while
holding a raw_spinlock_t is an invalid wait-type nesting violation.

On PREEMPT_RT kernels where spinlock_t is a sleepable rt_mutex, does
acquiring it while holding a raw_spinlock_t result in sleeping in atomic
context?

> +	gpiochip_disable_irq(gc, irqd_to_hwirq(data));
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D15
