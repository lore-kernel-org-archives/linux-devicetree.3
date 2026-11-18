Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022880;
	b=CotA/PFQYqWHMa5Ku1Coh2TNXJUkWRJW1dBAJGRjuN0SI8GhjwEmzYHIXAGYUmzNnmKs
	 XOmzkPYM22/47BT9FxWwDIXahlhylOn3q4xGb2TX5BxNnK3KrtYD6c20mxFNafWe9Ile3
	 m9dHTRkv5ZSKro3b0NU2fRqRHRCFHbTinivZ2u5c+EXHYd27CSOq9hvP85LggkM0X71Cw
	 HQd0oV0rr+FGBsJQR5EKkw7S8FBI3G4OvP8hMDq6H9nLQMHfiSEfJOwz9S2nUrx0eeukc
	 hFG8ZRaQZ93m4fjlZ5QJTU8UkUdDMsPATHUT/brxpOGK+aZrNSuE8zo2Z+4rP1+TUKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022880;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RnXonwrvoZVLtQsjLteHNbVkhm0Zy7su+D2bNWm+tfE=;
	b=mH3CxDN8LX26jtJ6OjH1MiGrZyQnRNxA81xVPGioqfOJ/bPXOKYwtkFkCdlyPIBUP00B
	 mpLfJo9ZBkcI5E7lax7RVGcsWfOOw4s9vQyaqC/9D5UFxiS3xgLQx6W2cPM7ipowTdAJW
	 yzRorE41PaGOrNpXyCRkG8Yko9CYVUfyJHmLP8prbsby8CJRb+pGh1lqk2xhggRPoPk55
	 KuaVrnmNrPyra0uGxFqNaXlAI5g6WnocJZvXaHIdJgRclH82G+FT8RzkcW6yQetu5CTo9
	 xc6FmM94j6ZGfkXusLSzcNKKf9+apWjOvy9Ov57XTMyWIoKghZzjUASuTR+9ZUR1zTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4KFUrn1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2D606CA67;
	Wed, 18 Nov 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4KFUrn1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE921F000C5;
	Wed, 18 Nov 2026 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795022880;
	bh=RnXonwrvoZVLtQsjLteHNbVkhm0Zy7su+D2bNWm+tfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V4KFUrn1plYU+7KFXMyDAEoxNpcEbAzsB/roEORSGeYRdUvMl+Oqw1AoPBWnYVCdd
	 ZD9/YntEdgMWb50ZwDj0o8lEwL4QAJyJVPDQ63lmtHvjEa4/xcxIXxR2h3+o+TaXj/
	 UHhCEfN0Jo/aFpwzWqgxVkBw43P07nBUpQ8Zi2+51xvASGKtFQJrkwxZG1liKhY3rG
	 59H2PLvPXh7MjUNeV5KIEHhDswzYgyvnDZMX8mK7yByzO0UAmwgtLceoE2MfDngQQt
	 d9JCobpXQLKFg4Pvw2FaXrfRjJayOqpdW4jHJ871g5Iudd8XZsopICEJm2cxaX/8C1
	 iDiRXol4Xd6Kw==
Date: Wed, 18 Nov 2026 17:27:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Cc: "alex@ghiti.fr" <alex@ghiti.fr>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>,
	"inochiama@outlook.com" <inochiama@outlook.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 7/8] MAINTAINERS: Add entry for MIPS RISC-V SoC support
Message-ID: <20261118-endorphin-coral-38e49336e204@spud>
References: <20261116-canary-pedometer-9df9d756da82@spud>
 <53de742f-60eb-48ec-a883-410431aac274@htecgroup.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7C2DnlLPik6/hGFg"
Content-Disposition: inline
In-Reply-To: <53de742f-60eb-48ec-a883-410431aac274@htecgroup.com>

--7C2DnlLPik6/hGFg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 02:23:39PM +0000, Aleksa Paunovic wrote:
> Hi Conor,
>=20
> On 11/16/26 18:40, Conor Dooley wrote:
> >> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >>
> >> Add a MAINTAINERS entry covering the MIPS RISC-V devicetree sources
> >> and the board binding.
> >>
> >> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> ---
> >>  MAINTAINERS | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index c2414447892c24d58595059ca27b18775919ac12..a00f1a801be3c532c33918=
e673c7977d9de91823 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -23542,6 +23542,13 @@ F:	drivers/spi/spi-mpfs.c
> >>  F:	drivers/usb/musb/mpfs.c
> >>  F:	include/soc/microchip/mpfs.h
> >> =20
> >> +RISC-V MIPS SoC SUPPORT
> >> +M:	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> >> +L:	linux-riscv@lists.infradead.org
> >> +S:	Supported
> >> +F:	Documentation/devicetree/bindings/riscv/mips.yaml
> >> +F:	arch/riscv/boot/dts/mips/
> > Right, so still no git tree here. How are we going to get this applied?=
 My comment on the last version was: | You're missing a MAINTAINERS entry f=
or the platform, since someone is | going to have to pick up the patches fo=
r the arch/riscv/boot/dts/gf and | that someone is neither Palmer nor Paul.=
 | See Documentation/process/maintainer-soc.rst for more info. | | I'd appl=
y patches as a very last resort, but even then you'd need an entry | to mak=
e sure that you're CCed on patches for the platform because I | don't care =
about the platform and would just apply things that look | correct if there=
 was no reviews provided. You have added the entry, which is great, but the=
 absence of a git tree implies you're not actually intending applying the p=
atches? Ideally you, someone that cares for this platform, would do that - =
and the lack of a tree implies that you're expecting someone else (me?) to =
do it. Cheers, Conor.

> I was planning on updating that later once we've decided which tree to us=
e. I'll fix that in v4.=A0

Cool, thanks!

--7C2DnlLPik6/hGFg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3gGgAKCRB4tDGHoIJi
0nS9AP9h2SSQCgR8joxKlMts6nqIrBad1TtQAnXdHy8fF9ocVAEAxGah61lFibco
nL74YqKKcXYtpC5oa+eb+s51kaFt0gc=
=dUOj
-----END PGP SIGNATURE-----

--7C2DnlLPik6/hGFg--
