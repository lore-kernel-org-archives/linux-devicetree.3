Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB943DEFF0
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032520; cv=none; b=lxn6kK0jiY5QO6SLxoUIPQ7f64kBLbJQtR/bKehXIhMIT1Ey/iuPFHZ525RzFOd7xa2u3LLQ5x2woDX5uecxoWqwBhgsQpIqPRJdQcxFrivtilegKxaaahbSsUZBFxULJYDHPNZjaqTv6Z0K8bAZpUoTHUsARCVYoNF65Iz/jrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032520; c=relaxed/simple;
	bh=W503FlTpKMjD6V9Y7hOeOIQnpWOvIvwOop/p0fBnocU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXn0h5Sb3ZsSy3+K/zcb7aJGACuFx9gxHc4IcuR3zxLMOkxI0sCXKwJj/0dneaiKh+8Y8bEOQUhi98DB5y0ZIHTbdbxBWZ0vkdLFqcHQoqJ6tRAOY232Fr41HqYfBeGiOjY+S3e/VvSIYUe/3XDy+Q9+l453Gt38BM6YMYS8d7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AECJJy9j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AECJJy9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616891F000FF;
	Thu, 10 Sep 2026 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032516;
	bh=lyd+mIHAWsyI9KPhZRpvz9u6XLwSvz8rSRvBIBTlkjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AECJJy9jD/dPvr1j0l32otQmIj1j3zs3sSwdPWaponfmO5/ZMPbRG4RUGMC7zw0Re
	 GPVCtv5aU9/LtjEL/xXUO5TkztO4uEdKB6uSCedFdnDiu2Gpurm4rY+SoOyoUU1yBa
	 C6Xfmh0XCrNnCK5nsOipsdygyxkwcrgYVmfXwSXkhhqJ+IHOdgbCC8+XYB44bFXjFd
	 t7U3rpjCE0GzzcFZ4SyZRp6mtCKFKnXZWGCD/5/nJAuKJzucoLMU4lP07mUfydaJa4
	 xch9+6KkHrkCb87i+jeWyxQic8zmch+jUNPiNY6HdKPj1jZSsw3n5zYlENGrHoybCj
	 2WNzYhG/Ih0vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add onsemi FUSB15201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910091751.819264-3-shengchao.guo@oss.qualcomm.com>
References: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
 <20260910091751.819264-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:28:35 +0000
Message-Id: <20260910092836.616891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unrecoverable interrupt storm due to masked write-1-to-clear opera=
tions.
--

commit f97eba3512034404133da1fbd6a5cac5d95da491
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

usb: typec: Add onsemi FUSB15201 driver

This commit adds the driver for the onsemi FUSB15201 dual-port USB Type-C=20
and Power Delivery controller.

Link: https://lore.kernel.org/r/20260902045938.184221-3-shengchao.guo@oss.q=
ualcomm.com

> diff --git a/drivers/usb/typec/fusb15201.c b/drivers/usb/typec/fusb15201.c
> new file mode 100644
> index 0000000000000..897b2fabc449e
> --- /dev/null
> +++ b/drivers/usb/typec/fusb15201.c

[ ... ]

> +static irqreturn_t fusb15201_irq(int irq, void *data)
> +{
> +	struct fusb15201 *chip =3D data;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	unsigned int i;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port =3D &chip->ports[i];
> +		unsigned int pending;
> +
> +		if (!port->port)
> +			continue;
> +
> +		if (regmap_read(chip->regmap, FUSB15201_REG_INTERRUPT(i),
> +				&pending))
> +			continue;
> +
> +		pending &=3D FUSB15201_INT_ALL;
> +		if (!pending)
> +			continue;
> +
> +		/* Write one to clear */
> +		regmap_write(chip->regmap, FUSB15201_REG_INTERRUPT(i), pending);

[Severity: High]
Can this lead to an unrecoverable interrupt loop if the hardware sets an
unexpected bit?

By applying a bitmask (pending &=3D FUSB15201_INT_ALL) before writing back =
to
the W1C register, any interrupt bit outside this mask will never be cleared.

[ ... ]

> +static int fusb15201_hw_init(struct fusb15201 *chip)
> +{
> +	bool source_only =3D true;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i =3D 0; i < FUSB15201_NUM_PORTS; i++) {
> +		struct fusb15201_port *port =3D &chip->ports[i];
> +
> +		if (!port->port) {
> +			/* Nothing describes this port, keep it quiet. */
> +			ret =3D regmap_write(chip->regmap,
> +					   FUSB15201_REG_INT_MASK(i),
> +					   FUSB15201_INT_ALL);

[Severity: High]
Does this leave bits 3-7 unmasked on unused ports?

Since FUSB15201_INT_ALL is 0x07, writing it to the mask register might
keep bits 0-2 masked, but leaves the upper bits completely unmasked.

> +			if (ret)
> +				return ret;
> +
> +			continue;
> +		}
> +
> +		if (port->cap.type !=3D TYPEC_PORT_SRC)
> +			source_only =3D false;
> +
> +		ret =3D regmap_write(chip->regmap, FUSB15201_REG_INT_MASK(i), 0);

[Severity: High]
Does writing 0 here unmask all interrupt bits on the port, including ones
not covered by FUSB15201_INT_ALL?

Combined with the clearing logic in fusb15201_irq() that only clears bits
defined in FUSB15201_INT_ALL, if any of the upper bits trigger an
interrupt, they won't be cleared. This would cause the IRQ handler to
immediately re-trigger in a continuous storm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910091751.8192=
64-1-shengchao.guo@oss.qualcomm.com?part=3D2
