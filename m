Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072D2737F9
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102141; cv=none; b=Y44Qajb5ZzQRKoxrl0do4iYh6UCSq57ob/cPPVn5zO9xqW9s/leELPIpkWFjsuWJDtAUQui1J6QxjXKyYosNqMlt1mNJl7DJzXhGoGs0cwTx/BZQhdHBvM4ACW1wT9cB3ZSyRSOT78xUpX3k71ryCzrHvzq7Y6WXZBFjK3/K9Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102141; c=relaxed/simple;
	bh=Lt12Qg+pVRT6yKKgoiujWXyG06xK10IQAUgnUUDkOIo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pOerIClU/GypKJdu63xGUZxOILuqC+KiUFo6FeCuuodlOVDCt48F42rSR7Nt+mG8dU2ti2yTzWZr8jNAXLSiF6KoHMQpqCrkhsNnO6DSZl3XduisAiKzzDLrMbdl83g8aS7k6jizMF6cxa5A9FQ6hZL4tnbiI1b8jjy78GZEapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFRN9cdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFRN9cdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1C51F00893;
	Sat, 30 May 2026 00:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102140;
	bh=VUKS2YoTcjUC9pvGWTSkBcNPeWxJslRTBlqJ9geEAtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mFRN9cdIMS9KdBNGCHDTzKK4wnnu0p3xBFc/RQUR02XJwZDO135nD23KhatdL5rK2
	 LmYh1lXGGe3dXUS2ueRNpoWae8MnF7079ULU7Kz99V1hpuxkg3S1Y+Cn3mGPVB/6qw
	 ocHc98j/uSmyg126tXiGQW8JNRWYi0rXq6hLKJHhJNlL5t8JRg6UPERUarBEGKxFWf
	 GcyzAmsnR5nCqYBqL85m+8f3xvVmNhPKnKccpZu4vuzurul85/spYpHaQnOaUlPM4V
	 CILdnbSc2a0K7maPgxzLQSHj/IaEyR8K/VTb5zEjxKDr3ROsgIKs9e+uXiP4zpy6uK
	 Jexa0lkiiE3/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 1/5] net: dsa: microchip: Add fallback
 Micrel compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526-ks8995-to-ksz8-v3-1-c530f651989f@kernel.org>
References: <20260526-ks8995-to-ksz8-v3-1-c530f651989f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:00 +0000
Message-Id: <20260530004900.8C1C51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Making the KS8995 driver mutually exclusive with the KSZ SPI drive=
r temporarily breaks support for legacy `micrel,ks8995` hardware, causing a=
 bisection regression.
- [Medium] The Kconfig dependency `depends on !NET_DSA_MICROCHIP_KSZ_SPI` f=
ails to prevent both drivers from being built as modules, defeating the sta=
ted purpose of avoiding probe races.
--

commit ca8ff9ab891d7b4494af8f583c533c66ec764e52
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Add fallback Micrel compatibles

This commit adds fallback Micrel compatibles for KSZ SPI devices to allow t=
hem
to use the more capable KSZ driver. It also adds a Kconfig exclusion to avo=
id
probe races with the KS8995 driver.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index 4ab567c5bbafc..e704ab702c189 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -100,6 +100,7 @@ config NET_DSA_RZN1_A5PSW
>  config NET_DSA_KS8995
>  	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
>  	depends on SPI
> +	depends on !NET_DSA_MICROCHIP_KSZ_SPI

[Severity: Medium]
Does this dependency successfully prevent both drivers from being built as
modules?

Because NET_DSA_MICROCHIP_KSZ_SPI is a tristate config, configuring it as '=
m'
makes '!NET_DSA_MICROCHIP_KSZ_SPI' evaluate to 'm'. This satisfies the
dependency for NET_DSA_KS8995, allowing it to also be built as a module,
which could allow the probe races this patch intended to fix. To strictly
enforce mutual exclusion, would `depends on NET_DSA_MICROCHIP_KSZ_SPI =3D n`
be required?

I note this issue is later resolved by commit 19ced6cb5c2f1 ("net: dsa:
ks8995: Delete surplus driver") which completely removes the KS8995 driver.

[Severity: High]
Does making this driver mutually exclusive with the KSZ SPI driver
temporarily break support for legacy micrel,ks8995 hardware?

If CONFIG_NET_DSA_MICROCHIP_KSZ_SPI=3Dy, Kconfig forces CONFIG_NET_DSA_KS89=
95=3Dn.
However, at this commit, the KSZ SPI driver does not yet support the older
micrel,ks8995 switches. Could this break network functionality for those
devices during bisection?

I see support is restored later in the series by commit 2e706ae441971
("net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA"), which
ports KS8995 support to the new KSZ SPI driver.

>  	select NET_DSA_TAG_NONE
>  	help
>  	  This driver supports the Micrel KS8995 family of 10/100 Mbit ethernet

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-ks8995-to-=
ksz8-v3-0-c530f651989f@kernel.org?part=3D1
