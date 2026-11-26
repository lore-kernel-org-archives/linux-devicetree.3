Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716081;
	b=y26i/+Xm7zhEAO21FYwJkiQMsUSMR6bPkCw9aV2ffHqBpqK1u4/0o/JtXbvxLXwr4LBK
	 cfgXgcG5Z5LaHOjtzbZTr7zcixs28m71VTbRtpFsRqPxPE8wWNOXwFaQFJVNmYibVBMdx
	 02QTj6GECXRO+/e2TEDlBZfVT/LK9jasPgfgNt87+v5+f5svFX3lcBb9LRIaHdlGmss3p
	 2GyE/E8l09bh84JqVyco79iy+kJvrkHf37bKitVe5PyWu/R9nvmPR74n469WEWKyz4yJh
	 keczXcEamAKLnfDhHwledUcLZ+tHv2F+WCx35kIgTKgoljmHjzkyiWZfEmwO/ovJoTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716081;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dDY36AvQgrOy9pXy1FMhtre9bjSpWej5ips53tUnj3w=;
	b=uzmAKY8/q2rEX/pw7PbvIUv6a7wCSttY3MGNCSDcjjxb2ypdkpXH7L/etD64f2b9lCRW
	 Kqo4QfmF5Ubpod3RubSwttilGnhLRsHxePnxHkldBIZvESFFPUt1gIesr+h/t+ee2Iqjc
	 ao3ZGF7n+yD9sIGCE8pbSiePD2TM4Z94yYQuLvN7w0idBedX095RWAvZXv9DVEdSSvkfh
	 DUqWC3JsEpQQ6lbK4uu8r1umG9P0vCQV4H3TEQVQaRFYsai7nESnH3CCKiVRUlIuGO7xI
	 WpyKrrd9qeRPNCV01ZN/kZ/MBEBSrESV3IJs5QpfneEDpz5aCOcWeg2CUaf6VnmGpyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PcG7ETBE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F5A606A31C;
	Thu, 26 Nov 2026 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PcG7ETBE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F841F000C6;
	Thu, 26 Nov 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795716081;
	bh=dDY36AvQgrOy9pXy1FMhtre9bjSpWej5ips53tUnj3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PcG7ETBEW1ed09GgyBBcXh3TXKSAcjhGDj9/pk54Vrp8BYsIgpRBhWq0v3lhBxV4o
	 Ph2GNVe1vXoT2fNQj1FrAps0DQ30wKT1GwZEvAPjYp9kaHJfdzBPCq9kLR+Q9rLJWM
	 76h6qbeNarG47pU2Ysrc4gDsoLPtYybjLK1HcMP3sMbu+lemjoxnLVTY+D97fjtYZW
	 ouuQ1oEK0rI2T3cHz9tS0ETSAFXCfAUBJgENDVCeHYtxgB/HkKuzYUmXXr3wCnZTy+
	 iifS2urWXWLboE0AP+QgqxaxMkIic+s6C6/jfNre45XzLGlrobgcrO1n8azuPhAf1/
	 xmXzuWWv6d0ew==
Date: Thu, 26 Nov 2026 18:01:16 +0000
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
Message-ID: <20261126-resale-roast-ec3dc50ca350@spud>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
 <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
 <20261126-sage-subscript-abb9ea294ca2@spud>
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
	protocol="application/pgp-signature"; boundary="BUT5UXC++Pyzk4aA"
Content-Disposition: inline
In-Reply-To: <20261126-sage-subscript-abb9ea294ca2@spud>

--BUT5UXC++Pyzk4aA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 06:00:05PM +0000, Conor Dooley wrote:
> On Thu, Nov 26, 2026 at 04:38:56PM +0000, Marouene Boubakri (OSS) wrote:
> > Hi Conor,
> >=20
> > Thanks for the review, and for the acks on patches 1 to 4.
> >=20
> >=20
> > NXP Confidential
> > On Mon, Nov 02, 2026 at 07:30:41PM +0000, Conor Dooley wrote:
> > > > +RISC-V OPENHW GROUP SoC SUPPORT
> > > > +M: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
> > > > +L: linux-riscv@lists.infradead.org
> > > > +S: Maintained
> > > > +F: Documentation/devicetree/bindings/riscv/openhwgroup.yaml
> > > > +F: arch/riscv/boot/dts/openhwgroup/
> > >
> > > There's no git tree here, are you expecting me to apply the patches f=
or
> > > your platform?
> >=20
> > Yes, if that is okay with you. I don't have a tree for this: the platfo=
rm
> > is small and I expect very few patches. I will review and test whatever
> > comes in for it. I can add your tree as T: in this entry, or list the
> > directory under RISC-V MISC SOC SUPPORT instead, whichever you prefer.
> > If the platform grows I am happy to set up a tree and send you pull
> > requests instead.
>=20
> Sure, I suppose I can. Keep this entry and add the dts dir to my misc
> entry.


I see you've already send v2. I can always deal with the MAINTAINERS
stuff on application if v2 is okay.

--BUT5UXC++Pyzk4aA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawhz7AAKCRB4tDGHoIJi
0j2nAPwN24QJf6FPNXePqWf8uvGIRVI7IPEguafbAKDUMydZNAD9HnELmLyHGIPY
T6+kO1CBNDDv0SdKpnErDxxP4dmFQg0=
=YifN
-----END PGP SIGNATURE-----

--BUT5UXC++Pyzk4aA--
