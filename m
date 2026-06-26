Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE33F823D;
	Fri, 26 Jun 2026 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484607; cv=none; b=Rq9XZEF2UVEoUjyEWOmPRQ0LdyQo9nL6y/HMXYNfwBOkO5SyvSg2HenHDstXe/qppQKjHSV4z1QyYNAy6joCraah4g2S4Y4JFjl9s0eRE1eJAB3722yCJIzTBNbSKZ4HRymVbrnJiHbTGKPWfLKr5zrn9oDrUup9MyemkwI4AKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484607; c=relaxed/simple;
	bh=HiZtvL8ZJzCZLwQ6LC8iFHLtu0KZULtX2CYC9QpH4vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VF2yNgEl12OLWEWrndj5jTWvv4IdOe40YfnXWgThh17FPiaBy0TJ220nA9Wi4n6p6hq7iz+BPR3NrPZ/RCV4m64B/jBoNpUmB4sWI4TF1UUE0adt706iy9r0iKxXdYgZJ++2opGWzf3aUhiAl9d+1vmCfdzNTz+KwCTy+1iH2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ig9QYiqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ig9QYiqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBCC1F000E9;
	Fri, 26 Jun 2026 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782484606;
	bh=pRWXUr9PEsOOHoCTMIoYcLvGzO9hsV6w0BemUsTACKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ig9QYiqKEAA1m2n8rFfi/twGt5qWNi6m19j7wpVmTDsBJ/5RQcoM+FqyhGrMl5CPn
	 9b5fnFkkj4BGqnidDmdIZnd85aONWh3DOcv/u58o0m5urZEuKLHbCc3Ra1sv0b0nCy
	 XmXDxAKYztgKz5tMQQsCiI6rXWlsOmWs8wcXi3wC6h1qyInvD0j8JG+U19leyB67PG
	 Jbh6CQ/gxjlBrXkGqB4R+4e42KIzwlyYXx+Vs70sE2uGlYGjiIR9s9SYEKMiZgBnUs
	 aA3lLQFS18gcGZJ5FnqNVmyhsyxhooGbRl2n/axEmKk7AJlv5CIBLnnjneof5IRVjE
	 DiNHaw6MOP+/w==
Date: Fri, 26 Jun 2026 15:36:38 +0100
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
Message-ID: <20260626-chitchat-purity-33af51f88380@spud>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b24ma/P19nA0VTmv"
Content-Disposition: inline
In-Reply-To: <aj5m00m4KxRAPAnB@plin-1878>


--b24ma/P19nA0VTmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > platform-defined values are primarily used by M-mode firmware
> > > to configure World ID CSRs and restrict WID usage across
> > > privilege levels.
> > >=20
> > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > ---
> > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++=
++
> > >  2 files changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.ya=
ml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docu=
mentation/devicetree/bindings/riscv/cpus.yaml
> > > index 5feeb2203050..4b5778b6d3e7 100644
> > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > @@ -26,6 +26,7 @@ description: |
> > >  allOf:
> > >    - $ref: /schemas/cpu.yaml#
> > >    - $ref: extensions.yaml
> > > +  - $ref: worlds.yaml
> > >    - if:
> > >        not:
> > >          properties:
> > > @@ -120,11 +121,31 @@ properties:
> > >        thead systems where the vector register length is not identica=
l on all harts, or
> > >        the vlenb CSR is not available.
> > > =20
> > > +  riscv,pmwid:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > +    minimum: 0
> > > +    maximum: 63
> > > +
> > > +  riscv,pmwidlist:
> > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > +    description:
> > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this h=
art may use.
> >=20
> > I don't understand what the difference is between this property and the
> > one before it are.
> > Is this one meant to be used by m-mode software to then select one which
> > will appear in riscv,pmwid?
>=20
> pmwid (single value) is the reset default, while pmwidlist (bitmap)
> defines the allowed set. The root-of-trust M-mode software may select
> an allowed value from the pmwidlist and write it to the mwid CSR.

I don't understand the point of the property then. If it is the reset
default, just read it out of the register?
Unless I am missing something, it's useless to s-mode because it may
not be what m-mode chose and useless to m-mode that has access to
the csr.

Cheers,
Conor.

--b24ma/P19nA0VTmv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj6OcwAKCRB4tDGHoIJi
0uraAP0VIc7uu6TZluxJwX1wcbBhf0U6wqp0dpR0Zb8yYEKnugD+JqtwpUz5u7Rz
k3+2geeKvfzF9RbQeDPvaD4Hy+7XNA4=
=DJ5l
-----END PGP SIGNATURE-----

--b24ma/P19nA0VTmv--
