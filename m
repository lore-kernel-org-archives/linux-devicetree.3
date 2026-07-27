Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64C3DE457
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139231; cv=none; b=cw/PmYeaMQwOp5aLtxxQLloqgJLqp+ql+0w5yc4sdnhR/VG6X5YYWMdHIvpVSujoWg76cbi3Mqk0+c9QvTgbJ7os82HfwLXjtwMq/TuD+wOIxFosVqydV4uG1ZoZeNd7qWisssM/hiDGtcjtJNufFl39apIvUh2nas07LD/4qus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139231; c=relaxed/simple;
	bh=jlnvhWzm4dqH3hSxTKGbLuxcpPY+A1EBSwkDQZUiwBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vBV1kYuh2O+SPa17pr/0ali1in5DZhlyxYyVfftUaNtJJSt53fwExDVv9czKsr0eUZGlGWXTM6BzTT+f0LZJuYErF9WrMwlQt4/AfsYU1q6PQkkl+STHh3ttCEDyp/K+uZup+Yllc+e4r/aiqtGSNY7r2ALh8CMBWAGr03ucgwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3KucxOj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3KucxOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6316C1F00A3D;
	Mon, 27 Jul 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785139229;
	bh=CnroOdmpIsh47iWUcFvT5hItSvBeD7ls8I6Tz7G+OeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f3KucxOjQD6RW3j2CFcZVgwDOi1rOjmkoYGLblhIWTNizuh6go7fAMWMVLGg2rJVt
	 rv3QwzYhU58oLDOuDb+bId4gUIe8MOUNHuHUws3QwI2v5i/w3drMMAsTX2g9hbkjxM
	 ixZN9q0VFupH5D68IS+Ndv9RViPHhGgMD922LFiL8kUJcpiVyjLX/D0GsHeL9NEwNm
	 qfOkFFk+O2+X0nlpphhlu/PrgQ3Paf2RXI9ZHELjMze6xsmb+Yxrg1wMRKGnLpIGaH
	 WFnIxuyzeWhpUSCJvFeY8+9ufSpbknTKk8O4s2fowoB+vV06tFfDqgbbuY/RD8pnH+
	 S0aD37NI7Om7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 18/34] pinctrl: airoha: remove not needed irq_type[]
 array
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727074234.3761170-19-mikhail.kshevetskiy@iopsys.eu>
References: <20260727074234.3761170-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727074234.3761170-19-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 08:00:29 +0000
Message-Id: <20260727080029.6316C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The irq_chip callbacks (mask, unmask, ack) call regmap functions o=
n a regmap that uses a sleepable spinlock, leading to a sleeping in atomic =
bug on PREEMPT_RT.
--

--- Patch [18]: [PATCH v7 18/34] pinctrl: airoha: remove not needed irq_typ=
e[] array ---
commit 36bbed24ea5a5464c148e69474b3311bae84ccc0
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: remove not needed irq_type[] array

irq_type[] array inside airoha_pinctrl_gpiochip structure is not
actually necessary. Use trigger type from 'struct irq_data' instead.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 0a865cf0c2728..6d4b282c21eaf 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c

[ ... ]

> @@ -2613,7 +2611,7 @@ static void airoha_irq_mask(struct irq_data *data)
>  	u8 index =3D data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
>  	u32 mask =3D GENMASK(2 * offset + 1, 2 * offset);
> =20
> -	if (data->hwirq >=3D ARRAY_SIZE(gpiochip->irq_type))
> +	if (data->hwirq >=3D AIROHA_NUM_PINS)
>  		return;
> =20
>  	regmap_clear_bits(pinctrl->regmap, gpiochip->level[index], mask);

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under revi=
ew,
but could these regmap operations trigger a sleeping in atomic bug on preem=
pt-rt
kernels?

The genirq core calls irq_chip callbacks such as airoha_irq_mask(),
airoha_irq_unmask(), and airoha_irq_ack() while holding the irq descriptor =
lock.
This lock is a raw_spinlock_t which disables interrupts and preemption.

Because pinctrl->regmap is instantiated from a syscon without setting
use_raw_spinlock =3D true, its internal lock defaults to a standard spinloc=
k_t.

On preempt-rt kernels, a standard spinlock_t is an rt_mutex and can sleep.
Attempting to acquire it during regmap operations like regmap_clear_bits(),
regmap_set_bits(), and regmap_write() while holding a raw_spinlock_t will
cause a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727074234.3761=
170-1-mikhail.kshevetskiy@iopsys.eu?part=3D18
