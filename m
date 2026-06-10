Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E933C52F;
	Wed, 10 Jun 2026 16:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110365; cv=none; b=ojgnVjohUHBJRQbJNPLz+Dit7pVDUMTfaR4HHQMGH4u3cuMMy7xse+iJAt7/uzCkJ6HmH+ZNH9hMjUb1KKZ7lBP/zzxeWo2UYgoSq7a5OmYWmQ4qRDiAGDyYYy78skq7ZGMyCKMBBVB9o97ATvHWu+j8wvyEj6r+/f82L/panM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110365; c=relaxed/simple;
	bh=9sYkhPmhQrR5yfwiC9BcupwGyFlOcNFocEug02L4Ew4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDQPGcSHfQb/FyEeaSb/FayQL9vINI9qU65szhz90AwmZS1soB/JX1EUz833xEDpb7rigJefQKiRTuPQSSgSEQwZBqCvpthLmWBoqt00S4rYQsBIXQ1wwFqtdTDrSJler4mIV1qyug6NAzVtK80nn/gWO1rWn14BhKQlBc2/mIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndpOyF82; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndpOyF82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BB01F00899;
	Wed, 10 Jun 2026 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781110364;
	bh=addipIcASq3ojF947fNGWGLp5EDvGsVvNqYOwdn+Y1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndpOyF82eA+xOjW5IzWLC7LUa1XjR9E5RHRbpUi4QeAz9O9yQKJR6eZ+q0jkjX1lE
	 IznSN9OLG1/pRwRazbqe4Bl7Ijs8W0K43j910rTWKZgBL1uhyFQrMOEB2gN73WIad2
	 3k8/T6zIb7XlyOd5PtWBlCUmUzge6vtVqlIiZTwbR+lbFwSAB7RTDZ26DoI7avhmoo
	 tYAPB/6EXHvtA0EbGtdwb4BxLjVx9fAIdvi4EPcOh58fA6nCrp6eRKydkllHxsNHXn
	 l3BDB8IZ1kCrukPFQzymwQindpr6e2dlcHJUheURsKH6fxEJYh3zJRZMl5HH/Aa+Rs
	 sC89fzkV+VRzQ==
Date: Wed, 10 Jun 2026 17:52:37 +0100
From: Conor Dooley <conor@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu, apatel@ventanamicro.com, apopple@nvidia.com,
	atishp@rivosinc.com, baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com, conor+dt@kernel.org, debug@rivosinc.com,
	devicetree@vger.kernel.org, guodong@riscstar.com,
	hui.wang@canonical.com, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn, namcao@linutronix.de, nick.hu@sifive.com,
	palmer@dabbelt.com, pincheng.plct@isrc.iscas.ac.cn, pjw@kernel.org,
	qingwei.hu@bytedance.com, ritesh.list@gmail.com,
	rmclure@linux.ibm.com, robh@kernel.org, wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn, zong.li@sifive.com
Subject: Re: [External] Re: [PATCH v3 1/3] dt-bindings: riscv: clarify Svadu
 boot-time behavior
Message-ID: <20260610-prompter-fever-db3f6a200051@spud>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
 <20260609130021.99899-2-cuiyunhui@bytedance.com>
 <20260609-washboard-fantasize-ddf0a9752df8@spud>
 <CAEEQ3w=C_z8awtevLhceTgqLW79ONzKTm5MRJeoSTLB9q_CeiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jW3aBPRv62t26xHn"
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=C_z8awtevLhceTgqLW79ONzKTm5MRJeoSTLB9q_CeiQ@mail.gmail.com>


--jW3aBPRv62t26xHn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 10:03:01AM +0800, yunhui cui wrote:
> Hi Conor,
>=20
> On Wed, Jun 10, 2026 at 12:09=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Tue, Jun 09, 2026 at 09:00:18PM +0800, Yunhui Cui wrote:
> > > Clarify that systems which advertise only Svadu have hardware PTE A/D
> > > updating enabled at boot, while systems advertising both Svade and Sv=
adu
> > > must enable Svadu explicitly with SBI FWFT.
> > >
> > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 2b0a8a93bb214..b09888e9988de 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -294,10 +294,10 @@ properties:
> > >                 of the PTE A/D bits or page faults when they need upd=
ated.
> > >              2) Only Svade present in DT =3D> Supervisor must assume =
Svade to be
> > >                 always enabled.
> > > -            3) Only Svadu present in DT =3D> Supervisor must assume =
Svadu to be
> > > -               always enabled.
> > > +            3) Only Svadu present in DT =3D> Supervisor must assume =
Svadu is
> > > +               enabled at boot.
> >
> > Commit message is missing an explanation of why this behaviour change is
> > not problematic. Although, to be honest, I am not sure what the changed=
 text
> > actually means. If only Svadu is present, then the hardware doesn't sup=
port
> > Svade, and therefore Svadu would never be anything other than enabled so
> > changing the wording to specify "at boot" seems less clear?
>=20
> The "enabled at boot" wording came from Andrew's feedback on the previous
> version: "always" is a sensitive term here because ADUE is writable when
> Svadu is implemented, and ADUE=3D0 behaves as though Svade were implement=
ed.

Whether or not it is writeable, the current wording means that it is not
allowed to be changed. I think that's reasonable because there's nothing
else supported by the hardware so changing it makes no sense.

> Would this wording work?

--jW3aBPRv62t26xHn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaimWVAAKCRB4tDGHoIJi
0ovZAQDsdOevqi/mtgvfG2Qem6astQNxL/Naaik96bOqN+kdhwEAjqLaOVF0cYio
hODsSogD1Y2nfNF0rw7vz7r1zbKzPAU=
=gMgp
-----END PGP SIGNATURE-----

--jW3aBPRv62t26xHn--
