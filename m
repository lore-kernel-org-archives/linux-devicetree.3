Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69A391E7E
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250050; cv=none; b=jrk19wF0iNDKsmsIJqHWAEQJdsTspcgQgRGL6X0B3xrb/IBHZ9cS1KsNoLHTeAvTbeg5CRUC6rpB0/nCQ9yY3TMDrHBdHNsddXMc3/qqRn6BQc5p/1Eza2kzlxejKVx1tjTH/J/WbEyd4wWmioggR67XbqY1IEP7HbHYjLtEZKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250050; c=relaxed/simple;
	bh=N/qcENuiSJDFcG1K7+U25wVX6SdLuI/Opej2DRzsH/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0k174okcFIfpGdLIC7EyW5a21Lf7FQaP/FBpQ5E2oK/mHHdhXI3WKrnhYpJJFswc+riPm6g6L2F3X9+lrWwr+JgZOAEqcG/XR+CeOITFrRUmPgGsHP3NQZYMk8KHq0q510IFYQGy9v5Rr5UXrXivWyjQlC6lOuwckJZJIb1WJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5WjCTHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5WjCTHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4B91F000E9;
	Thu, 20 Aug 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787250048;
	bh=Dt1ularuwh4GAmniGZXU1TkEHbWNs9aSSgtoCZdHQQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j5WjCTHj2OOop5JTee/9oCrF08yTx4iYKqVa+YvFXGrQXHk48pBpCcWRgD0mu+m1o
	 7pdvlVtRqV5MXA4tcnPyIGtFiF6j5aC+YhFsHVn6FM9cHPXyUbFy9WEHO++8C43b2p
	 r5RaLV+ZioRfh6qrAJ6qkbDYJpCuX9Zk3m+DQCytK+vLjV5XdLOjE2vn4Iaz9JwGZT
	 O+x3goDl04p9J//mxxriKH/CqBuSHet6eQ919vhK3a450/iyJ7EjCi1g1Czad31FHg
	 AI1W0P62B42o7PPmiEWMnqxLt5y8v6Q1wI6tK0uGhKaBC0m/x5YVl3Ll94v0Two6Pv
	 84AMNSso17REA==
Date: Thu, 20 Aug 2026 19:20:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Yaxing Guo <guoyaxing@bosc.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, yangyinglu@bosc.ac.cn,
	yangyinglu <yangyinglu@bosc.cn>
Subject: Re: [PATCH] dt-bindings: riscv: firmware: Add OpenSBI configuration
 binding
Message-ID: <20260820-mowing-marbling-ff0a0c82804c@spud>
References: <20260819090411.18561-1-guoyaxing@bosc.ac.cn>
 <20260819-extent-decrease-0483d66a87af@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NAPYhvb5+gg4INVm"
Content-Disposition: inline
In-Reply-To: <20260819-extent-decrease-0483d66a87af@spud>

--NAPYhvb5+gg4INVm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 06:03:12PM +0100, Conor Dooley wrote:
> On Wed, Aug 19, 2026 at 05:04:11PM +0800, Yaxing Guo wrote:
> > From: yangyinglu <yangyinglu@bosc.cn>
> >=20
> > Add a Devicetree binding for OpenSBI configuration data in the
> > chosen node, including the cold-boot-harts property.
> >=20
> > OpenSBI supports describing certain Generic Platform configurations in
> > the device tree passed by the previous boot stage. The OpenSBI source
> > tree documents the `opensbi,config` node and provides the corresponding
> > device tree parsing flow.
> >=20
> > The `/chosen/opensbi-config` node can be used to configure OpenSBI,
> > including the set of harts permitted to perform a cold boot through the
> > `cold-boot-harts` property. OpenSBI parses this node during the boot
> > phase and removes it from the device tree after cold boot.
> >=20
> > Add the Devicetree binding for this OpenSBI configuration node to
> > document the supported `compatible` and `cold-boot-harts` properties.
> >=20
> > Signed-off-by: yangyinglu <yangyinglu@bosc.cn>
> > ---
> >  .../bindings/firmware/opensbi,config.yaml     | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/opensbi,=
config.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/firmware/opensbi,config.=
yaml b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> > new file mode 100644
> > index 000000000000..86b1e1e673a8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/opensbi,config.yaml
> > @@ -0,0 +1,38 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/firmware/opensbi,config.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: OpenSBI Firmware Configuration
> > +
> > +maintainers:
>=20
> You probably should've waited for a response to your question about who
> should maintain it before sending, becuase I am not entirely sure this
> software configuration node should be documented or if the maintainers
> of opensbi would want it to be.

And to quote Anup:
| The opensbi configuration is all under "/chosen" DT node so I am
| not sure if we should have related bindings under Linux sources.
|=20
| Other projects (such as U-boot or Xen) who use "/chosen" DT node
| also don't have their bindings under Linux sources.

So this is a nack from me on that basis, sorry. Did you have some user
for this that could change my mind?

Thanks,
Conor.

>=20
> Cheers,
> Conor.
>=20
> > +
> > +description: |
> > +  OpenSBI configuration data passed in the chosen node.
> > +
> > +properties:
> > +  compatible:
> > +    const: opensbi,config
> > +
> > +  cold-boot-harts:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      List of hart CPU nodes selected as cold boot harts by OpenSBI.
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    / {
> > +        chosen {
> > +            opensbi-config {
> > +                compatible =3D "opensbi,config";
> > +                cold-boot-harts =3D <&cpu0>;
> > +            };
> > +        };
> > +    };
> > +...
> > --=20
> > 2.43.0
> >=20



--NAPYhvb5+gg4INVm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodFewAKCRB4tDGHoIJi
0rIDAP9KaJzdKUnGV/A5JJJ7EmTMo1fKndvtfhOidaamNZuoFwEA4QEPjPvvPMfi
Dxa3fwxFgwi+xB0QaJhJKcdI1T+pBAQ=
=2xDn
-----END PGP SIGNATURE-----

--NAPYhvb5+gg4INVm--
