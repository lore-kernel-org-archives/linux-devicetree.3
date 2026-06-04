Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F2A30AD0B
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780586508; cv=none; b=oG0eSWP0jjaD5NGQBcmD5UnyT+KooxVi0CzXmnf5NoVOYaiuV477vOIZ+sFj16Fg4ve/g830GDbN6Te71yoyheV+eA6Dz5AMZTx3H+8XTcE9EC6+Nt2k7pb6uEu/LOQHDjOTx2mo8MWuhEqE9m+kiHhZqj3lc+Sm7nYJVS8kUT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780586508; c=relaxed/simple;
	bh=LF4SGuvFKWtTB11BIi7aZctxitpTJayuyXbzTcBDOa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNhv1NEu5/JmJb63eMT/fBDAkueezN5+d4gopMhoPL9ZZdNQEMfZO9Wk6HelZ9ugTr++LDNdD+NxjJl44sI3+UHG2WbF6pGrRdLMVNGa+Y676Ygrg/qjZDDlhIghTidvgKzor/LmIjPE0onHcecexD9VwnB8WkGl4HdiuOZx8I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSwUD/vx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSwUD/vx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653ED1F00893;
	Thu,  4 Jun 2026 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780586506;
	bh=rNXu5vlyUp20j0lkuwA02imfoYsYySZFap+UN2578YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jSwUD/vx03k97gkxf73hmsULtntt+AB0U9F5ztPshiUgpci4SY0Snt1TbQZNDucJz
	 tAGxb107U8gMULWBHrHa/P6ABa72f9wmw1pj2uebDEQ+P/TVZYko6nNj6wJ5xfaGGq
	 L+h9cm/Nz51ZlDhUy8e1Tb1pbNig9ZZnqZeAYaOcUvoNdzY402vbfDXcBWoNXU8APq
	 XLo0iDppmAljwjf/Rni+LxGl2IEc5PAF3aYtGSiH1esZLocOfJuFZffgP3IM3OUE8d
	 hOK7OM2Wj6x+Yt5fadUORbAXiA8AY2oVMRdWDZqLa0AIC2gVdkf9KqGZHWQxyGYk+k
	 FznWG8ZGWYJ8g==
Date: Thu, 4 Jun 2026 16:21:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: timer: Add RISC-V ACLINT bindings
Message-ID: <20260604-phonics-venue-48a4f241aed0@spud>
References: <20260603074222.593243-1-joel@jms.id.au>
 <20260603074222.593243-5-joel@jms.id.au>
 <20260603-tadpole-slept-8b6eeae9cd47@spud>
 <CACPK8Xf=Ec16jR+J399Pqi=O=2GgFjkZOPFo0AKaAA+58R6-gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8AdWtpYdmztO+Y3B"
Content-Disposition: inline
In-Reply-To: <CACPK8Xf=Ec16jR+J399Pqi=O=2GgFjkZOPFo0AKaAA+58R6-gQ@mail.gmail.com>


--8AdWtpYdmztO+Y3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 12:09:06AM +0930, Joel Stanley wrote:
> On Wed, 3 Jun 2026 at 18:53, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Wed, Jun 03, 2026 at 05:12:16PM +0930, Joel Stanley wrote:
> > > Document the bindings for the RISC-V ACLINT.
> > >
> > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  MAINTAINERS                                   |  1 +
> > >  .../bindings/timer/riscv,aclint-mtimer.yaml   | 52 +++++++++++++++++=
++
> > >  2 files changed, 53 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,acl=
int-mtimer.yaml
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 2fb1c75afd16..43dd9873bbc5 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -23005,6 +23005,7 @@ M:    Joel Stanley <jms@oss.tenstorrent.com>
> > >  L:   linux-riscv@lists.infradead.org
> > >  S:   Maintained
> > >  T:   git https://github.com/tenstorrent/linux.git
> > > +F:   Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > >  F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-pr=
cm-rcpu.yaml
> > >  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> > >  F:   arch/riscv/boot/dts/tenstorrent/
> > > diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mti=
mer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > > new file mode 100644
> > > index 000000000000..192ff3fcf79f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> > > @@ -0,0 +1,52 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RISC-V Advanced Core Local Interruptor (ACLINT)
> > > +
> > > +maintainers:
> > > +  - Joel Stanley <jms@oss.tenstorrent.com>
> > > +
> > > +description:
> > > +  This RISC-V ACLINT specification defines a set of memory mapped de=
vices which
> > > +  provide inter-processor interrupts (IPI) and timer functionalities=
 for each
> > > +  HART on a multi-HART RISC-V platform. The specification can be fou=
nd at
> > > +  https://github.com/riscvarchive/riscv-aclint/
> >
> > This is a draft specification, so having a "riscv,aclint-mtimer"
> > compatible is not appropriate. Ordinarily I would say that you should be
> > able to do this once frozen, but this spec is archived and unlikely to
> > have that happen.
>=20
> I've reworked the binding to reference the privileged spec, which is
> ratified and has a section on the timer registers:
>=20
>  https://docs.riscv.org/reference/isa/priv/machine.html#3-1-2-1-machine-t=
imer-mtime-and-mtimecmp-registers
>=20
> I'll post a v2 now for review.

To be clear, the problem isn't referencing the draft spec (that is what
you implemented after all). It's the "riscv,aclint-mtimer" compatible
that's the problem.

Cheers,
Conor.

--8AdWtpYdmztO+Y3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiGX7QAKCRB4tDGHoIJi
0vTRAQDzvkqDvDBgmW8zVUGKP1vRoOqB+GdXBl9ycZaE4Cw41AD/fN2KfKHUuPj5
yozlcb1Ufz4WJdqX8+Sckw6bhX1MegM=
=N2dA
-----END PGP SIGNATURE-----

--8AdWtpYdmztO+Y3B--
