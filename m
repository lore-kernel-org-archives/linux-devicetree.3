Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7B133F5A2;
	Tue, 30 Jun 2026 18:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842783; cv=none; b=cogCGJLDgPo4jOrpATjgYbSN8XPGvwPKRc/ZW1XcPaVpI6bg7Lss3q9YNOBqhibQSjlchaYB/khZczC4G+9vDsyME51L+nZIx8pJHRcEZZMNCcGZXI6nlaYXwaQUAADUXZz6UlIjWjvQq4uU+b1RYsFq6r0FprQEUcbfSfwfJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842783; c=relaxed/simple;
	bh=Yo8dfrESJG9IfUmB4Rc04gnfCoCs+wJExzmq4IMq2aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7waP4pvnbse0lRwDP1siKOHu/9rqR19+bV27E+waIvFZCSKKtm1OPACrfpagO/6EvMx/h0vWDT2ezPDeINIbooz9R1hvQsa7VZfAcADXZD5+KAZ+tatI//efNzsgu5u9oTIGe+1Ui+SmzhU39JPmOKF76GqQduvXUbPlxNxoyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c56qQ5u2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c56qQ5u2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 695EC1F000E9;
	Tue, 30 Jun 2026 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782842781;
	bh=8PWHsCluT3OCbg2LsYgRbkNFc7KX9vIUaT27QTkHN28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c56qQ5u2XKTmOS92xWDJTHj+zlvdzxuTazJAxr9vVSpx1+UfX/wfyiuusBEZuKgQB
	 21q2bf00RQLBSsy6EvJ2D6bAEkEyMnhYr4TxKC3+tq6tAtx6fs30CV7X5+nlLKZCq3
	 eN0zsQjyVH6fNQrcNmnxuD1GhOXGe784FRka5zHpK1Q6Yb9AnY4ISM+oFHIzaA2wxJ
	 lLFWfR7aFgKmAFKRsnxyxyk8I9m7A+IktZa9koOnf54VDCNpwZusSg1glYmBlZMRfw
	 tqF/TjzanotTRnzYQnMw+Taazt+b7bHneX+WzucSKQCURNMsjSckkjAlqRJwDiVwwb
	 /kBLAzqtihLYw==
Date: Tue, 30 Jun 2026 19:06:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <20260630-frisk-excavate-7d562df75585@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
 <akOkXpPi46LBHuIA@plin-1878>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zUJhvglUFjMqS5hn"
Content-Disposition: inline
In-Reply-To: <akOkXpPi46LBHuIA@plin-1878>

--zUJhvglUFjMqS5hn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 07:11:26PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> > On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > > Hi Conor,
> > >=20
> > > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > > platform-defined values are primarily used by M-mode firmware
> > > > > to configure World ID CSRs and restrict WID usage across
> > > > > privilege levels.
> > > > >=20
> > > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > > ---
> > > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++=
++++++
> > > > >  2 files changed, 98 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/riscv/world=
s.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/=
Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > > @@ -26,6 +26,7 @@ description: |
> > > > >  allOf:
> > > > >    - $ref: /schemas/cpu.yaml#
> > > > >    - $ref: extensions.yaml
> > > > > +  - $ref: worlds.yaml
> > > > >    - if:
> > > > >        not:
> > > > >          properties:
> > > > > @@ -120,11 +121,31 @@ properties:
> > > > >        thead systems where the vector register length is not iden=
tical on all harts, or
> > > > >        the vlenb CSR is not available.
> > > > > =20
> > > > > +  riscv,pmwid:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    description:
> > > > > +      Platform-defined M-mode World ID (WID) assigned to this ha=
rt.
> > > > > +    minimum: 0
> > > > > +    maximum: 63
> > > > > +
> > > > > +  riscv,pmwidlist:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > > +    description:
> > > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that th=
is hart may use.
> > > >=20
> > > > I don't understand what the difference is between this property and=
 the
> > > > one before it are.
> > > > Is this one meant to be used by m-mode software to then select one =
which
> > > > will appear in riscv,pmwid?
> > >=20
> > > pmwid (single value) is the reset default, while pmwidlist (bitmap)
> > > defines the allowed set. The root-of-trust M-mode software may select
> > > an allowed value from the pmwidlist and write it to the mwid CSR.
> >=20
> > I don't understand the point of the property then. If it is the reset
> > default, just read it out of the register?
> > Unless I am missing something, it's useless to s-mode because it may
> > not be what m-mode chose and useless to m-mode that has access to
> > the csr.
>=20
> Smwid is optional. In the no-Smwid case:
> - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
>   registers, exposed to software via riscv,pmwid DT property)
> - S/U-mode's WID depends on opensbi-domain configuration [1]:
>   - If next-wid is specified: S/U use that WID (via mlwid CSR)
>   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
>     world)
>=20
> So riscv,pmwid serves two purpose:
> 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> 2. Fallback value for OpenSBI to write to mlwid when domain config is
>    absent.

So it is not the default at reset at all then. The reset default is
something else entirely and this is used to overwrite that.

> - M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
>   registers, exposed to software via riscv,pmwid DT property)

In this case, it seems like pmwidlist would just contain a single entry,
and there is no need for pwmid.

Quite frankly, it seems like you need to decouple these properties from
being 1:1 mappings to your extension's CSRs and both name and explain
how they are to be used by software.

For example, how is software to treat the value in riscv,pwmid when
Smwid is enabled? Must it be the same value? Is riscv,pwmidlist useless
in that scenario as a result and should not be populated? Should
riscv,pwmid not be used if Smwid is enabled?

There's a lot of extensions defined in this series, and there's no
clarity on how these properties behave depending on what's enabled in
the binding. There must be.

> - S/U-mode's WID depends on opensbi-domain configuration [1]:
>   - If next-wid is specified: S/U use that WID (via mlwid CSR)
>   - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
>     world)
>=20
> So riscv,pmwid serves two purpose:
> 1. Source of truth for M-mode's WID when mwid CSR doesn't exist
> 2. Fallback value for OpenSBI to write to mlwid when domain config is
>    absent.

Again same point applies here, why can a single-entry riscv,pmwidlist
not suffice here?
Additionally, if it cannot, you may need to introduce mutual exclusion
and the relevant extensions because it doesn't seem like in your current
design that the two properties are intended to co-exist.

Cheers,
Conor.

--zUJhvglUFjMqS5hn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakQFlgAKCRB4tDGHoIJi
0gHKAQCT6Z01KfRa6fx77AoqUbJKpU1uIcQnxC9IrjdfytysMgD9FZol0kRCb8w+
eyMlSSrWnw03mZZzgXqR+mWTkFfxYwo=
=BvLm
-----END PGP SIGNATURE-----

--zUJhvglUFjMqS5hn--
