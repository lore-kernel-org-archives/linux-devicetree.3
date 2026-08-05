Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E744CF59
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934884; cv=none; b=AST2x1xqJ2ma4Ynk1qpVvftx1O8O4YSkG7eJps2ZZP4LkvNVyywlyg4O9/77spJW0fUCox+RdtLoRhZ39EUH7scuEgsiEqjgENjctmhYUVPX6XzN9xv7fD5aa8UoCXa6Jj3+zoS45Z2pFy4cNGZWJHluFStI8Urdh8mrWqpyY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934884; c=relaxed/simple;
	bh=pSqINmizYf8QwzgrWe2ZDf6UOCE19/4vzcN/v98BDhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bdq2YOtV2vfM7DuAajVrJA9z04VgNhZCVO33z8kN9fkGrXn/7da58iKNaITM09eLUa2cW0i5iMY2fgeryQE0FGVi0Cu4O7rG3yE30clb6pwmHEfvIUAeu+hQuvstz7DiwEDNgeseR2KUtinZXH5dAabhV3av5MP3dQ1QfIPs2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0spzcUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0spzcUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0A51F000E9;
	Wed,  5 Aug 2026 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785934882;
	bh=EwlJao5OOFClE1NS+goqQdPZ5VMFzqw+12Bmn9ISLbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0spzcUmTYiOddivsgLX0IV7YgohqWykm4F+EzHiq8OtXp6MO9mhsS0wCi2DOs2Ud
	 R3Xg4+ORKSlZ+0yEH9dB4oK9b2RSeXJ4yoEMBEVbdmfj+PjuTmKJsjlQf61DIdyrp/
	 IR5EDNVHLHe9PW2ZlD+8mLH1PO+8m0LBw8jErQcTSkI9cDwF3PEaQcT5CBvv9V4yqz
	 LXy9MWRg8boV38qB/gZHegr+wEJC5848q9IGOkiUaKutqa/3mIuG89fZskWcTNFKYn
	 beRQCqZhXc7cxyFonAjX4r0Y3lundE6//bb1UAUSsSaai4hwGrv2jYfHSxMaWQeGa9
	 rQXXBDXP+sEjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 18/36] pinctrl: airoha: add missed IRQ resource
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260805123408.3767648-19-mikhail.kshevetskiy@iopsys.eu>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-19-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:01:21 +0000
Message-Id: <20260805130121.8C0A51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The immutable irqchip lacks required calls to `gpiochip_enable_irq=
()` and `gpiochip_disable_irq()`, breaking pin direction locking.

Pre-existing issues:
- [High] The custom IRQ handler acknowledges interrupts after executing gen=
eric_handle_irq(), which can cause lost edge interrupts.
--

--- Patch [18]: [PATCH v10 18/36] pinctrl: airoha: add missed IRQ resource =
helpers ---
commit 8b10735b561d072460bc6ee2cdf58e36ca203f47
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: add missed IRQ resource helpers

Without hooking .irq_request_resources, gpiolib cannot set
GPIOD_FLAG_USED_AS_IRQ. This breaks pin direction locking and can allow
userspace or another driver to reconfigure an active IRQ pin as an output.

> diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/ai=
roha/pinctrl-airoha.c
> index 9b880fd20a1a0..f3078f9b14a76 100644
> --- a/drivers/pinctrl/airoha/pinctrl-airoha.c
> +++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
> @@ -2689,6 +2689,7 @@ static const struct irq_chip airoha_gpio_irq_chip =
=3D {
>  	.irq_mask_ack =3D airoha_irq_mask,
>  	.irq_set_type =3D airoha_irq_type,
>  	.flags =3D IRQCHIP_SET_TYPE_MASKED | IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,

[Severity: High]
Does adding GPIOCHIP_IRQ_RESOURCE_HELPERS to an immutable irq_chip require
adding calls to gpiochip_enable_irq() and gpiochip_disable_irq() to the
unmask and mask callbacks?

When .irq_request_resources runs, gpiolib locks the IRQ and sets
GPIOD_FLAG_IRQ_IS_ENABLED. Because airoha_irq_mask() doesn't call
gpiochip_disable_irq(), this flag is never cleared. Any attempt to set the
pin to output while masked will fail with -EIO in gpiod_direction_output().

Should airoha_irq_unmask() call gpiochip_enable_irq(gc, data->hwirq) and
airoha_irq_mask() call gpiochip_disable_irq(gc, data->hwirq) to properly
notify gpiolib of the IRQ state?

>  };
> =20
>  static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,

[Severity: High]
This is a pre-existing issue, but can acknowledging the interrupt after
executing generic_handle_irq() cause lost edge interrupts?

Looking at airoha_irq_handler() in the same file:

			generic_handle_irq(irq_find_mapping(girq->domain,
							    offset));
			regmap_write(pinctrl->regmap,
				     pinctrl->gpiochip.status[i], BIT(irq));

If a new edge arrives and latches in the hardware register while the action
executes in generic_handle_irq(), writing BIT(irq) to the W1C status
register afterwards will clear the newly latched edge without it ever being
handled.

Is it possible to clear the interrupt status bit before calling
generic_handle_irq() to avoid missing edge interrupts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805123408.3767=
648-1-mikhail.kshevetskiy@iopsys.eu?part=3D18
