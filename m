Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572A25CC74;
	Wed,  3 Jun 2026 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499377; cv=none; b=QDR50KsGEp4RuRJZSAmgzV/rYi0mdo33MAXu1+h1y18VLuV90Qc7j/dNzP1miA987h69zu0Yc6sM9uuy8nnNMNIKhVj4RBw/qWkmSOkhXn7fF4w9BblVBgQ7/7rO8JxTTlDIgjXS5CkDQDvd831Ht+N0PKWyt5euAWvkvVQk+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499377; c=relaxed/simple;
	bh=fP5/q6FGStxLVejhL82vbA7fou/C/MIUuONEKGdt5QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1eOWlOxDlxOij74xVsdPivPt2b5qPTgaWbubPf7aJ7/4YU37xhKVBC43sNJoH7luHWwJ58CfTtBb5MAb6Mc3HC+1GuQvGDu5axMPw/taz81GRgbYJ91ZYaeW9MZTRrIs0yoGcJY9A7/kjufAg7LmvZ7Bs1yp+SIYtzn4bnq8RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqnfBTtB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqnfBTtB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1791F00893;
	Wed,  3 Jun 2026 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499376;
	bh=ARuOFQjVr8e+L4jfVqSgMIfl93+q6E7LoYqJOO8jb90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dqnfBTtByIMI26ZoUrTeGnpDoxYzPftEQq1mU9bLsrnWR5ApVZE1F8lsS6hjFnTNA
	 9u2nmzGODFKqXkwum2zCoYz09A8KJmfcLLNXh70vN3wNPrNV8FTikTiepZb5AoltQC
	 EPqZWMjO/EyDhXUBah97UVZY1/z4C7U2o1n0qsLaTRLknfYVvEyVCMcl3hgDZChtzb
	 4DtgUXaE4tdRR89ZQFbRSRpA67ZN3nEzHea7TAsdDRa1qdS9PjkZzn0ro0T1BiJkoo
	 1sND5xvZ0/+CSZcDoo34q4sJ2Z7/ux8nKAs2bOdxb5pVTMrdDkt83SInAX5HjPn/ZJ
	 9wfCO67nvvkJg==
Date: Wed, 3 Jun 2026 16:09:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 phy-next 13/15] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260603-bleach-arming-247f1b0fb87b@spud>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
 <20260529171509.1163787-14-vladimir.oltean@nxp.com>
 <20260602-reviving-aging-a7d066d2448b@spud>
 <20260603115654.k4v7cayysvy7yte4@skbuf>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tvg35FipqBaZkrlN"
Content-Disposition: inline
In-Reply-To: <20260603115654.k4v7cayysvy7yte4@skbuf>


--tvg35FipqBaZkrlN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 02:56:54PM +0300, Vladimir Oltean wrote:
> On Tue, Jun 02, 2026 at 06:10:30PM +0100, Conor Dooley wrote:
> > On Fri, May 29, 2026 at 08:15:07PM +0300, Vladimir Oltean wrote:
> > > Add a schema for the 10G Lynx SerDes. This is very similar to the mod=
ern
> > > form of the 28G Lynx SerDes, which is very much the intention.
> > >=20
> > > We allow both forms of #phy-cells =3D <1> in the top-level provider
> > > and #phy-cells =3D <0> in the per-lane provider for more flexibility =
to
> > > consumers, and because the kernel code is shared with the 28G Lynx wh=
ich
> > > already has that support for compatibility reasons.
> > >=20
> > > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > ---
> > > Cc: devicetree@vger.kernel.org
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> > >=20
> > > v1->v2:
> > > - move patch later in series, right before driver
> > > - deliberately ignoring this Sashiko feedback:
> > >   https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@s=
kbuf/
> > > ---
> > >  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++=
++
> > >  1 file changed, 131 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10=
g.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml =
b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > new file mode 100644
> > > index 000000000000..993f076bba4e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > @@ -0,0 +1,131 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale Lynx 10G SerDes PHY
> > > +
> > > +maintainers:
> > > +  - Vladimir Oltean <vladimir.oltean@nxp.com>
> > > +
> > > +description:
> > > +  The 10G Lynx is a multi-protocol SerDes block which handles networ=
king, PCIe,
> > > +  SATA and other high-speed interfaces. It is present on most QorIQ =
and
> > > +  Layerscape SoCs. The register map is common, but the integration is
> > > +  SoC-specific, with the differences consisting in register endianne=
ss, the
> > > +  number of lanes, protocol converters available per lane and their =
location in
> > > +  the PCCR registers. Some SoCs have multiple SerDes blocks and thos=
e differ in
> > > +  their protocol capabilities per lane.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    description:
> > > +      There is intentionally no generic fsl,lynx-10g compatible stri=
ng due to
> > > +      the hardware inability to report its capabilities, despite hav=
ing a
> > > +      common register map.
> >=20
> > I think you can probably drop this from the diff, and put it in the
> > commit message.
>=20
> Ok.
>=20
> > > +    enum:
> > > +      - fsl,ls1028a-serdes
> > > +      - fsl,ls1046a-serdes1
> > > +      - fsl,ls1046a-serdes2
> > > +      - fsl,ls1088a-serdes1
> > > +      - fsl,ls1088a-serdes2
> > > +      - fsl,ls2088a-serdes1
> > > +      - fsl,ls2088a-serdes2
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  big-endian: true
> >=20
> > This isn't a required property, but should it be made required for the
> > specific compatibles that are big endian? Or are we not that lucky, and
> > devices can be either?
>=20
> I can make big-endian a required property for fsl,ls1046a-serdes1 and
> fsl,ls1046a-serdes2.


Please do. In that case,
pw-bot: changes-requested

Cheers,
Conor.

--tvg35FipqBaZkrlN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBDrAAKCRB4tDGHoIJi
0qDgAQDqja67Y3bn5A9b3EDzCfoLaN2NFBUyf10W0X5fB4qOEQEAi3cLwgcPSKw1
vD0fQbVfS2rXwauVMhQ6roFQUAeRoQY=
=i/vn
-----END PGP SIGNATURE-----

--tvg35FipqBaZkrlN--
