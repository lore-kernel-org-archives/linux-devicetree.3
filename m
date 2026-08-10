Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15DC3CA4A8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371809; cv=none; b=ejBCq8fvUowYIEqmaa2FxJcIS8yileNMQPmYdA8iqyqUHBrj45qwyDaTB5wYmlLUg09HTF+RoWuy2muCPUDWimjjkEW740034da/mk97bas8Qyt6bDgehOU0kxSiVFIGJhnVIBAMDP55rlHFpo875hZbcNImkDhXKdJJNk321cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371809; c=relaxed/simple;
	bh=fgCtrhoTMm9eWVGmF0/1rwsqCtSmweRIrd8PdMBIVTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ClgQyH8/XVD0yPN4S5FCGyXrZc71z5OBFnFICFKSE0TiFnQnvzybAUXvchg8RPvoV1b1/lQ5gqngQK09UNbo9cfIqMBuczNZPmzaruyEhFp/3HRLdRpGErM9aVH4PEBP66RBpjAV/fj+wkphk+2OO0VLWDjoBnO5YoXrJODYyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSfkQwco; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSfkQwco"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903C41F000E9;
	Mon, 10 Aug 2026 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786371807;
	bh=kBkLld8wz7ZHRcY2zx0lSxSKTRYOOsZ/F0Y+9vyqZtQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gSfkQwco6QlQJf26Jc3/lp28su5Gb7qzvD7hzGcWg3KbPle6hc8+TRt1QOHPGDKiT
	 +0JMA2RDfI4cU1noztTJzwzGWJ9+eWVDr68RdgaP0nwON/GhCDHA8uNr3K/h3i9nFG
	 sdAK/MQHKj/AjEtXZQJ7o2Q5UkE2INzvJF8SK5GTps45ujWqWVXBWAF7c4W9HwK2hO
	 g5UkUNuwQKfhYWPHgtQB50mHTTSe2HCxDjL2jw/ZgJ4MvSdVL86Y4zRb73wYG9xXW+
	 b0HZ38+sG2uX01EhIyamtZ/7iLPQ36nONm5Kq78nY3bbqLyVVtqqosqMe0Pp7bZGnD
	 sELQ2LcSYTMTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] gpiolib: of: Only apply the SPI CS quirk to SPI
 peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maciej Andrzejewski ICEYE" <maciej.andrzejewski@m-works.net>
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, robh@kernel.org, conor+dt@kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, devicetree@vger.kernel.org, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260810141629.81650-2-maciej.andrzejewski@m-works.net>
References: <20260810141629.81650-1-maciej.andrzejewski@m-works.net>
 <20260810141629.81650-2-maciej.andrzejewski@m-works.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:23:25 +0000
Message-Id: <20260810142326.903C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Functional regression breaking SPI chip select polarity for minima=
l SPI peripherals, breaking git bisect.
--

--- Patch [1]: [PATCH 1/2] gpiolib: of: Only apply the SPI CS quirk to SPI =
peripherals ---
commit 119ec452c0cd58efb0a9c22023e3cbf0565c7c18
Author: Maciej Andrzejewski ICEYE <maciej.andrzejewski@m-works.net>

gpiolib: of: Only apply the SPI CS quirk to SPI peripherals

This commit restricts the legacy SPI chip-select polarity quirk to nodes
that actually represent SPI peripherals, identifying them by checking for
properties with an "spi-" prefix. It aims to prevent the quirk from
improperly applying to other subsystems like NAND controllers that also use
the "cs-gpios" property.

>     This is a convention rather than a guarantee: compatible and reg are =
the
>     only properties spi-controller.yaml makes mandatory for a peripheral,=
 so
>     a minimal one may carry no "spi-" property at all. The next patch cov=
ers
>     those by looking at the controller instead.

[Severity: High]
Does deferring the fix for minimal SPI peripherals to the next patch
introduce a functional regression at this specific commit?

Since every individual commit must be self-contained and fully functional to
preserve git bisect, should the logic covering the controller be combined
into this patch to avoid breaking boards with minimal SPI peripherals during
a bisection?

> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 940b566946ce3..bd9a623f2ae16 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
[ ... ]
> @@ -374,6 +393,11 @@ static void of_gpio_flags_quirks(const struct device=
_node *np,
>  			if (ret)
>  				continue;
>  			if (cs =3D=3D index) {
> +				bool active_high;
> +
> +				if (!of_gpio_child_is_spi_peripheral(child))
> +					break;

[Severity: High]
Will this break SPI chip select polarity for minimal SPI peripherals that
lack "spi-" prefixed properties?

If of_gpio_child_is_spi_peripheral() returns false for a node that only has
"compatible" and "reg", the early break skips the of_gpio_quirk_polarity()
fixup. Their chip selects would default to active-high, potentially leaving
the device permanently deselected and unusable.

> +
>  				/*
>  				 * SPI children have active low chip selects
>  				 * by default. This can be specified negatively

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810141629.8165=
0-1-maciej.andrzejewski@m-works.net?part=3D1
