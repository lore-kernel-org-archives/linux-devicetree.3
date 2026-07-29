Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6166E470E81
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322800; cv=none; b=CABWQPASZH38xKjWB1dBMHP2GLFykF8MMpWgPQvwuzD/i2DJkqR4k/1k8zj3H9KdCn47kc7aK9MahnsFQXQTjIGAarhogY0zDuWHvtPQdN1f59Rr+gzKVtEImmm0i0tS15fouDuejv7NClSBFHdoqjpmxZ5jWQJn+Dx3x79uzgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322800; c=relaxed/simple;
	bh=Ouaz2/TnvIqbv3NWWfQfEa1Mvd5m4peXPDD90DFHN0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTCC70ACwJk1qPenSzlRPrBbKqVqf4QPm9e30Fkya8s7mvNsF4GlIFv6WGRIs5Qrvrt3QkjStH+YmgHyxryD0Bqcwwxwqbv620APum9oq0IQ4kkQ8ujj27jdHkDSdagSO/LmcdHRpIzNXRXj0g0lmUx5nzSZJsxRuHKMu8UNAkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UX96AhQp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UX96AhQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6D01F00A3A;
	Wed, 29 Jul 2026 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785322799;
	bh=TtH0mcQHRaS2iBKANm0LIeTcnxStbEZe2wl12nOsYkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UX96AhQpN+Ogg3Gbn+pq/owEsWAYyUI9hcJVqyfP6FIVvbm4L4KWpDANNtnqA128f
	 ysfDcGaAoyub7QKcYkEliuOt8etDoI8uDqYajzwUzFkJ/Pn6jIxALnqbuzFMfqJRc9
	 HV7rFWIYBU6n9sXUV0T8hTSFUPAVrK7nhmsIHD7WX8ftht7L1/OT481b8cDsrnUSEP
	 +SFUVP5P9x8XwWuGFV+F0wqEMso2A6FE4cdPmTcwPklrhOh5mfuaXq8w4od0xWhmoh
	 qOsRphbwKcHM9L0j1ck55pvmfkgRmiT521aP5/OT4dkn3/nvfAL1TmBwiyZty3XBf0
	 C1ZMYHRZquaeQ==
Date: Wed, 29 Jul 2026 11:59:54 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: devicetree@vger.kernel.org, Ilya Sorochan <k0tran@altlinux.org>,
	Conor Dooley <mail@conchuod.ie>,
	Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
Message-ID: <20260729-electable-remake-1b8c94a452b7@spud>
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9GTnjuYoP5tpTkIh"
Content-Disposition: inline
In-Reply-To: <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>

--9GTnjuYoP5tpTkIh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 02:39:50AM -0700, E Shattow wrote:
>=20
>=20
> On 7/28/26 11:02, Conor Dooley wrote:
> > From: Conor Dooley <mail@conchuod.ie>
> >=20
> > On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
> >> Add bootph-pre-ram to mmc1_pins clk-pins.
> >>
> >> U-Boot pruned their overrides recently in favor of Linux which broke b=
ooting
> >> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
> >> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-co=
mmon overrides")
> >>
> >> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@=
canonical.com/
> >>
> >> [...]
> >=20
> > Right, I am going to try this again. I don't think there's actually a
> > valid technical argument against it, since it just affects the stage at
> > which configuration is applied rather than configuration itself.
> > If the configuration is wrong, and more devices don't use this configur=
ation
> > than do, people need to move the node to where they think should be. Th=
at
> > shall be done separately.
> >=20
> > I don't want to hear about the politics about whether or not Starfive w=
ant
> > to support it or reverse engineering of binaries etc. All that I care a=
bout
> > is discussion of the hardware itself and which boards need this and whi=
ch do
> > not.
> >=20
> > Applied to riscv-dt-fixes, thanks!
> >=20
> > [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-=
card.
> >       https://git.kernel.org/conor/c/42c57c049054
> >=20
> > Thanks,
> > Conor.
>=20
> Second NAK to this being applied, again, do not apply as-is.
>=20
> As you're not interested in the technical discussion, then you won't
> have one.

I am interested in technical discussion of the hardware configuration. I'm
not interested in reverse engineering of binaries, GPL compliance or
whether Starfive want this to work or not because I don't see how they
relate to the correctness of the hardware description.

--9GTnjuYoP5tpTkIh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamndKgAKCRB4tDGHoIJi
0pEHAP4tUFMDOdPAWOVTlsM9wcVDVX5X43Awp2ZDSTlBZ8I/IgEA+x9hTRMtWp3p
DaIrpFWoBW0ZyIlpyGLKrnA4otQPHwI=
=gumS
-----END PGP SIGNATURE-----

--9GTnjuYoP5tpTkIh--
