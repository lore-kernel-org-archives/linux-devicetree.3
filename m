Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C53E51D3
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779723773; cv=none; b=jI14Pw1GCiqxkNqEjQeysfiVaUqIDcb7PdrN/yD59RRVi8F10S6TuBJoyqYLYxtxLnOghaCkdVIHMdmSuQHX2INsO4icYUa9aRMr1Ds7VhbnWmN/Be5EHRdfVE7fWLqxd/uPs6C7xKbi6uxRFfa8+XtqqO8yV3QQiFbGE1M2zD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779723773; c=relaxed/simple;
	bh=f3J2rzcZyRu/qX6Yse1MzbUe0xt0sxF9ZDhDiEwzK4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oo1uLSkllP/VbuNBQsNu8rOj9KcJRYwj0F5KB0b/S9N+QQ9HijWL8R6Ko9QH3HR5c/EbnOtoi5IGnTXefqLAoqmraTI8cr0AlvvDW2EwA+bZ6/QapdhfHQbJ14T3jvBPbUGESd3kE+ZCoBQgsolzf++VbCYO8mIufDbNbKoJZKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNi0H8sW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNi0H8sW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E151F000E9;
	Mon, 25 May 2026 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779723771;
	bh=AlXnpMBcnhUL6cv8Y+XMRtFjiQixBjk2LR7IgqYhGIs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNi0H8sWTFwQpznBJbP0WAPRfEqjIkdUPGFpLosNr4BoJY7HsuyLEL1wDl/j70KwX
	 OSEMkXqCmq6KtlaFXAI5LlwPGR25NTsfu97ioXmcRaBYtdEu6pigrBjJEBMesh/u8l
	 8u2oHmITYp6w3Kv/rAIyNCVXMy+nSilabklnuplUgaPMrZRtHa+ah8hWLp6NlXwjcW
	 dqXq+akyn8f4J6hv0Bqnc7FIDEGrqo/xRbH8SRouGwm8/a4meP07ZdHZyZFxHY7pWZ
	 4xOtRRxmfGHIbp35eaA/f361O+0E+qfJamenoeDnqM27pkfYVcryDVn8IjRXXLCHjN
	 4oeuPJZNJgIPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown
 line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260525144629.498630-4-jerrysteve1101@gmail.com>
References: <20260525144629.498630-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 15:42:50 +0000
Message-Id: <20260525154251.A0E151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incomplete backward compatibility quirk for IS31FL319X shutdown =
GPIO polarity, risking breakage for out-of-tree platforms.
- [Low] Use of non-ASCII characters (non-breaking hyphens) in source code c=
omments.
--

commit 8f0eb876e212314197458aa41b5be24457af3ea3
Author: Jun Yan <jerrysteve1101@gmail.com>

gpiolib: of: add quirk for IS31FL319X shutdown line

This commit adds a fixup to force the consumer active low for legacy
device trees that incorrectly configure the SDB pin as active-high.

> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2c923d17541f2..f60291dcc90f7 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
[ ... ]
> @@ -194,6 +194,16 @@ static void of_gpio_try_fixup_polarity(const struct =
device_node *np,
>  		{ "himax,hx8357",	"gpios-reset",	false },
>  		{ "himax,hx8369",	"gpios-reset",	false },
>  #endif
> +#if IS_ENABLED(CONFIG_LEDS_IS31FL319X)
> +		/*
> +		 * According to the IS31FL319x datasheet, the SDB pin is active=E2=80=
=91low.
> +		 * However, existing device tree incorrectly configure it
> +		 * as active=E2=80=91high.

[Severity: Low]
This isn't a bug, but are there non-ASCII non-breaking hyphens (U+2011) used
here instead of standard ASCII hyphens?

Using standard ASCII hyphens (U+002D) for "active-low" and "active-high"
helps ensure the terms can be found using standard text search tools like
git grep.

> +		 */
> +		{ "issi,is31fl3199",	"shutdown-gpios",	false },
> +		{ "si-en,sn3190",	"shutdown-gpios",	false },
> +		{ "si-en,sn3193",	"shutdown-gpios",	false },

[Severity: Medium]
Will this omission break out-of-tree platforms using legacy device trees wi=
th
the other compatible strings for this driver?

The driver supports several other compatible strings (such as "issi,is31fl3=
190",
"issi,is31fl3196", "si-en,sn3196") which are not listed here.

If a legacy device tree uses one of the omitted compatibles, this quirk wil=
l be
bypassed. Because the updated driver now requests the GPIO with GPIOD_OUT_L=
OW,
a legacy device tree specifying GPIO_ACTIVE_HIGH would map to a physical LOW
signal, which would permanently hold the chip in shutdown.

Could we list all the compatible strings for this hardware family to ensure
ABI compatibility isn't broken for other legacy users?

> +#endif
>  #if IS_ENABLED(CONFIG_MTD_NAND_JZ4780)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525144629.4986=
30-1-jerrysteve1101@gmail.com?part=3D3
