Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A73FE667
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550243; cv=none; b=BOLxCeHtA3OGFT1gywasg9jLkHioGFPZnuHVXPF3RUBdA8wPX7PgyYPzs/X1EWygC55CCofbHfhl3R/Knv7WkswfwgxDqxKxKTn9GnmCPCaRHwulYTAYPymjipqNnpeveLQuwTtSc68t68hV/YLA3oBe+uP1iDtLpJP3Sm/+qD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550243; c=relaxed/simple;
	bh=5Ga03fly4O/2GfRmU1joRddhhrvudvewcFD+qFRO4aQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KKtxx7rkpu2+EFdgWXEe3qmURpXl3n1BCUq9219Hb6ZYQW88B4xbNdgN5s+NwnQ2iNXvsejJYLPzKH3lRVlEJcsNldG6Pxen+w2d7mjy0rG839Awt6sIWlaljlBhj+6qacAMXxT+VBEsniyB89hl+0EPBB10qxbZ/sfvqs7ZNTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMuMijH9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMuMijH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439381F000E9;
	Wed,  8 Jul 2026 22:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550242;
	bh=sNN7fLtmWGyZA/tCs6ftOwTMWPwZWsXSXdja2S+7VXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VMuMijH9MXmPvjaDNT6Ggbpq8Doe3dSZ4KAMcEWowbTJ/CBJkEhxlXtPW2PoVCvyj
	 4ZYuKhJFOgH5/EowgN3wVnL5t6ft+PX65Fscsht34Y//qAy2+ZKEw2yjgkvlG/PIDu
	 fDQb/8ZbYDtbGenNIUIjtVWuBNq9n18FOrgCZoNoBysk1STH3NL9C2eI5wwLm1jtFU
	 EC33sZ0nb3wtkTu8HjRgKr72Gkq/BoRaWDjyPtHbqSwK+LvSZ3vqGDOxFnStfEn9Qw
	 hyN0lA6REdbrAOXUZ+h4yM6u1UjHBUX6GjWYbqo+ujn68DHEilRC9bYq1p0tFRSXKu
	 X7Fa4kE6z2Ycg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ARM: ixp4xx: Relax endianness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-ixp4xx-little-endian-v1-2-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-2-e9622d0ba9e4@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:37:21 +0000
Message-Id: <20260708223722.439381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing `depends on CPU_BIG_ENDIAN` breaks the IXP4XX flash drive=
r on little-endian builds due to missing MTD CFI byte swapping logic.
--

--- Patch [2]: [PATCH 2/3] ARM: ixp4xx: Relax endianness ---
commit b77eacff0c25c139068c8fb9c88772bc9af87ae3
Author: Linus Walleij <linusw@kernel.org>

ARM: ixp4xx: Relax endianness

The IXP4xx can now boot in little endian mode so relax the endianness
requirements. This will make IXP4xx compile to little endian by default
like everyone else.

> diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
> index cb46802f5ce52..2bc8a497d3180 100644
> --- a/arch/arm/mach-ixp4xx/Kconfig
> +++ b/arch/arm/mach-ixp4xx/Kconfig
> @@ -2,7 +2,6 @@
>  menuconfig ARCH_IXP4XX
>  	bool "IXP4xx-based platforms"
>  	depends on ARCH_MULTI_V5
> -	depends on CPU_BIG_ENDIAN

[Severity: High]
Does removing this big-endian restriction break the IXP4XX flash driver on
little-endian builds?

The physmap-ixp4xx.c driver documents a hard requirement for the byte swap
option on LE systems:

drivers/mtd/maps/physmap-ixp4xx.c:flash_read16()
 * This means that on LE systems each 16 bit word must be swapped. Note that
 * this requires CONFIG_MTD_CFI_BE_BYTE_SWAP to be enabled to 'unswap' the =
CFI
 * data and other flash commands which are always in D7-D0.

However, the MTD_PHYSMAP_IXP4XX configuration conditionally selects the swap
only for big-endian builds:

drivers/mtd/maps/Kconfig:MTD_PHYSMAP_IXP4XX
	select MTD_CFI_BE_BYTE_SWAP if CPU_BIG_ENDIAN

Because of this conditional, LE builds fail to select the requisite byte sw=
ap.
Without the byte swap, the CFI backend defaults to host endian and the driv=
er
sends mangled commands to the flash, causing it to fail to probe.

>  	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
>  	select CPU_XSCALE
>  	select GPIO_IXP4XX

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ixp4xx-lit=
tle-endian-v1-0-e9622d0ba9e4@kernel.org?part=3D2
