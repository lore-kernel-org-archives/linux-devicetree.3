Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716011;
	b=xJerhqWLtjBBhwUrLYajk8iKFVsAfKBdoog+HIRk71sA6bCOkjjmS9RNuF/IsXG6SZqo
	 TWMIQzj4ThCV8B4FOidSpBd6e62kBIaKahc8Nt3gHYQJ4ghKFvmb4mun67e7C472nZOTO
	 6HZw4PKClqxoYnIxkx/L19aMZ4uKZr7DIVAj8D5phlJpvSf+SvMfxehw4skrZfki2h8y+
	 poAYNEEa/QB+frB36pYn1Yzs7teNq7pVxiEwPXuKwzPR4bXsttAvbNZ0ldNAbOhyxpOkZ
	 bn6aiUpG5694vwuBUtLBkLfsG9oUH4hsg3uySD9kt6xgAsXCAOOi7shqDhILvKhdq8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716011;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5mZYwwjR9BTTW24PV5T2QjIZNCAR6U+aLWboOrrOn58=;
	b=4pKbvSoXoh7YjtmbGiaq5AyQ1i7FtyFvGZMbxW9VaKkWvQdUXVCz4SaTf+uAMDD0uDFf
	 YTPGD9cdgqv2YSBgStLy4zVDDnGVpgfsD1F9my2XSWMy9CQ5VwD7oteua+b9nYp32FTtg
	 KtPd0ZlsJct8KndqePUadu+DbaZJTznDKOdufZSFjvhdrWZOgchtGmrdLkDL3wcjVepIv
	 vDFH4SVrgbrJ+h7El2pIdLZHFrHvwCwUH0nvNc3zToZ87DklAd9LoRrIMuWc8GxdlbIQv
	 x6eBrHdtcNHenwpL2useNBN8EdB+wWnKmKgU8WqsL9qr48yKze0WKdMre4+/33gzCIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jd4Irl6N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A66606A321;
	Thu, 26 Nov 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jd4Irl6N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14101F000C0;
	Thu, 26 Nov 2026 18:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795716010;
	bh=5mZYwwjR9BTTW24PV5T2QjIZNCAR6U+aLWboOrrOn58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jd4Irl6NjHTm5ga04mdXXy27iVW0/978dP+4cTYLUsR1KBehjRDgoKcICH7rScuDR
	 T72oUr6egLkU2Es7bhpgTbIrt9z6QDYe4g4WZTiqjuyfMRhFuTAHtjuUczSMZFRY/9
	 4QpbMmR8p9z/HF0GdAiqPuxiyUboeO1ktfS7LbFMee+ibJ4IRiKKu/yxnmqvbpS8i1
	 TAOdIyPAcB8+BOQlWvRAY1OWN9vO6na2y8geXARyP+XebXB8BgF++9cjFziRnqUdJZ
	 9UQv7QoHAMmsK4XipMC59VJGSrduRY7Hi8oFBlBfDieye9NovLRFzQavXfSQxexhgN
	 SNntZ0KQF4icw==
Date: Thu, 26 Nov 2026 18:00:05 +0000
From: Conor Dooley <conor@kernel.org>
To: "Marouene Boubakri (OSS)" <marouene.boubakri@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Message-ID: <20261126-sage-subscript-abb9ea294ca2@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
 <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="MpbRAbGZwGn7X0O5"
Content-Disposition: inline
In-Reply-To: <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>

--MpbRAbGZwGn7X0O5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 04:38:56PM +0000, Marouene Boubakri (OSS) wrote:
> Hi Conor,
>=20
> Thanks for the review, and for the acks on patches 1 to 4.
>=20
>=20
> NXP Confidential
> On Mon, Nov 02, 2026 at 07:30:41PM +0000, Conor Dooley wrote:
> > > +RISC-V OPENHW GROUP SoC SUPPORT
> > > +M: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> > > +L: linux-riscv@lists.infradead.org
> > > +S: Maintained
> > > +F: Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> > > +F: arch/riscv/boot/dts/openhwgroup/
> >
> > There's no git tree here, are you expecting me to apply the patches for
> > your platform?
>=20
> Yes, if that is okay with you. I don't have a tree for this: the platform
> is small and I expect very few patches. I will review and test whatever
> comes in for it. I can add your tree as T: in this entry, or list the
> directory under RISC-V MISC SOC SUPPORT instead, whichever you prefer.
> If the platform grows I am happy to set up a tree and send you pull
> requests instead.

Sure, I suppose I can. Keep this entry and add the dts dir to my misc
entry.

--MpbRAbGZwGn7X0O5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawhzoQAKCRB4tDGHoIJi
0s6kAP4gXmSFfhK0zfOCFBXSFG1/xn4r/TZJv18+DgrkOYf7LwEAqLrQ2A9IL3OG
SJ7Lomm/LvhzXbJ6vLkmKeV6VrShoAc=
=i6yE
-----END PGP SIGNATURE-----

--MpbRAbGZwGn7X0O5--
