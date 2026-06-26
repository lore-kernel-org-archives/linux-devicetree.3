Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE31401A13
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782495324; cv=none; b=nqB8pZ0waye3P2D8gfZ4h6d3/OV6dvPN1bClyBcCYA/8FMkF4ILJx2wEQEWlsZa3mNG4DfllRJApXEyEq0ttUET/wzTDcvWJJVuDSMPd3jFcLt4hS9wgHdWMTHz1nFA64KdZhniMC+0g+Nozj9uQMLQUHPrMWz6RQkpFGlRuZ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782495324; c=relaxed/simple;
	bh=ncKGowA1o91AP8N3WSUWsFtz5UuPjDrnlhLorXPSuHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LGGQUTrpHdYx57DBl2pXS+aFQuWEBAkg4XL8kjZJZXfeRyD8p8I8VpN/kT7T2whvgdixN6GU8uPpFgM0ctnqCivrMhasRaIv6kA44yDF/363ocSGaseKZXnzvCyrc7EhSCLO4vW0PaBBOI8lYcMZ99unB7j7vCHvFD0bckUQbb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXpFDMFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXpFDMFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D83A1F000E9;
	Fri, 26 Jun 2026 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782495321;
	bh=bR1HWUdlvc4vxc+2cDF+fB2PizAK3hK3RGDw5+vc4ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PXpFDMFB5FTHyWaBhmAcvwR+SLWpW8NZ2wzaxUXPMpenTlhDseUEX6tOs6/MUDZhG
	 grtw5LvU94UbW0auesii48vyVadvyTuTWu1OqXF6Et/w8e6+orzWxJnrXfl+Sfybxk
	 TJgOAArUvyJ4FFatLFAMTU6n0ek5qfurKjR6ipjpduCA+8jNrTGA6e9ROK6XPrNvzG
	 ZQEPyivT0NzOb9FjuOFOHw89YXuoUMUM5ZlHxjRqBph0qIqcqewpcTfoXSHg1aNB35
	 eXD8140gUqueDUshMhqYOGsvJR/Z86mppQFoPl6lGnJp+0ULRJDvHKBOSOA0ipvQDT
	 95pBvj/nbBMeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] of/address: Drop ISA parts when !CONFIG_ISA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626171906.476688-1-daniel@thingy.jp>
References: <20260626171906.476688-1-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 17:35:21 +0000
Message-Id: <20260626173521.8D83A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Wrapping the 'isa' OF bus translator in `#ifdef CONFIG_ISA` breaks=
 I/O address translation for LPC/ISA bridges on architectures that do not e=
nable `CONFIG_ISA`.
--

commit 2b56de0432a2e0bc839872a80da8947f0a3d2b72
Author: Daniel Palmer <daniel@thingy.jp>

of/address: Drop ISA parts when !CONFIG_ISA

This commit wraps the ISA-specific address translation code in of/address.c
with #ifdef CONFIG_ISA. This is intended to reduce code and data size on
configurations that do not enable CONFIG_ISA.

> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index cf4aab11e9b1f..9b2f0d462fb59 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c

[ ... ]

> @@ -349,6 +351,7 @@ static const struct of_bus of_busses[] =3D {
>  		.get_flags =3D of_bus_pci_get_flags,
>  	},
>  #endif /* CONFIG_PCI */
> +#ifdef CONFIG_ISA
>  	/* ISA */
>  	{
>  		.name =3D "isa",
>  		.addresses =3D "reg",
>  		.match =3D of_bus_isa_match,
>  		.count_cells =3D of_bus_isa_count_cells,
>  		.map =3D of_bus_isa_map,
>  		.translate =3D of_bus_default_flags_translate,
>  		.flag_cells =3D 1,
>  		.get_flags =3D of_bus_isa_get_flags,
>  	},
> +#endif /* CONFIG_ISA */

[Severity: High]
Will this break I/O address translation for LPC/ISA bridges on architectures
that do not enable CONFIG_ISA?

While the architecture itself might not have CONFIG_ISA enabled (such as
ARM64, PowerPC, or MIPS), they often still use LPC bridges in their device
trees for devices like RTC, UART, or IPMI nodes.=20

If this "isa" translator is completely disabled, the bus mapping will fall
back to the "default" translator. The default translator will incorrectly
parse these resources as IORESOURCE_MEM instead of IORESOURCE_IO.

Could this prevent drivers relying on I/O space access from probing or
mapping resources correctly on those platforms?

>  	/* Default with flags cell */
>  	{
>  		.name =3D "default-flags",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626171906.4766=
88-1-daniel@thingy.jp?part=3D1
