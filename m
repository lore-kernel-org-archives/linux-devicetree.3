Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E7346D573
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934677; cv=none; b=rTG6Qt6mjb4Rn49n5q91obg9npRwHTmJTYGUqdIfLWIuvlWtFZCF8SMgi2ABjTRvhPh4FeB82jQTTGuLhIcB7lHmLQeBZLDLnqxAa0JDmyIG4H+WuWeQBfPi2GyJXE+mB3tiyAAGPr6CqBQSBJjpidmPMIu8GGihEYTWqEEoP/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934677; c=relaxed/simple;
	bh=KMkh3gxtyWEkOgLRfwqFzDhYWd/wS1bV2q0OUBnwZx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dUHyEDJnPSV/oOLUpfgG3Mif91LGKpw0v8GZ0yFlReOoMrjFnQQ+GenbqbkZyZD8cquIb9GNEu5pw2sEnOK7SLZ6Tn7AQpCamGNayuu3veBU3KbPZniCY0tZ4aozHeuSosk0ja5DdOzwDYd5ag7S8vaJLzLiBQr9zooGIF4YNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3l+iaFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3l+iaFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1161F000E9;
	Wed,  5 Aug 2026 12:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934675;
	bh=UHbovGeAwxr8u34ZR+ujkfdUnvuPLG92tabwZwN3GfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c3l+iaFpTZvnQ+92viyEM2CXGHcv90FgBQ3qDRKlhw5u/fawtziJFhWvRYpPXTlEy
	 bFYXSbe4o9Wq4e8UoKzIkYRHuBgRtzk1pzOdEA2/Fp7mNownN9eFwp+PXYschn0z6G
	 COfEPHA3IBXcxLea6PPo7Y1aXanfmI7VwtdS8A1eMWWM8PsZcRFWuqKCnnr08mFSxS
	 JWpK0Duku/iI4m2jh6R0A6Thu9VyTbfdyA5fyxlXcSzEGGoEGJ8o63LO1PzAa9hsJY
	 f2TmAK85gA0vM4kTEJIQ/JNN1k9tbEWvCxdIabaJwxDJWG1b2YD1fWqhpCTojj+g4y
	 qdD67s8L+Ty5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 21/36] pinctrl: airoha: remove not needed irq_type[]
 array
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805123408.3767648-22-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-22-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:57:54 +0000
Message-Id: <20260805125755.3D1161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The irqchip callbacks (airoha_irq_unmask, airoha_irq_mask, airoha_=
irq_ack) call regmap functions which take a spinlock while running under th=
e raw_spinlock_t of the irq descriptor, leading to lock nesting violations =
on non-RT (with PROVE_RAW_LOCK_NESTING) and deadlocks/sleeping-in-atomic on=
 PREEMPT_RT.
--

--- Patch [21]: [PATCH v10 21/36] pinctrl: airoha: remove not needed irq_ty=
pe[] array ---
commit c04f7b2c079eefe11ed72d70dd01520d657ba1d1
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: remove not needed irq_type[] array

The irq_type[] array inside airoha_pinctrl_gpiochip structure is not
actually necessary. This commit removes it and uses the trigger type
from struct irq_data instead.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2628,7 +2626,7 @@ static void airoha_irq_mask(struct irq_data *data)
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
> -	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +	if (data->hwirq >=3D AIROHA_NUM_PINS)
>  		return;
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);

[Severity: High]
This is a pre-existing issue, but does calling regmap functions here cause a
lock nesting violation?

The IRQ subsystem invokes callbacks like airoha_irq_mask(),
airoha_irq_unmask(), and airoha_irq_ack() while holding desc->lock, which i=
s a
raw_spinlock_t. Inside these callbacks, the code calls regmap_clear_bits() =
and
regmap_write() on pinctrl->regmap.

Syscon regmaps default to a standard spinlock_t. Acquiring a spinlock_t whi=
le
holding a raw spinlock can lead to lockdep warnings on non-RT kernels, and
sleeping in atomic context or deadlocks on PREEMPT_RT where spinlock_t beco=
mes
a sleepable lock.

Could this regmap be configured to use a raw spinlock, or could these regis=
ter
accesses be handled outside the raw spinlock context?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D21
