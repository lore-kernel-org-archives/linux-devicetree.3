Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BF037C103
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782495191; cv=none; b=o0OuLIrJMYLcH4mUZbgE7cirHaWO3RBM4hY5pIfhBwrH8ffRqoUv3JPmor1tQr/FWrUUAI32CZzshCNYM6Myee7LGvzvvHfcgDpmUohtkXbE25TEJ55CxlkGrUSx1yJy08Cz1+zo0G9J3BBZcKJkx13U2qucm7idPeAplGQZcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782495191; c=relaxed/simple;
	bh=66mtlsD1WjauGQdDYWNMYgkJIMDYTbWNIqGNXk14SJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Egw2LeKllFKpPkVfsyChXIp/YVP/zF76fgqGsGPH6qSue+2QkhtCcgGhbIBM6C6EqhVq1xzLnaF3usNId1Ib0l/9vi9BDuRYPLI0+VujoKGFJNy4rb2sDl22PUJETLQCwwtNOBl5E1D3uoSKq0qcS7FVP3U/OzuXhyqlGtXLYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbmBoGdp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbmBoGdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B2B1F000E9;
	Fri, 26 Jun 2026 17:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782495189;
	bh=Iz40Cdq3ibfKyuVnLqQxQw8mJfTXrkDa3v3Yl0gys1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kbmBoGdpnonaUQg9eMMi0z4wZBG6FEAo4tbxB3g646H/QHuaqWZFcSOqoHB0yhTlu
	 1HXyjE0wKI6PYfaPFhoWRET1u3iZr6lUrgAyhrd23oIWw1qp3RtLa424dIvQ4pWWw0
	 4ybX8uaaiKgM0UZYTZySAtXKmHgdgFV5AaeUZ1BtsnBQ35Q2dg4Q3/Lh8DwzmaOGNF
	 mM/tRDAle5TrAXnZE+LxrrLV6YnQyInAyIl1FB6fVbsZhq60RBD1/gzPYVSsFPwsmZ
	 D+Rc6pF+LIZlgdO2lUPTrYpXNp5kgm2TUDP1dkmY9W80Sm0PPrWp1v1GIeoZHqw0it
	 rXbtYgTlwiypA==
From: sashiko-bot@kernel.org
Subject: Re: (no subject)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260626171747.202269-1-daniel@thingy.jp>
References: <20260626171747.202269-1-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 17:33:08 +0000
Message-Id: <20260626173309.74B2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Conditionally compiling the OF 'isa' bus translator based on `CONF=
IG_ISA` breaks device tree address translation for non-ISA architectures (e=
.g., ARM64) that use 'isa' nodes for LPC or legacy I/O bridges.
--

commit 3f535ae9ca6c863a12c1d6dbcfcb4358a6f6ed4b
Author: Daniel Palmer <daniel@thingy.jp>

of/address: Drop ISA parts when !CONFIG_ISA

This patch conditionally compiles the ISA parts of the Open Firmware address
translator based on CONFIG_ISA to reduce code size.

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
> @@ -360,6 +363,7 @@ static const struct of_bus of_busses[] =3D {
>  		.flag_cells =3D 1,
>  		.get_flags =3D of_bus_isa_get_flags,
>  	},
> +#endif /* CONFIG_ISA */

[Severity: High]
Does this break device tree address translation for non-ISA architectures (=
like
ARM64) that use 'isa' nodes for LPC or legacy I/O bridges?

Platforms like Hisilicon hip06/hip07 don't have CONFIG_ISA defined but still
use 'isa' nodes. If this bus entry is compiled out, they will fall back to =
the
'default' OF bus translator.

The 'default' bus translator's get_flags method (of_bus_default_get_flags)
unconditionally returns IORESOURCE_MEM. This causes __of_address_to_resourc=
e()
to misclassify the I/O port and call of_translate_address() instead of
of_translate_ioport().

Because Hisilicon LPC registers an indirect I/O host, of_translate_address()
then fails with OF_BAD_ADDR (-EINVAL), causing probe failures for devices l=
ike
UART and IPMI.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626171747.2022=
69-1-daniel@thingy.jp?part=3D1
