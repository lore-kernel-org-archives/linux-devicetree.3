Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0034DC53E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 23:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528286; cv=none; b=KZBPRxh7d7l5odzovF3EGqyf51kKUVyPrl79mAadq+F30Nw53ZfR+hmG2Rtsu1x3SmUuT51j8IE5nDSWzxXJCk9GmhFBG8a5b4Nysh5mdVetsOZDJsyN6FYX15OltDJJVyFRq8CPDe1AN9KG1OrwdGeELgjmz4+OA1IemBcNceI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528286; c=relaxed/simple;
	bh=c/AzcIm61lJp2C5GTcaJRSbnjcNn4qureBzJ7zLdNOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WQrh+hi/JpHdEQLaZJvoq2n4m9ZjZs702YWMm4uSkO/1RwAp5GVKgJdc5FkrT1hcifbSkRDcGHXxmv/Vi3buEyEDdX7+t02riPIGbOtUhiig848Abe3/70SU+17ZJ0q30iej0QO6UYfdyBe0pD1LrjbLM1NomuCZJtPpN2v+lJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjA/2+gV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjA/2+gV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C719F1F00893;
	Wed,  3 Jun 2026 23:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780528285;
	bh=Pk+C4GsnWjSvGwyI8fUrl9+Uv+KlzG5ZKH9XVxcs1Y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjA/2+gV/5BIJI7wGQ1J85PHZNP/1yydv3dQUtkaGTXCW9xVtO3p7mFwQQBS0xxno
	 LNSrF6gUQ8Js2XsxiAuxNZfjISefGRUbvLQ/HpLuPYdXauXhu7DMEOzqa7nLOVWzwK
	 1ZPhbj52XBBtQMkfHEGXI0L+71ba6lSqRS54CFvJwsJKHJznUiiHy9YzoHZMcCY3l/
	 w+Eppz5vN18JK4xYo18w/MDSCTO/fcLj8MVncx9g4fnlwV9uFFbdWWAddYxWbojpC1
	 CopJ34VuezIzl4dtL9PTBPQSl4cML5ACaa0x+pDq5wmXW66VSHSaPDy3jyD+y2Lnfx
	 0r42LDfcZ8sCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/5] net: dsa: ks8995: Delete surplus driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260603-ks8995-to-ksz8-v4-5-e15149ef21e7@kernel.org>
References: <20260603-ks8995-to-ksz8-v4-5-e15149ef21e7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 23:11:24 +0000
Message-Id: <20260603231124.C719F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] NET_DSA_KS8995 selects NET_DSA_MICROCHIP_KSZ_SPI without inheritin=
g its required dependencies.
- [High] The transitional Kconfig option lacks a prompt and is defined as a=
 `bool`, completely breaking the intended user migration.
--

commit b05792c06b27a646be1067e3e5c2643b8b180f96
Author: Linus Walleij <linusw@kernel.org>

net: dsa: ks8995: Delete surplus driver

This commit deletes the old ks8995 switch driver and replaces it with a
Kconfig stub. The stub is intended to transition users to the superseding
NET_DSA_MICROCHIP_KSZ_SPI driver automatically during config migration.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index e704ab702c189..6a704b6383ffd 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -98,13 +98,13 @@ config NET_DSA_RZN1_A5PSW
>  	  RZ/N1 SoC.
> =20
>  config NET_DSA_KS8995
> -	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
> -	depends on SPI
> -	depends on !NET_DSA_MICROCHIP_KSZ_SPI
> -	select NET_DSA_TAG_NONE
> +	bool

[Severity: High]
The commit message states this is a stub to automatically phase users
over to the new symbol when migrating their configs. However, without a
prompt string like bool "Transitional...", doesn't this become a hidden
symbol?

It looks like Kconfig will silently drop the old CONFIG_NET_DSA_KS8995
setting during make oldconfig rather than preserving the user's
selection, which would fail to migrate them to the new driver.

> +	select NET_DSA_MICROCHIP_KSZ_SPI

[Severity: High]
Will selecting NET_DSA_MICROCHIP_KSZ_SPI without inheriting its
dependencies cause unmet direct dependency warnings?

NET_DSA_MICROCHIP_KSZ_SPI depends on NET_DSA_MICROCHIP_KSZ_COMMON and
SPI, but these dependencies are not listed here. Could this lead to
build failures on configurations where the dependencies are not met?

>  	help
> -	  This driver supports the Micrel KS8995 family of 10/100 Mbit ethernet
> -	  switches, managed over SPI.
> +	  This is a transitional option for users who had NET_DSA_KS8995
> +	  enabled. It automatically enables the new NET_DSA_MICROCHIP_KSZ_SPI
> +	  driver which supersedes it. This option will be removed in a future
> +	  kernel release.
> =20
>  config NET_DSA_SMSC_LAN9303
>  	tristate

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-ks8995-to-=
ksz8-v4-0-e15149ef21e7@kernel.org?part=3D5
